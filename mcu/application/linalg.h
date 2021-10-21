#ifndef LINALG_H
#define LINALG_H
#include <stdint.h>

// linalg.h
// ========
// This file defines the functions and structures we need to 
// represent 3D space and transformations on it using the 
// typical w-augmented vectors and matrices found in mainstream 
// graphics APIs.

// 4x4 Matrices. Should be assumed row-major.
typedef struct mat4 {
    float data[16];
} mat4_t;

// Initialize a matrix with given values.
void mat4(mat4_t *ret,
        float x11, float x12, float x13, float x14,
        float x21, float x22, float x23, float x24,
        float x31, float x32, float x33, float x34,
        float x41, float x42, float x43, float x44);

// Pointer to the element at i,j in the matrix M.
// (Bounds unchecked)
float *at(mat4_t *M, int i, int j);


// 4D Vectors.
typedef struct vec4 {
    float x;
    float y;
    float z;
    float w;
} vec4_t;

// Initialize a vector with given values.
void vec4(vec4_t *ret, float x, float y, float z, float w);

// 3D matrix (w-augmented 2D matrix).
typedef struct mat3 {
    float data[9];
} mat3_t;

void mat3(mat3_t *ret,
        float x11, float x12, float x13,
        float x21, float x22, float x23,
        float x31, float x32, float x33);

// 3D vectors (w-augmented 2D vectors).
typedef struct vec3 {
    float x;
    float y;
    float w;
} vec3_t;

// Initialize a vector (x y w).
void vec3(vec3_t *ret, float x, float y);

// ========= //
// 3D LINALG //
// ========= //
// The 3D linalg is a bit more limited, since everything
// related to perspective would be nonsense in 2D, and
// the 3D linalg is only used for 2D scenes.

// ret <- AB
void mmul3(mat3_t *ret, mat3_t *A, mat3_t *B);

// ret <- Tv
void transform3(vec3_t *ret, mat3_t *T, mat3_t v);

// rotation matrix (around w-axis essentially)
void rot2(mat3_t *ret, float th);

// translation by delta (dx dy)
void translation3(mat3_t *ret, float dx, float dy);

// make a 3D identity matrix.
void identity3(mat3_t *ret);


// ========= //
// 4D LINALG //
// ========= //

// Dot product ret = x `dot` y.
float dot3(vec4_t *x, vec4_t *y); // Only 3D component.
float dot4(vec4_t *x, vec4_t *y); // All 4 components.

// Norm ||p|| of the vector p. ("length")
float norm3(vec4_t *p); // Norm of 3D component.
float norm4(vec4_t *p);

// Normalize the 3D component of p.
void normalize(vec4_t *p);

// Matrix product ret = AB.
void mmul(mat4_t *ret, mat4_t *A, mat4_t *B);

// Apply transformation ret = Tp.
void transform(vec4_t *ret, mat4_t *T, vec4_t *p);

// Make an identity matrix.
void identity(mat4_t *ret);

// Make a translation matrix.
// Only uses the 3D component of the vector.
void translation(mat4_t *ret, float dx, float dy, float dz);

// Make simple rotation matrices around the standard 
// basis axes. This is sufficient for a lot of simple
// animation, as long as one is aware of the problem
// with gimbal lock.
void rot_x(mat4_t *ret, float th);
void rot_y(mat4_t *ret, float th);
void rot_z(mat4_t *ret, float th);

// Perspective projection matrix from FOV, aspect ratio 
// and clip planes.
void perspective(mat4_t *ret,
                 float fov_rad,
                 float aspect,
                 float z_near,
                 float z_far);

#endif /* incldue guard */
