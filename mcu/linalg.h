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
// structures as fixed-point before sending them over SPI where applicable.
void serialize_scalar(float x);
void serialize_vec4(vec4 *m);
void serialize_mat4(mat4 *m);
void serialize_index(uint32_t i);
void serialize_vertex_buffer(vec4 *verts, int n);
void serialize_index_buffer(uint32_t *indeces, int n);


// TODO implementations for these

// Dot product ret = x . y
float dot(struct vec4 *x, struct vec4 *y);

// Matrix product ret = AB.
void mmul(struct mat4 *ret, struct mat4 *A, struct mat4 *B);

// Apply transformation ret = Tx
void transform(struct vec4 *ret
               struct mat4 *T,
               struct vec4 *x);

// Make a translation matrix
void translation(struct mat4 *ret, struct vec4 *x);

// Make simple rotation matrices around the standard 
// basis axes (sufficient for simple fps camera)
void rot_x(struct mat4 *ret, float th);
void rot_y(struct mat4 *ret, float th);
void rot_z(struct mat4 *ret, float th);

// Rotation around arbitrary vector.
void rotation(struct mat4 *ret, struct vec4 *r, float th);

// Perspective projection matrix from FOV, aspect ratio and clip planes.
void perspective(struct mat4 *ret,
                 float fov_rad,
                 float aspect,
                 float near,
                 float far);

#endif
