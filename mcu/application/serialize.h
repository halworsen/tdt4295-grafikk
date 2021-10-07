#ifndef SERIALIZE_H
#define SERIALIZE_H
// serialize.h
// ===========
// This file defines functions and structures needed to
// transfer data to the FPGA.
#include <stdint.h>
#include "linalg.h"

// The scale at which we transmit fixed point decimal numbers.
// Essentially 1/FP_SCALE is our precision, and we can increase
// this if we need higher resolution.
#define FP_SCALE 1000

// Define the size of the transfer.
#define N_VERTECES 4
#define N_INDECES  16

// Represents one full transfer of data to the FPGA.
struct fpga_data {
    mat4_t  vp; /* view-projection matrix */
    vec4_t  verteces[N_VERTECES];
    uint8_t indeces[N_INDECES];
};

// Primitive serialization functions.
// Where applicable, these will reinterpret floats as fixed
// point with a predetermined scaling.
void serialize_scalar(float x);
void serialize_vec4(vec4_t *m);
void serialize_mat4(mat4_t *m);
void serialize_index(uint8_t i);
void serialize_vertex_buffer(vec4_t *verts, int n);
void serialize_index_buffer(uint8_t *indeces, int n);

// Transfer the complete state.
void transfer(struct fpga_data *d);



#endif /* include guard */
