#include "gpio.h"
#include "bsp.h"
#include "em_cmu.h"
#include "em_gpio.h"

void initGPIO(void) {
  CMU_ClockEnable(cmuClock_GPIO, true);

  GPIO_PinModeSet(gpioPortB, BTN0_PIN, gpioModeInputPullFilter, 1);
  GPIO_PinModeSet(gpioPortB, BTN1_PIN, gpioModeInputPullFilter, 1);
  GPIO_PinModeSet(gpioPortB, BTN2_PIN, gpioModeInputPullFilter, 1);
  GPIO_PinModeSet(gpioPortB, BTN3_PIN, gpioModeInputPullFilter, 1);

  GPIO_PinModeSet(gpioPortB, FPGA_DONE_PIN, gpioModeInputPullFilter, 1);

  GPIO_PinModeSet(gpioPortE, LED0_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(gpioPortE, LED1_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(gpioPortE, LED2_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(gpioPortE, LED3_PIN, gpioModePushPull, 0);

  NVIC_EnableIRQ(GPIO_EVEN_IRQn);

  GPIO_ExtIntConfig(gpioPortB, BTN0_PIN, BTN0_PIN, 1, 1, true);
  GPIO_ExtIntConfig(gpioPortB, BTN1_PIN, BTN1_PIN, 1, 1, true);
  GPIO_ExtIntConfig(gpioPortB, BTN2_PIN, BTN2_PIN, 1, 1, true);
  GPIO_ExtIntConfig(gpioPortB, BTN3_PIN, BTN3_PIN, 1, 1, true);
}
