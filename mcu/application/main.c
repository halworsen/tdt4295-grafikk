#include "bsp.h"
#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "em_timer.h"
#include "spidrv.h"

struct mat4 {
  float data[16];
};

struct vect {
  float x;
  float y;
  float z;
  float w;
};

uint32_t sample;
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
  sample = ADC_DataSingleGet(ADC0);
  if (adcChannel) {
    if (sample > 2000)
      GPIO_PinOutSet(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
    else
      GPIO_PinOutClear(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);

  } else {
    if (sample > 2000)
      GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
    else
      GPIO_PinOutClear(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
  }
}

void initTimer(void) {
  CMU_ClockEnable(cmuClock_TIMER1, true);
  TIMER_Init_TypeDef init = TIMER_INIT_DEFAULT;
  init.enable = false;
  init.prescale = timerPrescale1024;
  TIMER_Init(TIMER1, &init);
  uint32_t top = CMU_ClockFreqGet(cmuClock_TIMER1) / (1024 * 30);
  TIMER_TopSet(TIMER1, top);
  TIMER_IntEnable(TIMER1, 1);
  NVIC_EnableIRQ(TIMER1_IRQn);
}

void initADC(void) {
  CMU_ClockEnable(cmuClock_ADC0, true);
  ADC_Init_TypeDef init = ADC_INIT_DEFAULT;
  ADC_Init(ADC0, &init);
  initSingle.reference = adcRefVDD;
  ADC_InitSingle(ADC0, &initSingle);

  // Enable interrupts
  ADC_IntEnable(ADC0, ADC_IEN_SINGLE);
  NVIC_EnableIRQ(ADC0_IRQn);
}

void initGPIO(void) {
  CMU_ClockEnable(cmuClock_GPIO, true);

  GPIO_PinModeSet(gpioPortB, BSP_GPIO_PB0_PIN, gpioModeInputPullFilter, 1);
  GPIO_PinModeSet(gpioPortB, BSP_GPIO_PB1_PIN, gpioModeInputPullFilter, 1);

  GPIO_PinModeSet(gpioPortE, BSP_GPIO_LED0_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(gpioPortE, BSP_GPIO_LED1_PIN, gpioModePushPull, 0);

  NVIC_EnableIRQ(GPIO_EVEN_IRQn);

  GPIO_ExtIntConfig(BSP_GPIO_PB1_PORT, BSP_GPIO_PB1_PIN, BSP_GPIO_PB1_PIN, 0, 1,
                    true);
}

int main(void) {
  // uint32_t bitrate = 0;

  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer();
  initADC();
  TIMER_Enable(TIMER1, true);
  /*
  SPIDRV_SetBitrate(handle, 6000000);
  SPIDRV_GetBitrate(handle, &bitrate);
  if (bitrate != 6000000)
    GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
  */

  while (1) {
  }
}
