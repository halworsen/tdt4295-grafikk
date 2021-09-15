package ld

import chisel3._
import fb.FrameBuffer
import tools.helpers.{log2, setPixel}

class LineDrawing(fb: FrameBuffer, xStart: Int, xEnd: Int, yStart: Int, yEnd: Int) extends Module{
  val io = IO(new Bundle {
    val xs = Input(UInt(log2(xStart).W))
    val ys = Input(UInt(log2(yStart).W))
    val xe = Input(UInt(log2(xEnd).W))
    val ye = Input(UInt(log2(yEnd).W))
  })

  // Initialize registers
  val x = RegInit(0.U(log2(xEnd).W));
  val y = RegInit(0.U(log2(yEnd).W));
  val dx = RegInit(0.U(log2(xEnd).W));
  val dy = RegInit(0.U(log2(yEnd).W));
  val e = RegInit(0.U(log2(xEnd).W)); // This could be swapped for another bitwidth

  x := io.xs
  y := io.ys
  dx := io.xe - io.xs
  dy := io.ye - io.ys
  e := -(dx >> 1.U).asUInt();

  x := x + 1;
  when (x <= io.xe) {
    assert(-dx <= e && e < 0.U, "-dx <= e < 0 is not satisfied!");
    // Draw pixel
    setPixel(fb, x.asUInt(), y.asUInt(), true.B)
    x := x + 1.U;
    e := e + dy;
    when (e >= 0.U) {
      y := y + 1.U;
      e := e - dx;
    }
  }
}
