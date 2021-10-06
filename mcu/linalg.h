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
typedef struct mat4 {
    float data[16];
} mat4_t;

// 4D Vectors.
typedef struct vec4 {
    float x;
    float y;
    float z;
    float w;
} vec4_t;

// Serialization functions. These will automatically reinterpret our float-based
// structures as fixed-point before sending them over SPI where applicable.
#ifndef NOEMBED
void serialize_scalar(float x);
void serialize_vec4(vec4_t *m);
void serialize_mat4(mat4_t *m);
void serialize_index(uint32_t i);
void serialize_vertex_buffer(vec4_t *verts, int n);
void serialize_index_buffer(uint32_t *indeces, int n);
#endif


// TODO implementations for these

// Dot product ret = x . y
float dot(vec4_t *x, vec4_t *y);

// Matrix product ret = AB.
void mmul(mat4_t *ret, mat4_t *A, mat4_t *B);

// Apply transformation ret = Tx
void transform(vec4_t *ret,
               mat4_t *T,
               vec4_t *x);

// Make a translation matrix
void translation(mat4_t *ret, vec4_t *x);

// Make simple rotation matrices around the standard 
// basis axes (sufficient for simple fps camera)
void rot_x(mat4_t *ret, float th);
void rot_y(mat4_t *ret, float th);
void rot_z(mat4_t *ret, float th);

// Rotation around arbitrary vector.
void rotation(mat4_t *ret, vec4_t *r, float th);

// Perspective projection matrix from FOV, aspect ratio and clip planes.
void perspective(mat4_t *ret,
                 float fov_rad,
                 float aspect,
                 float near,
                 float far);

#endif
