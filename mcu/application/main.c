#include "adc.h"
#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "em_timer.h"
#include "gpio.h"
#include "spidrv.h"
#include "timer.h"

#include "linalg.h"
#include <math.h>

#define SPI_BITRATE 4000000

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define max(a, b)                                                              \
  ({                                                                           \
    __typeof__(a) _a = (a);                                                    \
    __typeof__(b) _b = (b);                                                    \
    _a > _b ? _a : _b;                                                         \
  })

#define min(a, b)                                                              \
  ({                                                                           \
    __typeof__(a) _a = (a);                                                    \
    __typeof__(b) _b = (b);                                                    \
    _a < _b ? _a : _b;                                                         \
  })

// Joystick ADC voltage samples.
uint32_t left_vertical;
uint32_t left_horizontal;
uint32_t right_vertical;
uint32_t right_horizontal;
uint32_t adcChannel = 0;

// Model position.
float x = 0;
float y = 0;

// Handle for the FPGA output.
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

// Handle for the debug output.
SPIDRV_HandleData_t handleData2;
SPIDRV_Handle_t handle2 = &handleData;

ADC_InitScan_TypeDef initScan = ADC_INITSCAN_DEFAULT;

/* FPGA package. */
// For now this uses some structs representing pixel coordinates,
// instead of the "proper" linalg structures, just to get a simple
// indexed MVP going.

// A points representation in the fpga package.
// This is used to calculate offsets with `sizeof`.
typedef struct fpga_point {
  int16_t x;
  int16_t y;
  int16_t z;
  int16_t w;
} fpga_point_t;

// A Line is two indexes into the array of points.
// A line has identical size in its package representation, so
// offsets can be calculated by taking the `sizeof` this struct.
typedef struct line {
  uint16_t start;
  uint16_t end;
} line_t;

// FPGA package representation of a matrix. This is used to
// calculate offsets using `sizeof`.
typedef struct mat4_send {
  int16_t data[16];
} mat4_send_t;


// The complete fpga package.
#define NUM_VERTS 8
#define NUM_LINES 12
struct {
  vec4_t verts[NUM_VERTS];
  line_t lines[NUM_LINES];
  mat4_t mat;
} fpga_package;

// The bitstream representation of the package. This is used
// to calculate offsets using `sizeof`.
struct {
  fpga_point_t points[NUM_VERTS];
  line_t lines[NUM_LINES];
  mat4_send_t mat;
} fpga_package_send;

void calc_mvp() {
  // Calculates the MVP matrix and stores it in the fpga
  // package.

  double scale; // normalized potentiometer position [0, 1]

  // Channel 1 determines vertical offset y.
  scale = (double)left_vertical / MAX_SAMPLE;
  float max_dy = 0.03;
  float dy = (2 * scale - 1.0) * max_dy; // [-max_dy, max_dy]
  y += dy;

  scale = (double)left_horizontal / MAX_SAMPLE;
  float max_dx = 0.03;
  float dx = -(2 * scale - 1.0) * max_dx; // [-max_dy, max_dy]
  x += dx;

  // Channel 2 determines rotation theta.
  scale = (double)right_horizontal / MAX_SAMPLE;
  float p = (2 * scale - 1.0);

  scale = (double)right_vertical / MAX_SAMPLE;
  float q = (2 * scale - 1.0);

  // Theta is the current angle of the joystick.
  float th = -atan2(q, p);

  mat4_t M, Ryz, Rz, Ry, T; // rotation and translation matrices.

  // Rotate by theta radians, with slight tilt.
  rot_y(&Ry, th);
  rot_z(&Rz, M_PI / 6.0);
  mmul(&Ryz, &Ry, &Rz);

  // Translate to x=0,y=dy, dy in [-max_dy, max_dy]
  float z = 10.0; // move into the clip box.
  translation(&T, x, y, z);

  // Create the model matrix; a combination of rotation and translation.
  mmul(&M, &T, &Ryz);

  // Projection matrix.
  mat4_t P;
  // Aspect ratio and clipping planes.
  float aspect = DISPLAY_WIDTH / ((float) DISPLAY_HEIGHT);

  //ortho(&P, -aspect, aspect, -1.0, 1.0, -2.0, 100.0);
  perspective(&P, 1.0 /* FOV, radians */, aspect, 0.1 /* z_near */, 100.0 /* z_far */);




  // Create the "final" transformation matrix.
  mmul(&fpga_package.mat, &P, &M);
}

