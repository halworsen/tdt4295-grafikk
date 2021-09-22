package ld

import chisel3._
import fb.FrameBuffer
import tools.helpers.{log2, setPixel}

class LineDrawing(
    fb: FrameBuffer,
    xStart: Int,
    xEnd: Int,
    yStart: Int,
    yEnd: Int
) extends Module {
  val io = IO(new Bundle {
    val xs = Input(UInt(log2(xStart).W))
    val ys = Input(UInt(log2(yStart).W))
    val xe = Input(UInt(log2(xEnd).W))
    val ye = Input(UInt(log2(yEnd).W))
    val done = Output(RegInit(true.B))
  })
  val x = Reg(UInt(log2(xStart).W))
  val y = Reg(UInt(log2(yStart).W))
  val dx = Reg(SInt(log2(xEnd).W))
  val dy = Reg(SInt(log2(yEnd).W))
  val e = Reg(SInt(log2(xStart).W))

  when(io.done) {
    // Initialize registers
    io.done := false.B
    x := io.xs
    y := io.ys
    dx := io.xe - io.xs
    dy := io.ye - io.ys
    e := -(dx >> 1.U).asSInt();
  }

  when(x <= io.xe) {
    // Draw pixel
    setPixel(fb, x.asUInt(), y.asUInt(), true.B)
    x := x + 1.U;
    e := e + dy;
    when(e >= 0.S) {
      y := y + 1.U;
      e := e - dx;
    }
  }.otherwise {
    io.done := true.B
  }
}
