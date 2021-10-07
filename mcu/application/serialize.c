#include "em_cmu.h"
#include "em_device.h"
#include "em_gpio.h"
#include "spidrv.h"

#include "serialize.h"
#include "linalg.h"

extern SPIDRV_Handle_t handle; /* In main.c translation unit. */

void serialize_scalar(float x) {
    // Reinterpret the float as a fixed-point decimal number.
    int16_t x_fp = (int16_t) (FP_SCALE * x);

    // Send it. (2 bytes)
    SPIDRV_MTransmitB(handle, &x_fp, 2);
}

void serialize_index(uint8_t i) {
    // Serialize a single-byte index.
    // Used for sending index buffers.
    SPIDRV_MTransmitB(handle, &i, 1);
}

void serialize_vec4(vec4_t *v) {
    // Send a vector by sequentially sending its components.
    serialize_scalar(v->x);
    serialize_scalar(v->y);
    serialize_scalar(v->z);
    serialize_scalar(v->w);
}

void serialize_mat4(mat4_t *M) {
    for (int i = 0; i < 16; i++) {
        serialize_scalar(M->data[i]);
    }
}

void serialize_vertex_buffer(vec4_t *vertices, int n) {
    for (int i = 0; i < n; i++) {
        serialize_vec4(&vertices[i]);
    }
}

void serialize_index_buffer(uint8_t *indices, int n) {
    for (int i = 0; i < n; i++) {
        serialize_index(indices[i]);
    }
}

void transfer(struct fpga_data *d) {
    serialize_mat4(&d->VP);
    serialize_vertex_buffer(d->vertices, N_VERTICES);
    serialize_index_buffer(d->indices, N_INDICES);
}


