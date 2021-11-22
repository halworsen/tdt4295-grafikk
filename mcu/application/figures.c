#include "linalg.h"
#include "serialize.h"

extern struct fpga_package figures[3];

void init_figures() {
  // Create the model (the square with w=1).
  vec4_t *left_wing_verts = figures[0].verts;
  vec4(&left_wing_verts[0], 0.5, -.5, -0.5, 1.0);
  vec4(&left_wing_verts[1], 0.5, 0, -1, 1.0);
  vec4(&left_wing_verts[2], 0.5, .5, -0.5, 1.0);

  vec4(&left_wing_verts[3], 0.5, -.5, 0.5, 1.0);
  vec4(&left_wing_verts[4], 0.5, 0, 1, 1.0);
  vec4(&left_wing_verts[5], 0.5, .5, 0.5, 1.0);

  vec4(&left_wing_verts[6], 0.5, 0, 0, 1.0);
  vec4(&left_wing_verts[7], .1, 0, 0, 1.0);

  vec4_t *right_wing_verts = figures[1].verts;
  vec4(&right_wing_verts[0], -0.5, -.5, -0.5, 1.0);
  vec4(&right_wing_verts[1], -0.5, 0, -1, 1.0);
  vec4(&right_wing_verts[2], -0.5, .5, -0.5, 1.0);

  vec4(&right_wing_verts[3], -0.5, -.5, 0.5, 1.0);
  vec4(&right_wing_verts[4], -0.5, 0, 1, 1.0);
  vec4(&right_wing_verts[5], -0.5, .5, 0.5, 1.0);

  vec4(&right_wing_verts[6], -0.5, 0, 0, 1.0);
  vec4(&right_wing_verts[7], -.1, 0, 0, 1.0);

  vec4_t *cube = figures[2].verts;
  vec4(&cube[0], -.1, .1, .1, 1.0);
  vec4(&cube[1], -.1, -.1, .1, 1.0);
  vec4(&cube[2], .1, -.1, .1, 1.0);
  vec4(&cube[3], .1, .1, .1, 1.0);

  vec4(&cube[4], -.1, .1, -.1, 1.0);
  vec4(&cube[5], -.1, -.1, -.1, 1.0);
  vec4(&cube[6], .1, -.1, -.1, 1.0);
  vec4(&cube[7], .1, .1, -.1, 1.0);

  figures[0].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[0].lines[0].start = 0;
  figures[0].lines[0].end = 1;
  figures[0].lines[1].start = 1;
  figures[0].lines[1].end = 2;
  figures[0].lines[2].start = 2;
  figures[0].lines[2].end = 5;
  figures[0].lines[3].start = 5;
  figures[0].lines[3].end = 4;

  figures[0].lines[4].start = 4;
  figures[0].lines[4].end = 3;
  figures[0].lines[5].start = 3;
  figures[0].lines[5].end = 0;

  figures[0].lines[6].start = 0;
  figures[0].lines[6].end = 5;
  figures[0].lines[7].start = 1;
  figures[0].lines[7].end = 4;

  figures[0].lines[8].start = 2;
  figures[0].lines[8].end = 3;
  figures[0].lines[9].start = 6;
  figures[0].lines[9].end = 7;
  figures[0].lines[10].start = 0;
  figures[0].lines[10].end = 0;
  figures[0].lines[11].start = 0;
  figures[0].lines[11].end = 0;

  figures[1].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[1].lines[0].start = 0;
  figures[1].lines[0].end = 1;
  figures[1].lines[1].start = 1;
  figures[1].lines[1].end = 2;
  figures[1].lines[2].start = 2;
  figures[1].lines[2].end = 5;
  figures[1].lines[3].start = 5;
  figures[1].lines[3].end = 4;

  figures[1].lines[4].start = 4;
  figures[1].lines[4].end = 3;
  figures[1].lines[5].start = 3;
  figures[1].lines[5].end = 0;

  figures[1].lines[6].start = 0;
  figures[1].lines[6].end = 5;
  figures[1].lines[7].start = 1;
  figures[1].lines[7].end = 4;

  figures[1].lines[8].start = 2;
  figures[1].lines[8].end = 3;
  figures[1].lines[9].start = 6;
  figures[1].lines[9].end = 7;
  figures[1].lines[10].start = 0;
  figures[1].lines[10].end = 0;
  figures[1].lines[11].start = 0;
  figures[1].lines[11].end = 0;

  figures[2].header.indicator_byte = INDICATOR_BYTE_CLEAR;

  figures[2].lines[0].start = 0;
  figures[2].lines[0].end = 1;
  figures[2].lines[1].start = 1;
  figures[2].lines[1].end = 2;
  figures[2].lines[2].start = 2;
  figures[2].lines[2].end = 3;
  figures[2].lines[3].start = 3;
  figures[2].lines[3].end = 0;

  figures[2].lines[4].start = 4;
  figures[2].lines[4].end = 5;
  figures[2].lines[5].start = 5;
  figures[2].lines[5].end = 6;
  figures[2].lines[6].start = 6;
  figures[2].lines[6].end = 7;
  figures[2].lines[7].start = 7;
  figures[2].lines[7].end = 4;

  figures[2].lines[8].start = 0;
  figures[2].lines[8].end = 4;
  figures[2].lines[9].start = 1;
  figures[2].lines[9].end = 5;
  figures[2].lines[10].start = 2;
  figures[2].lines[10].end = 6;
  figures[2].lines[11].start = 3;
  figures[2].lines[11].end = 7;
  /*
  vec4_t *plane_verts = figures[0].verts;
  vec4(&plane_verts[0], -1, .5, 1, 1.0);
  vec4(&plane_verts[1], 0, .5, 1, 1.0);
  vec4(&plane_verts[2], 1, .5, 1, 1.0);

  vec4(&plane_verts[3], -1, .5, 0, 1.0);
  vec4(&plane_verts[4], 1, .5, 0, 1.0);

  vec4(&plane_verts[5], -1, .5, -1, 1.0);
  vec4(&plane_verts[6], 0, .5, -1, 1.0);
  vec4(&plane_verts[7], 1, .5, -1, 1.0);

  vec4_t *left_wall_verts = figures[1].verts;
  vec4(&left_wall_verts[0], 1, -.5, 1, 1.0);
  vec4(&left_wall_verts[1], 1, 0, 1, 1.0);
  vec4(&left_wall_verts[2], 1, .5, 1, 1.0);

  vec4(&left_wall_verts[3], 1, -.5, 0, 1.0);
  vec4(&left_wall_verts[4], 1, .5, 0, 1.0);

  vec4(&left_wall_verts[5], 1, -.5, -1, 1.0);
  vec4(&left_wall_verts[6], 1, 0, -1, 1.0);
  vec4(&left_wall_verts[7], 1, .5, -1, 1.0);

  vec4_t *left_wall_verts2 = figures[5].verts;
  vec4(&left_wall_verts2[0], 2, -.5, 1, 1.0);
  vec4(&left_wall_verts2[1], 2, 0, 1, 1.0);
  vec4(&left_wall_verts2[2], 2, .5, 1, 1.0);

  vec4(&left_wall_verts2[3], 2, -.5, 0, 1.0);
  vec4(&left_wall_verts2[4], 2, .5, 0, 1.0);

  vec4(&left_wall_verts2[5], 2, -.5, -1, 1.0);
  vec4(&left_wall_verts2[6], 2, 0, -1, 1.0);
  vec4(&left_wall_verts2[7], 2, .5, -1, 1.0);

  vec4_t *right_wall_verts = figures[4].verts;
  vec4(&right_wall_verts[0], -1, -.5, 1, 1.0);
  vec4(&right_wall_verts[1], -1, 0, 1, 1.0);
  vec4(&right_wall_verts[2], -1, .5, 1, 1.0);

  vec4(&right_wall_verts[3], -1, -.5, 0, 1.0);
  vec4(&right_wall_verts[4], -1, .5, 0, 1.0);

  vec4(&right_wall_verts[5], -1, -.5, -1, 1.0);
  vec4(&right_wall_verts[6], -1, 0, -1, 1.0);
  vec4(&right_wall_verts[7], -1, .5, -1, 1.0);

  vec4_t *top_wall_verts = figures[3].verts;
  vec4(&top_wall_verts[0], -1, -.5, 1, 1.0);
  vec4(&top_wall_verts[1], 0, -.5, 1, 1.0);
  vec4(&top_wall_verts[2], 1, -.5, 1, 1.0);

  vec4(&top_wall_verts[3], -1, -.5, 0, 1.0);
  vec4(&top_wall_verts[4], 1, -.5, 0, 1.0);

  vec4(&top_wall_verts[5], -1, -.5, -1, 1.0);
  vec4(&top_wall_verts[6], 0, -.5, -1, 1.0);
  vec4(&top_wall_verts[7], 1, -.5, -1, 1.0);

  vec4_t *cube = figures[2].verts;
  vec4(&cube[0], -.1, .1, .1, 1.0);
  vec4(&cube[1], -.1, -.1, .1, 1.0);
  vec4(&cube[2], .1, -.1, .1, 1.0);
  vec4(&cube[3], .1, .1, .1, 1.0);

  vec4(&cube[4], -.1, .1, -.1, 1.0);
  vec4(&cube[5], -.1, -.1, -.1, 1.0);
  vec4(&cube[6], .1, -.1, -.1, 1.0);
  vec4(&cube[7], .1, .1, -.1, 1.0);

  figures[0].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[0].lines[0].start = 0;
  figures[0].lines[0].end = 2;
  figures[0].lines[1].start = 3;
  figures[0].lines[1].end = 4;
  figures[0].lines[2].start = 5;
  figures[0].lines[2].end = 7;
  figures[0].lines[3].start = 0;
  figures[0].lines[3].end = 5;

  figures[0].lines[4].start = 1;
  figures[0].lines[4].end = 6;
  figures[0].lines[5].start = 2;
  figures[0].lines[5].end = 7;

  figures[0].lines[6].start = 0;
  figures[0].lines[6].end = 0;
  figures[0].lines[7].start = 0;
  figures[0].lines[7].end = 0;

  figures[0].lines[8].start = 0;
  figures[0].lines[8].end = 0;
  figures[0].lines[9].start = 0;
  figures[0].lines[9].end = 0;
  figures[0].lines[10].start = 0;
  figures[0].lines[10].end = 0;
  figures[0].lines[11].start = 0;
  figures[0].lines[11].end = 0;

  figures[1].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[1].lines[0].start = 0;
  figures[1].lines[0].end = 2;
  figures[1].lines[1].start = 3;
  figures[1].lines[1].end = 4;
  figures[1].lines[2].start = 5;
  figures[1].lines[2].end = 7;
  figures[1].lines[3].start = 0;
  figures[1].lines[3].end = 5;

  figures[1].lines[4].start = 1;
  figures[1].lines[4].end = 6;
  figures[1].lines[5].start = 2;
  figures[1].lines[5].end = 7;

  figures[1].lines[5].end = 7;
  figures[1].lines[6].start = 0;
  figures[1].lines[7].start = 0;
  figures[1].lines[7].end = 0;

  figures[1].lines[8].start = 0;
  figures[1].lines[8].end = 0;
  figures[1].lines[9].start = 0;
  figures[1].lines[9].end = 0;
  figures[1].lines[10].start = 0;
  figures[1].lines[10].end = 0;
  figures[1].lines[11].start = 0;
  figures[1].lines[11].end = 0;

  figures[3].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[3].lines[0].start = 0;
  figures[3].lines[0].end = 2;
  figures[3].lines[1].start = 3;
  figures[3].lines[1].end = 4;
  figures[3].lines[2].start = 5;
  figures[3].lines[2].end = 7;
  figures[3].lines[3].start = 0;
  figures[3].lines[3].end = 5;

  figures[3].lines[4].start = 1;
  figures[3].lines[4].end = 6;
  figures[3].lines[5].start = 2;
  figures[3].lines[5].end = 7;

  figures[3].lines[5].end = 7;
  figures[3].lines[6].start = 0;
  figures[3].lines[7].start = 0;
  figures[3].lines[7].end = 0;

  figures[3].lines[8].start = 0;
  figures[3].lines[8].end = 0;
  figures[3].lines[9].start = 0;
  figures[3].lines[9].end = 0;
  figures[3].lines[10].start = 0;
  figures[3].lines[10].end = 0;
  figures[3].lines[11].start = 0;
  figures[3].lines[11].end = 0;

  figures[4].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[4].lines[0].start = 0;
  figures[4].lines[0].end = 2;
  figures[4].lines[1].start = 3;
  figures[4].lines[1].end = 4;
  figures[4].lines[2].start = 5;
  figures[4].lines[2].end = 7;
  figures[4].lines[3].start = 0;
  figures[4].lines[3].end = 5;

  figures[4].lines[4].start = 1;
  figures[4].lines[4].end = 6;
  figures[4].lines[5].start = 2;
  figures[4].lines[5].end = 7;

  figures[4].lines[5].end = 7;
  figures[4].lines[6].start = 0;
  figures[4].lines[7].start = 0;
  figures[4].lines[7].end = 0;

  figures[4].lines[8].start = 0;
  figures[4].lines[8].end = 0;
  figures[4].lines[9].start = 0;
  figures[4].lines[9].end = 0;
  figures[4].lines[10].start = 0;
  figures[4].lines[10].end = 0;
  figures[4].lines[11].start = 0;
  figures[4].lines[11].end = 0;

  figures[5].header.indicator_byte = INDICATOR_BYTE_DRAW;
  // Hard coded to lines connect the lines sequentially.
  figures[5].lines[0].start = 0;
  figures[5].lines[0].end = 2;
  figures[5].lines[1].start = 3;
  figures[5].lines[1].end = 4;
  figures[5].lines[2].start = 5;
  figures[5].lines[2].end = 7;
  figures[5].lines[3].start = 0;
  figures[5].lines[3].end = 5;

  figures[5].lines[4].start = 1;
  figures[5].lines[4].end = 6;
  figures[5].lines[5].start = 2;
  figures[5].lines[5].end = 7;

  figures[5].lines[5].end = 7;
  figures[5].lines[6].start = 0;
  figures[5].lines[7].start = 0;
  figures[5].lines[7].end = 0;

  figures[5].lines[8].start = 0;
  figures[5].lines[8].end = 0;
  figures[5].lines[9].start = 0;
  figures[5].lines[9].end = 0;
  figures[5].lines[10].start = 0;
  figures[5].lines[10].end = 0;
  figures[5].lines[11].start = 0;
  figures[5].lines[11].end = 0;

  figures[2].header.indicator_byte = INDICATOR_BYTE_CLEAR;

  figures[2].lines[0].start = 0;
  figures[2].lines[0].end = 1;
  figures[2].lines[1].start = 1;
  figures[2].lines[1].end = 2;
  figures[2].lines[2].start = 2;
  figures[2].lines[2].end = 3;
  figures[2].lines[3].start = 3;
  figures[2].lines[3].end = 0;

  figures[2].lines[4].start = 4;
  figures[2].lines[4].end = 5;
  figures[2].lines[5].start = 5;
  figures[2].lines[5].end = 6;
  figures[2].lines[6].start = 6;
  figures[2].lines[6].end = 7;
  figures[2].lines[7].start = 7;
  figures[2].lines[7].end = 4;

  figures[2].lines[8].start = 0;
  figures[2].lines[8].end = 4;
  figures[2].lines[9].start = 1;
  figures[2].lines[9].end = 5;
  figures[2].lines[10].start = 2;
  figures[2].lines[10].end = 6;
  figures[2].lines[11].start = 3;
  figures[2].lines[11].end = 7;
  */
}
