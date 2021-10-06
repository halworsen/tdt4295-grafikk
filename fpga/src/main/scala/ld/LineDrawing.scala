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
    // Todo: should we have an input that controls whether or not we should output? (output enable)

    // This is needed instead of setPixel
    val writeEnable = Output(Bool())
    val writeX = Output(UInt(log2Up(xEnd).W))
    val writeY = Output(UInt(log2Up(yEnd).W))
    val writeVal = Output(Bool())

    val done = Output(RegInit(true.B))
  })

  val x = Reg(UInt(log2(xStart).W)) // Drawing position
  val y = Reg(UInt(log2(yStart).W)) // Drawing position
  val dx = Reg(SInt(log2(xEnd).W))
  val dy = Reg(SInt(log2(yEnd).W))
  val e = Reg(SInt(log2(xStart).W)) // Error value

  val writeEnable = RegInit(false.B)
  val writeX = Reg(UInt(log2(xEnd).W))
  val writeY = Reg(UInt(log2(yEnd).W))
  val writeVal = RegInit(true.B)

  // Needed because Bresenham's algorithm is not 
  // symmertical, and we don't want gaps
  val xa = Wire(UInt())
  val xb = Wire(UInt())
  val ya = Wire(UInt())
  val yb = Wire(UInt())

  // Swap points if y_start is less than y_end to ensure 
  // a consistent way to order the points. By swapping 
  // y-coordinates if y_start is greater than y_end, we 
  // will ensure that we always draw down ont he screen.
  when (ys < ye){
    xa := xs;
    xb := xe;
    ya := ys;
    yb := ye;
  } otherwise {
    xa := xe;
    xb := xs;
    ya := ye;
    yb := ys;
  }


  when(io.done) {
    // Initialize registers
    io.done := false.B
    x := io.xa
    y := io.ya
    dx := io.xb - io.xa // todo: må vi ha absoluttverdi her?
    dy := io.yb - io.ya  
    e := -(dx >> 1.U).asSInt();
  }
  when(x <= io.xb) {
    // Draw pixel
    writeEnable := true.B
    writeX := x.asUInt()
    writeY := y.asUInt()
    writeVal := true.B

    //setPixel(enable, x.asUInt(), y.asUInt(), true.B)
    x := x + 1.U;
    e := e + dy;
    when(e >= 0.S) {
      y := y + 1.U;
      e := e - dx;
    }
  }.otherwise {
    io.done := true.B
    io.writeEnable := writeEnable
    io.writeX := writeX
    io.writeY := writeY
    io.writeVal := writeVal
  }
}
