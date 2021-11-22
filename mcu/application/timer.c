#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_timer.h"
#define PRESCALE 1024

extern uint32_t adcChannel;
extern ADC_InitSingle_TypeDef initSingle;

void initTimer1(int ints_per_second) {
  CMU_ClockEnable(cmuClock_TIMER1, true);
  TIMER_Init_TypeDef init = TIMER_INIT_DEFAULT;
  init.enable = false;
  init.prescale = timerPrescale1024;
  TIMER_Init(TIMER1, &init);
  uint32_t top = CMU_ClockFreqGet(cmuClock_TIMER1) / (1024 * ints_per_second);
  TIMER_TopSet(TIMER1, top);
  TIMER_IntEnable(TIMER1, TIMER_IEN_OF);
  NVIC_EnableIRQ(TIMER1_IRQn);
}

void initTimer2(int ints_per_second) {
  CMU_ClockEnable(cmuClock_TIMER2, true);
  TIMER_Init_TypeDef init = TIMER_INIT_DEFAULT;
  init.enable = false;
  init.prescale = timerPrescale1024;
  TIMER_Init(TIMER2, &init);
  uint32_t top = CMU_ClockFreqGet(cmuClock_TIMER2) / (1024 * ints_per_second);
  TIMER_TopSet(TIMER2, top);
  TIMER_IntEnable(TIMER2, TIMER_IEN_OF);
  NVIC_EnableIRQ(TIMER2_IRQn);
}
