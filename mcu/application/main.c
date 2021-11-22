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

#include "figures.h"
#include "linalg.h"
#include "serialize.h"
#include <math.h>

#define SPI_BITRATE 1000000

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define NUM_FIGURES 5

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

float th_y = 0;
float th_x = 0;

mat4_t matrix;

// Handle for the FPGA output.
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

// Handle for the debug output.
SPIDRV_HandleData_t handleData2;
SPIDRV_Handle_t handle2 = &handleData;

ADC_InitScan_TypeDef initScan = ADC_INITSCAN_DEFAULT;

// todo: fix type/variable name conflict
struct fpga_package figures[NUM_FIGURES];

void calc_pos() {
  // Calculates the MVP matrix and stores it in the fpga
  // package.

  double scale; // normalized potentiometer position [0, 1]

  // Channel 1 determines vertical offset y.
  scale = (double)left_vertical / MAX_SAMPLE;
  float max_dy = 0.03;
  float dy = -(2 * scale - 1.0) * max_dy; // [-max_dy, max_dy]
  y += dy;

  scale = (double)left_horizontal / MAX_SAMPLE;
  float max_dx = 0.03;
  float dx = (2 * scale - 1.0) * max_dx; // [-max_dy, max_dy]
  x += dx;

  // Channel 2 determines rotation theta.
  scale = (double)right_horizontal / MAX_SAMPLE;
  float p = (2 * scale - 1.0);

  scale = (double)right_vertical / MAX_SAMPLE;
  float q = (2 * scale - 1.0);

  // Theta is the current angle of the joystick.
  th_y += p * 0.03;
  th_x += q * 0.03;
}

void calc_mat(mat4_t *mat) {

  mat4_t M, Ryz, Rx, Rz, Ry, T; // rotation and translation matrices.

  // Rotate by theta radians, with slight tilt.
  rot_y(&Ry, th_y);
  rot_x(&Rx, th_x);
  // rot_z(&Rz, M_PI / 6.0);
  rot_z(&Rz, 0);

  mmul(&Ryz, &Ry, &Rx);

  // Translate to x=x,y=dy, dy in [-max_dy, max_dy]
  float z = 15.0 - y * 15; // move into the clip box.
  translation(&T, x, 0, z);

  // Create the model matrix; a combination of rotation and translation.
  mmul(&M, &T, &Ryz);

  // Projection matrix.
  mat4_t P;
  // Aspect ratio and clipping planes.
  float aspect = DISPLAY_WIDTH / ((float)DISPLAY_HEIGHT);

  // ortho(&P, -aspect, aspect, -1.0, 1.0, -2.0, 100.0);
  perspective(&P, 1.0 /* FOV, radians */, aspect, 0.1 /* z_near */,
              100.0 /* z_far */);

  // Create the "final" transformation matrix.
  mmul(mat, &P, &M);
}

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0xFFFF);
  GPIO_PinOutToggle(gpioPortE, LED1_PIN);
}

void TIMER1_IRQHandler(void) {
  TIMER_IntClear(TIMER1, TIMER_IF_OF);
  ADC_Start(ADC0, adcStartScan);

  // the model (verts and lines) are already in the package,
  // al we need to do is re-calculate the MVP and sen.
  if (GPIO_PinInGet(gpioPortB, FPGA_DONE_PIN)) {
    transmit_figures(figures, NUM_FIGURES, &matrix);
  }
}

void TIMER2_IRQHandler(void) {
  TIMER_IntClear(TIMER2, TIMER_IF_OF);
  calc_pos();
  calc_mat(&matrix);
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

    if (id == 0) {
      if (sample > 2000 && sample < 2200)
        sample = 2048;
      right_horizontal = sample;
    } else if (id == 4)
      left_vertical = sample;
    else if (id == 6)
      left_horizontal = sample;
    else if (id == 14)
      right_vertical = sample;
  }
}

int main(void) {

  uint32_t bitrate = 0;
  init_figures();
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer1(60);
  initTimer2(30);
  initADC_scan(adcRefVDD);
  TIMER_Enable(TIMER1, true);
  TIMER_Enable(TIMER2, true);

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
