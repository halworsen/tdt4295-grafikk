#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_gpio.h"

extern ADC_InitScan_TypeDef initScan;

void initADC_scan(int ref) {
  CMU_ClockEnable(cmuClock_ADC0, true);
  ADC_Init_TypeDef init = ADC_INIT_DEFAULT;
  init.prescale = 255;
  ADC_Init(ADC0, &init);
  initScan.reference = ref;
  // H joystick 0
  ADC_ScanSingleEndedInputAdd(&initScan, 0, adcPosSelAPORT1XCH14);
  ADC_ScanSingleEndedInputAdd(&initScan, 0, adcPosSelAPORT1XCH8);

  ADC_InitScan(ADC0, &initScan);

  // Enable interrupts
  ADC_IntEnable(ADC0, ADC_IEN_SCAN);
  ADC_IntEnable(ADC0, ADC_IEN_SCANOF);
  NVIC_EnableIRQ(ADC0_IRQn);
}
