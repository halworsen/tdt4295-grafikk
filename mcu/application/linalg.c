// Define this to compile for os with standard library
// so we get printing functions and a main-function to
// run debugging code.
#include "linalg.h"
#include <math.h>
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


float *at(mat4_t *M, int i, int j) {
    return &M->data[4*i + j];
}

void vec4(vec4_t *ret, float x, float y, float z, float w) {
    ret->x = x;
    ret->y = y;
    ret->z = z;
    ret->w = w;
}

float dot3(vec4_t *p, vec4_t *q) {
    return p->x * q->x
        +  p->y * q->y
        +  p->z * q->z;
}

float dot4(vec4_t *p, vec4_t *q) {
    return dot3(p, q) +  p->w * q->w;
}

float norm3(vec4_t *p) {
    return sqrt(dot3(p, p));
}

float norm4(vec4_t *p) {
    return sqrt(dot4(p, p));
}

void normalize(vec4_t *p) {
    float norm = norm3(p);
    p->x /= norm;
    p->y /= norm;
    p->z /= norm;
}

void mmul(mat4_t *ret, mat4_t *A, mat4_t *B) {
    // Alias the pointers to make the loop more readable.
    float* a = A->data;
    float* b = B->data;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            // Row vector from A, column vector from B.
            float dot = a[4*i + 0] * b[ 0 + j]
                      + a[4*i + 1] * b[ 4 + j]
                      + a[4*i + 2] * b[ 8 + j]
                      + a[4*i + 3] * b[12 + j];

            ret->data[4*i + j] = dot;
        }
    }
}

void transform(vec4_t *ret, mat4_t *T, vec4_t *p) {
    // Alias the pointer to the matrix data buffer.
    float* t = T->data;

    for (int i = 0; i < 4; i++) {
       // i'th row vector from A, v is column vector.
       float dot = t[4*i + 0] * p->x
                 + t[4*i + 1] * p->y
                 + t[4*i + 2] * p->z
                 + t[4*i + 3] * p->w;

       // Reinterpret return pointer as a float array to index.
       ((float*) ret)[i] = dot;
    }
}

void identity(mat4_t *ret) {
    mat4(ret, 1.0, 0.0, 0.0, 0.0,
              0.0, 1.0, 0.0, 0.0,
              0.0, 0.0, 1.0, 0.0,
              0.0, 0.0, 0.0, 1.0);
}

void translation(mat4_t *ret, vec4_t *t) {
    identity(ret);
    *at(ret, 0, 3) = t->x;
    *at(ret, 1, 3) = t->y;
    *at(ret, 2, 3) = t->z;
}

void rot_x(mat4_t *ret, float th) {
    identity(ret);
    *at(ret, 1, 1) =  cos(th);
    *at(ret, 1, 2) = -sin(th);
    *at(ret, 2, 1) =  sin(th);
    *at(ret, 2, 2) =  cos(th);
}

void rot_y(mat4_t *ret, float th) {
    identity(ret);
    *at(ret, 0, 0) =  cos(th);
    *at(ret, 0, 2) =  sin(th);
    *at(ret, 2, 0) = -sin(th);
    *at(ret, 2, 2) =  cos(th);
}

void rot_z(mat4_t *ret, float th) {
    identity(ret);
    *at(ret, 0, 0) =  cos(th);
    *at(ret, 0, 1) = -sin(th);
    *at(ret, 1, 0) =  sin(th);
    *at(ret, 1, 1) =  cos(th);
}

void perspective(mat4_t *ret,
        float fov_rad, float aspect, float z_near, float z_far)
{
    // Straight ripoff from the glm rust crate.
    float q = 1.0 / tan(fov_rad / 2);
    float a = q / aspect;
    float b = (z_near + z_far) / (z_near - z_far);
    float c = (2 * z_near * z_far) / (z_near - z_far);

    mat4(ret,   a, 0.0, 0.0,  0.0,
              0.0,   q, 0.0,  0.0,
              0.0, 0.0,   b, -1.0,
              0.0, 0.0,   c,  0.0);
}




#ifdef NOEMBED
// Debugging program (which can print).
// ====================================
// To run this, compile linalg.c alone with -DNOEMBED with
// clang or normal gcc to get an executable that runs on
// your OS and not on the MCU.
#include <stdio.h>

void print_mat4(mat4_t *M, const char *comment) {
    printf("Matrix: (%s)\n", comment);
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%f ", *at(M, i, j));
        }
        puts("");
    }
}

void print_vec4(vec4_t *v, const char *comment) {
    printf("Vector: [%f %f %f %f] (%s)\n",
           v->x, v->y, v->z, v->w, comment);
}

int main() {
    return 0;
}
#endif
