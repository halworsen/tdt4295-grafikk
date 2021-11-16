#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_gpio.h"

#define js0_vertical adcPosSelAPORT1XCH12
#define js0_horizontal adcPosSelAPORT1XCH14
#define js1_vertical adcPosSelAPORT0XCH6
#define js1_horizontal adcPosSelAPORT1XCH8

extern ADC_InitScan_TypeDef initScan;

void initADC_scan(int ref) {
  CMU_ClockEnable(cmuClock_ADC0, true);
  ADC_Init_TypeDef init = ADC_INIT_DEFAULT;
  init.prescale = 255;
  ADC_Init(ADC0, &init);
  initScan.reference = ref;
  // H joystick 0
  ADC_ScanSingleEndedInputAdd(&initScan, 0, js0_vertical);
  ADC_ScanSingleEndedInputAdd(&initScan, 0, js0_horizontal);
  ADC_ScanSingleEndedInputAdd(&initScan, 1, js1_vertical);
  ADC_ScanSingleEndedInputAdd(&initScan, 0, js1_horizontal);

  ADC_InitScan(ADC0, &initScan);

  // Enable interrupts
  ADC_IntEnable(ADC0, ADC_IEN_SCAN);
  ADC_IntEnable(ADC0, ADC_IEN_SCANOF);
  NVIC_EnableIRQ(ADC0_IRQn);
}
