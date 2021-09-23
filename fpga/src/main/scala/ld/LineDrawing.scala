package ld

import chisel3._
import chisel3.util._
import tools.helpers.log2

class LineDrawing(
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

    // This is needed instead of setPixel
    val writeEnable = Output(Bool())
    val writeX = Output(UInt(log2Up(xEnd).W))
    val writeY = Output(UInt(log2Up(yEnd).W))
    val writeVal = Output(Vec(3, UInt(4.W)))

    val done = Output(Bool())
  })

  val x = Reg(UInt(log2(xStart).W))
  val y = Reg(UInt(log2(yStart).W))
  val dx = Reg(SInt(log2(xEnd).W))
  val dy = Reg(SInt(log2(yEnd).W))
  val e = Reg(SInt(log2(xStart).W))

  val writeVal = Reg(Vec(3, UInt(4.W)))
  writeVal(0) := "h4".U
  writeVal(1) := "h4".U
  writeVal(2) := "h4".U

  x := io.xs
  y := io.ys
  dx := io.xe.asSInt() - io.xs.asSInt()
  dy := io.ye.asSInt() - io.ys.asSInt()
  e := -(dx >> 1.U).asSInt();

  when(io.done) {
    // Initialize registers
    io.done := false.B
    x := io.xs
    y := io.ys
    dx := io.xe.asSInt() - io.xs.asSInt()
    dy := io.ye.asSInt() - io.ys.asSInt()
    e := -(dx >> 1.U).asSInt();
  }
  when(x <= io.xe) {
    // Draw pixel
    io.writeEnable := true.B
    io.writeX := x.asUInt()
    io.writeY := y.asUInt()

    //setPixel(enable, x.asUInt(), y.asUInt(), true.B)
    x := x + 1.U;
    e := e + dy;
    when(e >= 0.S) {
      y := y + 1.U;
      e := e - dx;
    }

    io.done := false.B
  }.otherwise {
    io.writeX := DontCare
    io.writeY := DontCare
    io.writeEnable := false.B
    io.done := true.B
  }
  io.writeVal := writeVal
}
