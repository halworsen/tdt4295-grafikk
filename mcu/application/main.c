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

struct mat4 {
  float data[16];
};

struct vect {
  float x;
  float y;
  float z;
  float w;
};

uint32_t ch1_sample;
uint32_t ch2_sample;
uint32_t adcChannel = 0;
ADC_InitSingle_TypeDef initSingle = ADC_INITSINGLE_DEFAULT;

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0x5555);
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void TIMER1_IRQHandler(void) {
  TIMER_IntClear(TIMER1, 1);
  if (adcChannel)
    initSingle.input = adcSingleInputCh0;
  else
    initSingle.input = adcSingleInputCh1;
  ADC_InitSingle(ADC0, &initSingle);
  ADC_Start(ADC0, adcStartSingle);
  adcChannel = !adcChannel;
}

void ADC0_IRQHandler(void) {
  ADC_IntClear(ADC0, ADC_IFC_SINGLE);
  uint32_t sample = ADC_DataSingleGet(ADC0);
  if (adcChannel)
    ch1_sample = sample;
  else
    ch2_sample = sample;

  if (ch1_sample > 2000)
    GPIO_PinOutSet(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
  else
    GPIO_PinOutClear(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);

  if (ch2_sample > 2000)
    GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
  else
    GPIO_PinOutClear(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
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