void transmit_fpga_package() {
  // Transmit the FPGA package.
  // This works by first preparing the bitstream as a byte-array,
  // by iterating over the package and manually placing the bytes
  // from the package in the right order.

  uint8_t bitstream[sizeof(fpga_package_send)] = {0};

  for (int i = 0; i < NUM_VERTS; i++) {
    // Calculate fixpoint representation with 12-bit scaling.
    int16_t x = fpga_package.verts[i].x * (1 << 12);
    int16_t y = fpga_package.verts[i].y * (1 << 12);
    int16_t z = fpga_package.verts[i].z * (1 << 12);
    int16_t w = fpga_package.verts[i].w * (1 << 12);

    // Put the fixpoint number in the bitstream.
    bitstream[sizeof(fpga_point_t) * i] = (x >> 8) & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 1] = x & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 2] = (y >> 8) & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 3] = y & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 4] = (z >> 8) & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 5] = z & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 6] = (w >> 8) & 0xFF;
    bitstream[sizeof(fpga_point_t) * i + 7] = w & 0xFF;
  }

  /* Prepare the lines. */

  // The lines start directly after the vertices.
  int line_offset = NUM_VERTS * sizeof(fpga_point_t);

  for (int i = 0; i < NUM_LINES; i++) {
    bitstream[line_offset + 4 * i] = (fpga_package.lines[i].start >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 1] = fpga_package.lines[i].start & 0xFF;
    bitstream[line_offset + 4 * i + 2] =
        (fpga_package.lines[i].end >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 3] = fpga_package.lines[i].end & 0xFF;
  }

  /* Prepare the matrix. */

  // The matrix starts after the verts and lines.
  int matrix_offset = line_offset + NUM_LINES * sizeof(line_t);

  // Note: Our matrices are row-major, but we have to send them in
  // reverse order to accomodate the easiest way to index the matrix
  // on the FPGA side.
  for (int i = 0; i < 16; i++) {
    int k = 15 - i;
    int16_t fix_point_data = fpga_package.mat.data[i] * (1 << 12);
    bitstream[matrix_offset + 2 * k] = (fix_point_data >> 8) & 0xFF;
    bitstream[matrix_offset + 2 * k + 1] = fix_point_data & 0xFF;
  }

  SPIDRV_MTransmitB(handle, bitstream, sizeof(bitstream));
}

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0xFFFF);
  GPIO_PinOutToggle(gpioPortE, LED1_PIN);
}

void TIMER1_IRQHandler(void) {
  TIMER_IntClear(TIMER1, 1);
  ADC_Start(ADC0, adcStartScan);

  // the model (verts and lines) are already in the package,
  // al we need to do is re-calculate the MVP and sen.
  calc_mvp();
  if (GPIO_PinInGet(gpioPortB, FPGA_DONE_PIN))
    transmit_fpga_package();
}

void ADC0_IRQHandler(void) {
  uint32_t sample;
  uint32_t id;

  ADC_IntClear(ADC0, ADC_IF_SCAN);
  ADC_IntClear(ADC0, ADC_IF_SCANOF);
  for (int i = 0; i < 4; i++) {
    sample = ADC_DataIdScanGet(ADC0, &id);
    if (sample > 2000 && sample < 2150)
      sample = 2048;

    if (id == 0)
      right_horizontal = sample;
    else if (id == 4)
      left_vertical = sample;
    else if (id == 6)
      left_horizontal = sample;
    else if (id == 14)
      right_vertical = sample;
  }
}

int main(void) {
  // Create the model (the square with w=1).
  vec4_t* cube = fpga_package.verts;
  vec4(&cube[0], -.1, .1, .1, 1.0);
  vec4(&cube[1], -.1, -.1, .1, 1.0);
  vec4(&cube[2], .1, -.1, .1, 1.0);
  vec4(&cube[3], .1, .1, .1, 1.0);

  vec4(&cube[4], -.1, .1, -.1, 1.0);
  vec4(&cube[5], -.1, -.1, -.1, 1.0);
  vec4(&cube[6], .1, -.1, -.1, 1.0);
  vec4(&cube[7], .1, .1, -.1, 1.0);

  // Hard coded to lines connect the lines sequentially.
  fpga_package.lines[0].start = 0;
  fpga_package.lines[0].end = 1;
  fpga_package.lines[1].start = 1;
  fpga_package.lines[1].end = 2;
  fpga_package.lines[2].start = 2;
  fpga_package.lines[2].end = 3;
  fpga_package.lines[3].start = 3;
  fpga_package.lines[3].end = 0;

  fpga_package.lines[4].start = 4;
  fpga_package.lines[4].end = 5;
  fpga_package.lines[5].start = 5;
  fpga_package.lines[5].end = 6;
  fpga_package.lines[6].start = 6;
  fpga_package.lines[6].end = 7;
  fpga_package.lines[7].start = 7;
  fpga_package.lines[7].end = 4;

  fpga_package.lines[8].start = 0;
  fpga_package.lines[8].end = 4;
  fpga_package.lines[9].start = 1;
  fpga_package.lines[9].end = 5;
  fpga_package.lines[10].start = 2;
  fpga_package.lines[10].end = 6;
  fpga_package.lines[11].start = 3;
  fpga_package.lines[11].end = 7;

  uint32_t bitrate = 0;
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer(30);
  initADC_scan(adcRefVDD);
  TIMER_Enable(TIMER1, true);

  SPIDRV_Init_t initData = SPIDRV_MASTER_USART3;
  initData.bitOrder = spidrvBitOrderMsbFirst;
  SPIDRV_Init(handle, &initData);
  SPIDRV_SetBitrate(handle, SPI_BITRATE);
  SPIDRV_GetBitrate(handle, &bitrate);

  GPIO_PinOutSet(gpioPortE, LED1_PIN);
  if (bitrate != SPI_BITRATE)
    GPIO_PinOutSet(gpioPortE, LED2_PIN);

  while (1) {
  }
}
