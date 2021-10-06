// Define this to compile for os with standard library
// so we get printing functions and a main-function to
// run debugging code.
#include "linalg.h"
#include <stdint.h>

#ifdef NOEMBED
// Debugging program (which can print).
// ====================================
#include <stdio.h>
int main() {
    return 0;
}
#endif

#ifndef NOEMBED
// Serialization functions.
// ========================
#include "em_cmu.h"
#include "em_device.h"
#include "em_gpio.h"
#include "spidrv.h"
extern SPIDRV_Handle_t handle; /* In main.c translation unit. */

void serialize_scalar(float x) {
    // Reinterpret the float as a fixed-point decimal number.
    int32_t x_fp = (int32_t) (FP_SCALE * x);

    // Send it. (4 bytes)
    SPIDRV_MTransmitB(&handle, &x_fp, 4);
}

void serialize_index(uint32_t i) {
    // Serialize a 32-bit integer (4 bytes).
    // Used for sending index buffers.
    SPIDRV_MTransmitB(&handle, &i, 4);
}

void serialize_vec4(struct vec4 *v) {
    serialize_scalar(v->x);
    serialize_scalar(v->y);
    serialize_scalar(v->z);
    serialize_scalar(v->w);
}

void serialize_mat4(struct mat4 *m) {
    for (int i = 0; i < 16; i++) {
        serialize_scalar(m->data[i]);
    }
}

void serialize_vertex_buffer(vec4 *verts, int n) {
    for (int i = 0; i < n; i++) {
        serialize_vec4(verts[i]);
    }
}

void serialize_index_buffer(uint32_t *indeces, int n) {
    for (int i = 0; i < n; i++) {
        serialize_index(indeces[i]);
    }
}
#endif








