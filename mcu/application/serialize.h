#ifndef SERIALIZE_H
#define SERIALIZE_H
// serialize.h
// ===========
// This file defines functions and structures needed to
// transfer data to the FPGA. In this first iteration,
// we assume only one model, so the only matrix we need
// to send is the view-projection which is applied to
// every vertex.
//
// We also use a predetermined fixed # of vertices and
// lines, and use the index 0xFF to indicate an unused
// index; this makes the protocol simpler.
//
// We also assume a relatively low number of vertices,
// such that byte-wide indices suffices. In the future
// (if the performance allows using more verts) this
// is simple to change, but for now this keeps the
// protocol simpler.
#include <stdint.h>
#include "linalg.h"

// The scale at which we transmit fixed point decimal numbers.
// Essentially 1/FP_SCALE is our precision, and we can increase
// this if we need higher resolution.
//
// TODO figure out what scaling the fpga wants
// - power of 10 or 2?
// - how big?
//
// This scale is just a guess.
#define FP_SCALE 1000

// Define the size of the transfer.
#define N_VERTECES 4
#define N_INDECES  16
// WARNING: If the # of byte indices does not fit into 32-bit
// alignment the struct will be padded. This should mostly not
// matter, but this means that the length of the transfer might
// not be exactly equal to `sizeof (struct fpga_data)`.

// Represents one full transfer of data to the FPGA.
// TODO Come up with a better name.
struct fpga_data {
    mat4_t  VP; /* view-projection matrix */
    vec4_t  vertices[N_VERTECES];
    uint8_t indices[N_INDECES];
};

// Primitive serialization functions.
// Where applicable, these will reinterpret floats as fixed
// point with the defined scaling.
void serialize_scalar(float x);
void serialize_vec4(vec4_t *v);
void serialize_mat4(mat4_t *M);
void serialize_index(uint8_t i);
void serialize_vertex_buffer(vec4_t *vertices, int n);
void serialize_index_buffer(uint8_t *indices, int n);

// Transfer the complete state.
void transfer(struct fpga_data *d);

#endif /* include guard */
