/**
 * @file    main.c
 * @brief   Simple LED Blink Demo for EFM32GG_STK3700
 * @version 1.1
 *
 * @note    Just blinks the LEDs of the STK3700
 *
 * @note    LEDs are on pins 2 and 3 of GPIO Port E
 *
 * @note    It uses a primitive delay mechanism. Do not use it.
 *
 * @author  Hans
 * @date    01/09/2018
 */

#include "em_cmu.h"
#include "em_device.h"
#include "em_gpio.h"
#include "spidrv.h"
#include <stdint.h>

/**
 * @brief  Main function
 *
 * @note   Using default clock configuration
 * @note   HFCLK     = HFRCO 14 MHz
 * @note   HFCORECLK = HFCLK
 * @note   HFPERCLK  = HFCLK

 */
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

void TransferComplete(SPIDRV_Handle_t handle, Ecode_t transferStatus,
                      int itemsTransferred) {
  if (transferStatus == ECODE_EMDRV_SPIDRV_OK) {
    // Success !
  }
}

int main(void) {
  uint8_t buffer[10];
  Ecode_t retval;
  SPIDRV_Init_t initData = SPIDRV_MASTER_USART1;
  CMU_ClockEnable(cmuClock_GPIO, true);

  // Initialize an SPI driver instance.
  retval = SPIDRV_Init(handle, &initData);
  if (retval != ECODE_OK) {
    GPIO_PinModeSet(gpioPortE, 2 /*pin 4*/,
                    gpioModePushPull /*push-pull output*/, 1 /*output level*/);
    return -1;
  }

  // Transmit data using a blocking transmit function.
  SPIDRV_MTransmitB(handle, buffer, 10);
  if (retval != ECODE_OK) {
    GPIO_PinModeSet(gpioPortE, 2 /*pin 4*/,
                    gpioModePushPull /*push-pull output*/, 1 /*output level*/);
    return -1;
  }

  // Transmit data using a callback to catch transfer completion.
  SPIDRV_MTransmit(handle, buffer, 10, TransferComplete);
  if (retval != ECODE_OK) {
    GPIO_PinModeSet(gpioPortE, 2 /*pin 4*/,
                    gpioModePushPull /*push-pull output*/, 1 /*output level*/);
    return -1;
  }
  GPIO_PinModeSet(gpioPortE, 2 /*pin 4*/, gpioModePushPull /*push-pull output*/,
                  1 /*output level*/);
  return 0;
}
