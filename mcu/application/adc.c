#include "bsp.h"
#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_gpio.h"
extern ADC_InitSingle_TypeDef initSingle;

void initADC_single(int ref) {
  CMU_ClockEnable(cmuClock_ADC0, true);
  ADC_Init_TypeDef init = ADC_INIT_DEFAULT;
  ADC_Init(ADC0, &init);
  initSingle.reference = ref;
  ADC_InitSingle(ADC0, &initSingle);

  // Enable interrupts
  ADC_IntEnable(ADC0, ADC_IEN_SINGLE);
  NVIC_EnableIRQ(ADC0_IRQn);
}
