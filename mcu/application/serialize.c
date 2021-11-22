#include "serialize.h"

// SPI driver and the handle setup in main.c
#include "spidrv.h"
extern SPIDRV_Handle_t handle;

// Transmit a draw command to the FPGA.
void transmit_draw(struct fpga_package *cmd) {
  uint8_t bitstream[PACKAGE_SIZE] = {0};
  bitstream[0] = cmd->header.indicator_byte;
  bitstream[1] = 12; // for now its hard coded that we send 12 lines.

  // Vertex buffer starts after the indicator byte.
  int vert_offset = HEADER_SIZE;
  int line_offset = vert_offset + NUM_VERTS * VERT_SIZE;
  int mat4_offset = line_offset + NUM_LINES * LINE_SIZE;

  /* Set up vertex buffer. */

  for (int i = 0; i < NUM_VERTS; i++) {
    // Calculate fixpoint representation with 12-bit scaling.
    int16_t x = cmd->verts[i].x * (1 << 12);
    int16_t y = cmd->verts[i].y * (1 << 12);
    int16_t z = cmd->verts[i].z * (1 << 12);
    int16_t w = cmd->verts[i].w * (1 << 12);

    // Put the fixpoint numbers in the bitstream.
    bitstream[vert_offset + VERT_SIZE * i + 0] = (x >> 8) & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 1] = x & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 2] = (y >> 8) & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 3] = y & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 4] = (z >> 8) & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 5] = z & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 6] = (w >> 8) & 0xFF;
    bitstream[vert_offset + VERT_SIZE * i + 7] = w & 0xFF;
  }

  /* Set up index buffer. */

  for (int i = 0; i < NUM_LINES; i++) {
    // The index buffer already has unsigned integers, so
    // no conversion needed; just byte order change.
    bitstream[line_offset + LINE_SIZE * i + 0] =
        (cmd->lines[i].start >> 8) & 0xFF;
    bitstream[line_offset + LINE_SIZE * i + 1] = cmd->lines[i].start & 0xFF;
    bitstream[line_offset + LINE_SIZE * i + 2] =
        (cmd->lines[i].end >> 8) & 0xFF;
    bitstream[line_offset + LINE_SIZE * i + 3] = cmd->lines[i].end & 0xFF;
  }

  /* Set up MVP matrix. */

  // Note: Our matrices are row-major, but we have to send them in
  // reverse order to accomodate the easiest way to index the matrix
  // on the FPGA side.

  for (int i = 0; i < 16; i++) {
    // Convert the ith matrix element to fixpoint.
    int16_t fix_point_data = cmd->mat.data[i] * (1 << 12);

    // Put it in the bitstream at the kth index.
    bitstream[mat4_offset + 2 * i + 0] = (fix_point_data >> 8) & 0xFF;
    bitstream[mat4_offset + 2 * i + 1] = fix_point_data & 0xFF;
  }

  // Send the bitstream.
  SPIDRV_MTransmitB(handle, bitstream, sizeof(bitstream));
}

void transmit_figures(struct fpga_package *figures, int num_figures,
                      mat4_t *matrix) {
  for (int i = 0; i < num_figures; i++) {
    struct fpga_package *figure = figures + i;
    memcpy(&figure->mat, matrix, sizeof(mat4_t));
    if (i == num_figures - 1)
      figure->header.indicator_byte = INDICATOR_BYTE_CLEAR;
    else if (i == 0)
      figure->header.indicator_byte = INDICATOR_BYTE_DRAW;
    else
      figure->header.indicator_byte = 0;

    transmit_draw(figure);
  }
}
