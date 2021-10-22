#include "adc.h"
#include "bsp.h"
#include "em_adc.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "em_timer.h"
#include "gpio.h"
#include "spidrv.h"
#include "timer.h"

#include <math.h>
#include "linalg.h"

#define SPI_BITRATE 1000000

#define MAX_SAMPLE 4096

#define DISPLAY_HEIGHT 480
#define DISPLAY_WIDTH 640

#define MAX_DY 200 /* maximal y-offset from the center */

#define max(a, b)                                                              \
  ({                                                                           \
    __typeof__(a) _a = (a);                                                    \
    __typeof__(b) _b = (b);                                                    \
    _a > _b ? _a : _b;                                                         \
  })

#define min(a, b)                                                              \
  ({                                                                           \
    __typeof__(a) _a = (a);                                                    \
    __typeof__(b) _b = (b);                                                    \
    _a < _b ? _a : _b;                                                         \
  })

uint32_t ch1_sample;
uint32_t ch2_sample;
uint32_t adcChannel = 0;
ADC_InitSingle_TypeDef initSingle = ADC_INITSINGLE_DEFAULT;
SPIDRV_HandleData_t handleData;
SPIDRV_Handle_t handle = &handleData;

vec3_t square[4];

void calc_points(uint32_t ch1_sample, uint32_t ch2_sample, int16_t *coordinates) {
    // This starts with our model square [-1, 1] x [-1, 1], and
    // applies a scale-, a rotation-, and a translation-transform
    // defined by potentiometer positions so that changing one
    // will move the square vertically, and changing the other
    // will rotate the square.
    //
    // In total, we end up doing 2 matrix multiplications and
    // 4 matrix-vector multiplications, which is around 60
    // floating point operations per interrupt. At 60 FPS, this
    // means the processor needs to do ~4000 FLOPS.

    double scale; // normalized potentiometer position [0, 1]

    // Channel 1 determines vertical offset y.
    scale = (double)ch1_sample / MAX_SAMPLE;
    float y = (2 * scale - 1.0) * MAX_DY; // [-MAX_DY, MAX_DY]

    // Channel 2 determines rotation theta.
    scale = (double)ch2_sample / MAX_SAMPLE;
    float th = (2 * scale - 1.0) * M_PI;

    float zoom = 30.0;
    mat3_t S, R, T; // scaling, rotation and translation matrices.

    // Scale x,y coordinates by zoom level.
    mat3(&S, zoom,  0.0, 0.0,
              0.0, zoom, 0.0,
              0.0,  0.0, 1.0);

    // Rotate by theta radians.
    rot3(&R, th);

    // Translate to center of the screen +/- y-offset.
    translation3(&T, DISPLAY_WIDTH / 2, (DISPLAY_HEIGHT / 2) + y);

    // Create the "final" transformation matrix.
    mat3_t SR, TSR;
    mmul3(&SR, &S, &R);
    mmul3(&TSR, &T, &SR);

    // Iterate over the vertices.
    for (int i = 0; i < 4; i++) {
        // Calculate transformed vertex q = (TSR)v for all v in the square.
        vec3_t q;
        transform3(&q, &TSR, &square[i]);

        // Put the transformed coordinates in the coordinate buffer.
        // These are already floats in pixel-coordinates, so we only
        // need to cast them to int16, and then they are ready.
        coordinates[i]     = (int16_t) q.x;
        coordinates[i + 1] = (int16_t) q.y;
    }
}

void transmit_square(int16_t *coordinates) {
    // Transmit the coordinates of a square as 4 pairs of
    // 16-bit integers. This handles changing the byte-
    // order.

    for (int i = 0; i < 8; i++) {
        // Flip the order of the bytes.
        uint8_t bitstream[2];
        bitstream[0] = (coordinates[i] >> 8) & 0xFF;
        bitstream[1] =  coordinates[i]       & 0xFF;

        // Invoke the SPI driver to transfer the bitstream.
        SPIDRV_MTransmitB(handle, bitstream, sizeof(bitstream));
    }
}

void GPIO_EVEN_IRQHandler(void) {
  GPIO_IntClear(0x5555);
  GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);
}

void TIMER1_IRQHandler(void) {
    // The square has 8 coordinates.
    int16_t coordinates[8] = {0};

    TIMER_IntClear(TIMER1, 1);
    if (adcChannel)
        initSingle.input = adcSingleInputCh4;
    else
        initSingle.input = adcSingleInputCh5;
    ADC_InitSingle(ADC0, &initSingle);
    ADC_Start(ADC0, adcStartSingle);
    adcChannel = !adcChannel;

    calc_points(ch1_sample, ch2_sample, coordinates);
    transmit_square(coordinates);
}

void ADC0_IRQHandler(void) {
  ADC_IntClear(ADC0, ADC_IFC_SINGLE);
  uint32_t sample = ADC_DataSingleGet(ADC0);
  if (adcChannel)
    ch1_sample = sample;
  else
    ch2_sample = sample;
}

int main(void) {
  uint32_t bitrate = 0;
  // Initializations
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFXO);
  initGPIO();
  initTimer(30);
  initADC_single(adcRefVDD);
  TIMER_Enable(TIMER1, true);

  // Create the model (the square with w=1).
  vec3(&square[0], -1.0,  1.0, 1.0);
  vec3(&square[1], -1.0, -1.0, 1.0);
  vec3(&square[2],  1.0, -1.0, 1.0);
  vec3(&square[3],  1.0,  1.0, 1.0);

  SPIDRV_Init_t initData = SPIDRV_MASTER_USART1;
  SPIDRV_Init(handle, &initData);
  SPIDRV_SetBitrate(handle, SPI_BITRATE);
  SPIDRV_GetBitrate(handle, &bitrate);

  if (bitrate != SPI_BITRATE)
    GPIO_PinOutSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);

  while (1) {
  }
}
