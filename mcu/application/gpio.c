#include "bsp.h"
#include "em_cmu.h"
#include "em_gpio.h"

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
