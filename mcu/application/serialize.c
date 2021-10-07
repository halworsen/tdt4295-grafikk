#include "em_cmu.h"
#include "em_device.h"
#include "em_gpio.h"
#include "spidrv.h"

#include "serialize.h"
#include "linalg.h"

extern SPIDRV_Handle_t handle; /* In main.c translation unit. */

void serialize_scalar(float x) {
    // Reinterpret the float as a fixed-point decimal number.
    // TODO figure out what scaling the fpga wants
    int32_t x_fp = (int32_t) (FP_SCALE * x);

    // Send it. (4 bytes)
    SPIDRV_MTransmitB(handle, &x_fp, 4);
}

void serialize_index(uint8_t i) {
    // Serialize a byte.
    // Used for sending index buffers.
    SPIDRV_MTransmitB(handle, &i, 1);
}

void serialize_vec4(vec4_t *v) {
    serialize_scalar(v->x);
    serialize_scalar(v->y);
    serialize_scalar(v->z);
    serialize_scalar(v->w);
}

void serialize_mat4(mat4_t *m) {
    for (int i = 0; i < 16; i++) {
        serialize_scalar(m->data[i]);
    }
}

void serialize_vertex_buffer(vec4_t *verts, int n) {
    for (int i = 0; i < n; i++) {
        serialize_vec4(&verts[i]);
    }
}

void serialize_index_buffer(uint8_t *indeces, int n) {
    for (int i = 0; i < n; i++) {
        serialize_index(indeces[i]);
    }
}

void transfer(struct fpga_data *d) {
    serialize_mat4(&d->vp);
    serialize_vertex_buffer(d->verteces, N_VERTECES);
    serialize_index_buffer(d->indeces, N_INDECES);
}
