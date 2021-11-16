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

#define SPI_BITRATE 1000000

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define MAX_DY 200 /* maximal y-offset from the center */

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
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;
ADC_InitScan_TypeDef initScan = ADC_INITSCAN_DEFAULT;

// Array containing the verts of the model (in model coordinates).
vec3_t square[4];

/* FPGA package. */
// For now this uses some structs representing pixel coordinates,
// instead of the "proper" linalg structures, just to get a simple
// indexed MVP going.

// A Point (essentially a pixel coordinate).
typedef struct point {
  int16_t x;
  int16_t y;
} point_t;

// A Line is two indexes into the array of points.
typedef struct line {
  uint16_t start;
  uint16_t end;
} line_t;

// The complete fpga package.
#define NUM_POINTS 4
#define NUM_LINES 4
struct {
  point_t points[NUM_POINTS];
  line_t lines[NUM_LINES];
} fpga_package;

void calc_points(uint32_t ch1_sample, uint32_t ch2_sample) {
  // This starts with our model square [-1, 1] x [-1, 1], and
  // applies a scale-, a rotation-, and a translation-transform
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
  scale = (double)ch1_sample / MAX_SAMPLE;
  float y = (2 * scale - 1.0) * MAX_DY; // [-MAX_DY, MAX_DY]

  // Channel 2 determines rotation theta.
  scale = (double)ch2_sample / MAX_SAMPLE;
  float th = (2 * scale - 1.0) * M_PI;

  float zoom = 30.0;
  mat3_t S, R, T; // scaling, rotation and translation matrices.

  // Scale x,y coordinates by zoom level.
  mat3(&S, zoom, 0.0, 0.0, 0.0, zoom, 0.0, 0.0, 0.0, 1.0);

  // Rotate by theta radians.
  rot3(&R, th);

  // Translate to center of the screen +/- y-offset.
  translation3(&T, DISPLAY_WIDTH / 2, (DISPLAY_HEIGHT / 2) + y);

  // Create the "final" transformation matrix.
  mat3_t SR, TSR;
  mmul3(&SR, &S, &R);
  mmul3(&TSR, &T, &SR);

  // Iterate over the vertices.
  for (int i = 0; i < NUM_POINTS; i++) {
    // Calculate transformed vertex q = (TSR)v for all v in the square.
    vec3_t q;
    transform3(&q, &TSR, &square[i]);

    // Put the transformed coordinates in the package point array.
    // These are already floats in pixel-coordinates, so we only
    // need to cast them to int16, and then they are ready.
    fpga_package.points[i].x = (int16_t)q.x;
    fpga_package.points[i].y = (int16_t)q.y;
  }
}

void transmit_fpga_package() {
  // Transmit the FPGA package.
  // This works by first preparing the bitstream as a byte-array,
  // by iterating over the package and manually placing the bytes
  // from the package in the right order.
  uint8_t bitstream[sizeof(fpga_package)];

  /* Prepare the verts. */

  for (int i = 0; i < 4; i++) {
    bitstream[4 * i] = (fpga_package.points[i].x >> 8) & 0xFF;
    bitstream[4 * i + 1] = fpga_package.points[i].x & 0xFF;
    bitstream[4 * i + 2] = (fpga_package.points[i].y >> 8) & 0xFF;
    bitstream[4 * i + 3] = fpga_package.points[i].y & 0xFF;
  }

  /* Prepare the lines. */

  // The lines start directly after the points.
  int line_offset = NUM_POINTS * sizeof(point_t);

  for (int i = 0; i < 4; i++) {
    bitstream[line_offset + 4 * i] = (fpga_package.lines[i].start >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 1] = fpga_package.lines[i].start & 0xFF;
    bitstream[line_offset + 4 * i + 2] =
        (fpga_package.lines[i].end >> 8) & 0xFF;
    bitstream[line_offset + 4 * i + 3] = fpga_package.lines[i].end & 0xFF;
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
  calc_points(MAX_SAMPLE - right_vertical, MAX_SAMPLE - left_horizontal);
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
  vec3(&square[0], -1.0, 1.0, 1.0);
  vec3(&square[1], -1.0, -1.0, 1.0);
  vec3(&square[2], 1.0, -1.0, 1.0);
  vec3(&square[3], 1.0, 1.0, 1.0);

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
  initTimer(30);
  initADC_scan(adcRefVDD);
  TIMER_Enable(TIMER1, true);

  SPIDRV_Init_t initData = SPIDRV_MASTER_USART3;
  SPIDRV_Init(handle, &initData);
  SPIDRV_SetBitrate(handle, SPI_BITRATE);
  SPIDRV_GetBitrate(handle, &bitrate);

  GPIO_PinOutSet(gpioPortE, LED1_PIN);
  if (bitrate != SPI_BITRATE)
    GPIO_PinOutSet(gpioPortE, LED2_PIN);

  while (1) {
  }
}
