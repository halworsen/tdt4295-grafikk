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

#define SPI_BITRATE 12500000

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define NUM_FIGURES1 22
#define NUM_FIGURES2 3
#define NUM_FIGURES3 5
#define NUM_FIGURES4 3

#define Z_STEP_SIZE 0.03
#define X_STEP_SIZE 0.03
#define ROTATION_STEP_SIZE 0.03

#define MAX_Z 0.95
#define MIN_Z -1.3

#define MAX_X 0.9
#define MIN_X -0.9

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

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(*array))

// Joystick ADC voltage samples.
uint32_t left_vertical;
uint32_t left_horizontal;
uint32_t right_vertical;
uint32_t right_horizontal;
uint32_t adcChannel = 0;

// Model position.
float x = 0;
float z = 0;

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
struct fpga_package figures1[NUM_FIGURES1];
struct fpga_package figures2[NUM_FIGURES2];
struct fpga_package figures3[NUM_FIGURES3];
struct fpga_package figures4[NUM_FIGURES4];
int num_figures[4] = {NUM_FIGURES1, NUM_FIGURES2, NUM_FIGURES3, NUM_FIGURES4};
struct fpga_package *figures[4] = {figures1, figures2, figures3, figures4};
int figure_num = 1;

bool start = false;
volatile bool can_press = false;

void calc_pos() {
  // Calculates the MVP matrix
  double scale;

  // Change Z-position
  scale = (double)left_vertical / MAX_SAMPLE;
  float dz = -(2 * scale - 1.0) * Z_STEP_SIZE;
  z -= dz;
  z = fmaxf(MIN_Z, z);
  z = fminf(MAX_Z, z);

  // Change X-position
  scale = (double)left_horizontal / MAX_SAMPLE;
  float dx = (2 * scale - 1.0) * X_STEP_SIZE;
  x += dx;
  x = fmaxf(MIN_X, x);
  x = fminf(MAX_X, x);

  // Change rotation
  scale = (double)right_horizontal / MAX_SAMPLE;
  float p = (2 * scale - 1.0);

  scale = (double)right_vertical / MAX_SAMPLE;
  float q = (2 * scale - 1.0);

  // Theta is the current angle of the joystick.
  th_y += p * ROTATION_STEP_SIZE;
  th_x += q * ROTATION_STEP_SIZE;
}

void calc_mat(mat4_t *mat) {

  mat4_t M, Ryx, Rx, Ry, T; // rotation and translation matrices.

  // Rotate by theta radians, with slight tilt.
  rot_y(&Ry, th_y);
  rot_x(&Rx, th_x);

  mmul(&Ryx, &Ry, &Rx);

  float trans_z = 15.0 - z * 15; // move into the clip box.
  translation(&T, x, 0, trans_z);

  // Create the model matrix; a combination of rotation and translation.
  mmul(&M, &T, &Ryx);

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

void btn_handler() {
  GPIO_IntClear(0xFFFF);
  if (can_press) {
    x = 0;
    z = 0;
    th_x = 0;
    th_y = 0;

    GPIO_PinOutToggle(gpioPortE, LED1_PIN);
    if (start)
      figure_num =
          figure_num == (ARRAY_SIZE(num_figures) - 1) ? 0 : figure_num + 1;
    start = true;
    can_press = false;
  }
}

void GPIO_EVEN_IRQHandler(void) { btn_handler(); }

void GPIO_ODD_IRQHandler(void) { btn_handler(); }

void TIMER1_IRQHandler(void) {
  TIMER_IntClear(TIMER1, TIMER_IF_OF);
  TIMER_IntDisable(TIMER1, TIMER_IF_OF);
  if (start) {
    calc_pos();
    calc_mat(&matrix);
    ADC_Start(ADC0, adcStartScan);
    // the model (verts and lines) are already in the package,
    // al we need to do is re-calculate the MVP and sen.
    if (GPIO_PinInGet(gpioPortB, FPGA_DONE_PIN)) {
      transmit_figures(figures[figure_num], num_figures[figure_num], &matrix);
    }
  }
  can_press = true;
  TIMER_IntEnable(TIMER1, TIMER_IF_OF);
}

void ADC0_IRQHandler(void) {
  uint32_t sample;
  uint32_t id;

  ADC_IntClear(ADC0, ADC_IF_SCAN);
  ADC_IntClear(ADC0, ADC_IF_SCANOF);
  for (int i = 0; i < 4; i++) {
    sample = ADC_DataIdScanGet(ADC0, &id);
    // dead zone for joysticks
    if (sample > 2000 && sample < 2150)
      sample = 2048;

    if (id == 0) {
      // Increased dead for right_horizontal
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
  uint32_t clock_freq = 0;
  init_figures1(figures1);
  init_figures2(figures2);
  init_figures3(figures3);
  init_figures4(figures4);
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer1(60);
  initADC_scan(adcRefVDD);
  TIMER_Enable(TIMER1, true);

  SPIDRV_Init_t initData = SPIDRV_MASTER_USART3;
  initData.bitOrder = spidrvBitOrderMsbFirst;
  SPIDRV_Init(handle, &initData);
  SPIDRV_SetBitrate(handle, SPI_BITRATE);
  SPIDRV_GetBitrate(handle, &bitrate);
  clock_freq = CMU_ClockFreqGet(cmuClock_HF);

  GPIO_PinOutSet(gpioPortE, LED1_PIN);
  if (bitrate != SPI_BITRATE || clock_freq != 50000000)
    GPIO_PinOutSet(gpioPortE, LED2_PIN);

  while (1) {
  }
}
