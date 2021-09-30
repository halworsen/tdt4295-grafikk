#include "linalg.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_gpio.h"
#include "spidrv.h"
#include <stdint.h>

// This is in the main.c translation unit.
extern SPIDRV_Handle_t handle;

void serialize_scalar(float x) {
    // Reinterpret the float as a fixed-point decimal number.
    int32_t x_fp = (int32_t) (FP_SCALE * x);

    // TODO Verify that FPGA can work with the same endianness as the MCU

    // Send it. (4 bytes)
    SPIDRV_MTransmitB(&handle, &x_fp, 4);
}


void serialize_vec4(vec4 *v) {
    serialize_scalar(v->x);
    serialize_scalar(v->y);
    serialize_scalar(v->z);
    serialize_scalar(v->w);
}

void serialize_mat4(mat4 *m) {
    for (int i = 0; i < 16; i++) {
        serialize_scalar(m->data[i]);
    }
}
