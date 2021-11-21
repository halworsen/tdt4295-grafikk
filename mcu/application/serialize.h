#ifndef SERIALIZE_H
#define SERIALIZE_H
/* FPGA package. */
#include "linalg.h"

// A line connecting to vertices in an fpga package.
typedef struct line {
  uint16_t start;
  uint16_t end;
} line_t;

// The complete fpga package.
#define NUM_VERTS 8
#define NUM_LINES 12

struct fpga_package {
  vec4_t verts[NUM_VERTS];
  line_t lines[NUM_LINES];
  mat4_t mat;
};

/* Transmission format. */

// These are generally never constructed, they just define the
// byte layout of an fpga-package serialized as a bit stream.

typedef struct fpga_vert_send {
  int16_t x;
  int16_t y;
  int16_t z;
  int16_t w;
} fpga_point_t;

typedef struct fpga_mat4_send {
  int16_t data[16];
} mat4_send_t;

struct fpga_package_send {
  uint8_t indicator_byte;
  fpga_point_t points[NUM_VERTS];
  line_t lines[NUM_LINES];
  mat4_send_t mat;
};

#define VERT_SIZE (sizeof(struct fpga_vert_send))
#define LINE_SIZE (sizeof(line_t))
#define PACKAGE_SIZE (sizeof(struct fpga_package_send))

#define INDICATOR_BYTE_CLEAR 0x00
#define INDICATOR_BYTE_DRAW  0x01

void transmit_clear();
void transmit_draw(struct fpga_package *drawcall);

#endif /* include guard */
