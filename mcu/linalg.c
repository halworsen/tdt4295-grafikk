// Define this to compile for os with standard library
// so we get printing functions and a main-function to
// run debugging code.
#include "linalg.h"
#include <stdint.h>

void mat4(mat4_t *ret,
        float x11, float x12, float x13, float x14,
        float x21, float x22, float x23, float x24,
        float x31, float x32, float x33, float x34,
        float x41, float x42, float x43, float x44)
{
    ret->data[ 0] = x11;
    ret->data[ 1] = x12;
    ret->data[ 2] = x13;
    ret->data[ 3] = x14;

    ret->data[ 4] = x21;
    ret->data[ 5] = x22;
    ret->data[ 6] = x23;
    ret->data[ 7] = x24;

    ret->data[ 8] = x31;
    ret->data[ 9] = x32;
    ret->data[10] = x33;
    ret->data[11] = x34;

    ret->data[12] = x41;
    ret->data[13] = x42;
    ret->data[14] = x43;
    ret->data[15] = x44;
}

void vec4(vec4_t *ret, float x, float y, float z, float w) {
    ret->x = x;
    ret->y = y;
    ret->z = z;
    ret->w = w;
}


#ifdef NOEMBED
// Debugging program (which can print).
// ====================================
#include <stdio.h>

void print_mat4(mat4_t *m) {
    puts("Matrix:");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%f ", m->data[4*i + j]);
        }
        puts("");
    }
}

void print_vec4(vec4_t *v) {
    printf("Vector: (%f %f %f %f)\n", v->x, v->y, v->z, v->w);
}

int main() {
    mat4_t A;
    mat4(&A,
        1.0, 0.0, 0.0, 0.0,
        0.0, 1.0, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0);
    print_mat4(&A);

    vec4_t v;
    vec4(&v, 1.0, 2.0, 3.0, 1.0);
    print_vec4(&v);

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








