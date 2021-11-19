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

uint32_t left_vertical;
uint32_t left_horizontal;
uint32_t right_vertical;
uint32_t right_horizontal;
uint32_t adcChannel = 0;

float x = 0;
float y = 0;
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

SPIDRV_HandleData_t handleData2;
SPIDRV_Handle_t handle2 = &handleData;
ADC_InitScan_TypeDef initScan = ADC_INITSCAN_DEFAULT;

// Array containing the verts of the model (in model coordinates).
vec3_t square[4];

/* FPGA package. */
// For now this uses some structs representing pixel coordinates,
// instead of the "proper" linalg structures, just to get a simple
// indexed MVP going.

// A Point (generally in [-1, 1] x [-1, 1])
typedef struct point {
  float x;
  float y;
  float w;
} point_t;

typedef struct fpga_point {
  int16_t x;
  int16_t y;
  int16_t z;
  int16_t w;
} fpga_point_t;

// A Line is two indexes into the array of points.
typedef struct line {
  uint16_t start;
  uint16_t end;
} line_t;

typedef struct mat4_send {
  int16_t data[16];
} mat4_send_t;

// The complete fpga package.
#define NUM_POINTS 4
#define NUM_LINES 4
struct {
  point_t points[NUM_POINTS];
  line_t lines[NUM_LINES];
  mat4_t mat;
} fpga_package;

struct {
  fpga_point_t points[NUM_POINTS];
  line_t lines[NUM_LINES];
  mat4_send_t mat;
} fpga_package_send;

void calc_points() {
  // This starts with our model square [-.5, .5] x [-.5, .5], and
  // applies a rotation- and translation-transform
  // defined by potentiometer positions so that changing one
  // will move the square vertically, and changing the other
  // will rotate the square.
  //
  // In total, we end up doing 2 matrix multiplications and
  // 4 matrix-vector multiplications, which is around 60
  // floating point operations per interrupt. At 60 FPS, this
  // means the processor needs to do ~4000 FLOPS.

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

  float th = -atan2(q, p);

  mat4_t R,
      T; // scaling, rotation and translation matrices.

  // Rotate by theta radians.
  rot_z(&R, th);

  // Translate to x=0,y=dy, dy in [-max_dy, max_dy]
  translation(&T, x, y, 0);

  // Create the "final" transformation matrix.
  mmul(&fpga_package.mat, &T, &R);
  for (int i = 0; i < NUM_POINTS; i++) {

    // Put the transformed coordinates in the package point array.
    // These are already floats in pixel-coordinates, so we only
    // need to cast them to int16, and then they are ready.
    fpga_package.points[i].x = (float)square[i].x;
    fpga_package.points[i].y = (float)square[i].y;
    fpga_package.points[i].w = (float)square[i].w;
  }
}

void transmit_fpga_package() {
  // Transmit the FPGA package.
  // This works by first preparing the bitstream as a byte-array,
  // by iterating over the package and manually placing the bytes
  // from the package in the right order.

  uint8_t bitstream[sizeof(fpga_package_send)] = {0};

  for (int i = 0; i < 4; i++) {
    // Calculate fixpoint representation with 12-bit scaling.
    int16_t x = fpga_package.points[i].x * (1 << 12);
    int16_t y = fpga_package.points[i].y * (1 << 12);
    int16_t z = 0;
    int16_t w = fpga_package.points[i].w * (1 << 12);

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

  // The lines start directly after the points.
  int line_offset = NUM_POINTS * sizeof(fpga_point_t);
  int matrix_offset = line_offset + NUM_LINES * sizeof(line_t);

  for (int i = 0; i < 4; i++) {
    bitstream[line_offset + 4 * i] = (fpga_package.lines[i].start >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 1] = fpga_package.lines[i].start & 0xFF;
    bitstream[line_offset + 4 * i + 2] =
        (fpga_package.lines[i].end >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 3] = fpga_package.lines[i].end & 0xFF;
  }
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
  calc_points();
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
  vec3(&square[0], -.1, .1, 1.0);
  vec3(&square[1], -.1, -.1, 1.0);
  vec3(&square[2], .1, -.1, 1.0);
  vec3(&square[3], .1, .1, 1.0);

  // Hard coded to lines connect the lines sequentially.
  fpga_package.lines[0].start = 0;
  fpga_package.lines[0].end = 1;

  fpga_package.lines[1].start = 1;
  fpga_package.lines[1].end = 2;

  fpga_package.lines[2].start = 2;
  fpga_package.lines[2].end = 3;

  fpga_package.lines[3].start = 3;
  fpga_package.lines[3].end = 0;

  // Hard coded to lines connect the lines sequentially.
  fpga_package.lines[0].start = 0;
  fpga_package.lines[0].end = 1;

  fpga_package.lines[1].start = 1;
  fpga_package.lines[1].end = 2;

  fpga_package.lines[2].start = 2;
  fpga_package.lines[2].end = 3;

  fpga_package.lines[3].start = 3;
  fpga_package.lines[3].end = 0;

  uint32_t bitrate = 0;
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer(15);
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
