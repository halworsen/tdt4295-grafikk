#ifndef SERIALIZE_H
#define SERIALIZE_H
/* FPGA package. */
#include "linalg.h"

// A line connecting to vertices in an fpga package.
typedef struct line {
  uint16_t start;
  uint16_t end;
} line_t;

// IMPORTANT. Keep this struct 2-byte aligned, so
// it doesnt get padded in the fpga_package_send struct,
// (or at least be aware that it can happen) since this
// will make `sizeof` give you too many bytes.
struct fpga_package_header {
  uint8_t indicator_byte;
  uint8_t meta;
};

// The complete fpga package.
#define NUM_VERTS 8
#define NUM_LINES 12

struct fpga_package {
  struct fpga_package_header header;
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
  struct fpga_package_header header;
  fpga_point_t points[NUM_VERTS];
  line_t lines[NUM_LINES];
  mat4_send_t mat;
};

#define HEADER_SIZE (sizeof(struct fpga_package_header))
#define VERT_SIZE (sizeof(struct fpga_vert_send))
#define LINE_SIZE (sizeof(line_t))
#define PACKAGE_SIZE (sizeof(struct fpga_package_send))

#define INDICATOR_BYTE_CLEAR 0x01
#define INDICATOR_BYTE_DRAW  0x02

void transmit_clear();
void transmit_draw(struct fpga_package *drawcall);

#endif /* include guard */
