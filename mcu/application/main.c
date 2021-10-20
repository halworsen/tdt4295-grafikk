#include "adc.h"
#include "bsp.h"
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

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define MIN_X 40
#define MIN_Y 60
#define MAX_X 440
#define MAX_Y 600

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

uint32_t ch1_sample;
uint32_t ch2_sample;
uint32_t adcChannel = 0;
ADC_InitSingle_TypeDef initSingle = ADC_INITSINGLE_DEFAULT;

void calc_points(uint32_t ch1_sample, uint32_t ch2_sample, int *coordinates) {
  double scale;
  int x;
  int y;

  scale = (double)ch1_sample / MAX_SAMPLE;
  x = scale * MAX_X;
  x = min(x, MAX_X);
  x = max(x, MIN_X);

  scale = (double)ch2_sample / MAX_SAMPLE;
  y = scale * MAX_Y;
  y = min(y, MAX_Y);
  y = max(y, MIN_Y);

  coordinates[0] = x;
  coordinates[1] = y;
}

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0x5555);
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void TIMER1_IRQHandler(void) {
  int coordinates[2] = {MIN_X, MIN_Y};

  TIMER_IntClear(TIMER1, 1);
  if (adcChannel)
    initSingle.input = adcSingleInputCh0;
  else
    initSingle.input = adcSingleInputCh1;
  ADC_InitSingle(ADC0, &initSingle);
  ADC_Start(ADC0, adcStartSingle);
  adcChannel = !adcChannel;
  calc_points(ch1_sample, ch2_sample, coordinates);
}

void ADC0_IRQHandler(void) {
  ADC_IntClear(ADC0, ADC_IFC_SINGLE);
  uint32_t sample = ADC_DataSingleGet(ADC0);
  if (adcChannel)
    ch1_sample = sample;
  else
    ch2_sample = sample;
}

int main(void) {
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer(30);
  initADC_single(adcRefVDD);
  TIMER_Enable(TIMER1, true);

  while (1) {
  }
}
