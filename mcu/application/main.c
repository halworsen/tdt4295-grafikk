#include "bsp.h"
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

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0x5555);
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void TIMER1_IRQHandler(void) {
  TIMER_IntClear(TIMER1, 1);
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void initTimer(void) {
  CMU_ClockEnable(cmuClock_TIMER1, true);
  TIMER_Init_TypeDef init = TIMER_INIT_DEFAULT;
  init.enable = false;
  init.prescale = timerPrescale1024;
  TIMER_Init(TIMER1, &init);
  TIMER_TopSet(TIMER1, 1000000000);
  TIMER_IntEnable(TIMER1, 1);
  NVIC_EnableIRQ(TIMER1_IRQn);
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
