#ifndef LINALG_H
// linalg.h
// ========
// This file defines the functions and structures we need to represent
// 3D space and transformations on it using the typical w-augmented
// vectors and matrices found in OpenGL to make the math clean.

// The scale at which we transmit fixed point decimal numbers.
// Essentially 1/FP_SCALE is our precision, and should be increased
// if we need higher resoulution numbers.
#define FP_SCALE 1000

// 4x4 Matrices. Should be assumed row-major.
struct mat4 {
    float data[16];
};

// 4D Vectors.
struct vec4 {
    float x;
    float y;
    float z;
    float w;
};

// Serialization functions. These will automatically reinterpret our float-based
// structures as fixed-point before sending them over SPI.
void serialize_scalar(float x);
void serialize_vec4(vec4 *m);
void serialize_mat4(mat4 *m);

#endif
