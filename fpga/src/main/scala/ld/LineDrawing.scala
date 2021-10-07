package ld

import chisel3._
import chisel3.util._

// https://www.google.com/search?q=bresenham%27s+line+algorithm&sxsrf=AOaemvL1TxCiXvAjdJEoqqyHit-YOLiabQ:1633605785405&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjQtqrkl7jzAhXnQvEDHVxHC0AQ_AUoAXoECAEQAw&biw=1440&bih=788&dpr=2#imgrc=MemqMsI7g2nbiM
class LineDrawing(
    xStart: Int,
    xEnd: Int,
    yStart: Int,
    yEnd: Int
) extends Module {
  val io = IO(new Bundle {
    val xs = Input(UInt(log2Up(xStart).W))
    val ys = Input(UInt(log2Up(yStart).W))
    val xe = Input(UInt(log2Up(xEnd).W))
    val ye = Input(UInt(log2Up(yEnd).W))
    // Todo: should we have an input that controls whether or not we should output? (output enable)

    // This is needed instead of setPixel
    val writeEnable = Output(Bool())
    val writeX = Output(UInt(log2Up(xEnd).W))
    val writeY = Output(UInt(log2Up(yEnd).W))
    val writeVal = Output(Bool())

    val done = Output(RegInit(true.B))
  })

  val x = Reg(UInt(log2Up(xStart).W)) // Drawing position
  val y = Reg(UInt(log2Up(yStart).W)) // Drawing position
  val dx = Reg(SInt(log2Up(xEnd).W))
  val dy = Reg(SInt(log2Up(yEnd).W))
  val e = Reg(SInt(log2Up(xStart).W)) // Error value

  val writeEnable = RegInit(false.B)
  val writeX = Reg(UInt(log2Up(xEnd).W))
  val writeY = Reg(UInt(log2Up(yEnd).W))
  val writeVal = RegInit(true.B)

  // Needed because Bresenham's algorithm is not
  // symmetrical, and we don't want gaps
  val xa = Wire(UInt())
  val xb = Wire(UInt())
  val ya = Wire(UInt())
  val yb = Wire(UInt())

  // Swap points if x_start is less than x_end to ensure
  // a consistent way to order the points. This way
  // ensures that we always draw down on the screen.
  when(io.xs < io.xe) {
    xa := io.xs;
    xb := io.xe;
    ya := io.ys;
    yb := io.ye;
  } otherwise {
    xa := io.xe;
    xb := io.xs;
    ya := io.ye;
    yb := io.ys;
  }

  when(io.done) {
    // Initialize registers
    io.done := false.B
    x := xa
    y := ya
    dx := xb - xa
    dy := yb - ya
    e := -(dx >> 1.U).asSInt();
  }
  when(x <= xb) {
    // Draw pixel
    writeEnable := true.B
    writeX := x.asUInt()
    writeY := y.asUInt()
    writeVal := true.B

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
