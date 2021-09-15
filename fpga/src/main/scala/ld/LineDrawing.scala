package ld

import chisel3._

class LineDrawing extends Module{
  val io = IO(new Bundle {
    val xs = Input(UInt(16.W))
    val ys = Input(UInt(16.W))
    val xe = Input(UInt(16.W))
    val ye = Input(UInt(16.W))
  })

  // Initialize registers
  val x = RegInit(0.U(16.W));
  val y = RegInit(0.U(16.W));
  val dx = RegInit(0.U(16.W));
  val dy = RegInit(0.U(16.W));
  val e = RegInit(0.U(16.W));

  x := io.xs
  y := io.ys
  dx := io.xe - io.xs
  dy := io.ye - io.ys
  e := -((dx >> 1.U).asUInt());

  x := x + 1;
  when (x <= io.xe) {
    // Draw pixel
    x := x + 1.U;
    e := e + dy;
    when (e >= 0.U) {
      y := y + 1.U;
      e := e - dx;
    }
  }
}
