#include "bsp.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "spidrv.h"

#define SPI_BITRATE 100000

uint8_t TRANSMIT = 0;
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

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
  TRANSMIT = 1;
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void transmitGarbage() {
  int16_t buffer[4] = {0, 0, 100, 100};
  Ecode_t retval;

  retval = SPIDRV_MTransmitB(handle, buffer, sizeof(buffer));
  if (retval != ECODE_EMDRV_SPIDRV_OK)
    GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
  TRANSMIT = 0;
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
  uint32_t bitrate = 0;

  // Initializations
  initGPIO();
  SPIDRV_Init_t initData = SPIDRV_MASTER_USART1;
  initData.bitOrder = spidrvBitOrderMsbFirst;
  SPIDRV_Init(handle, &initData);
  SPIDRV_SetBitrate(handle, SPI_BITRATE);

  SPIDRV_GetBitrate(handle, &bitrate);

  if (bitrate != SPI_BITRATE)
    GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);
  /*
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  */

  while (1) {
    if (TRANSMIT)
      transmitGarbage();
  }
}
