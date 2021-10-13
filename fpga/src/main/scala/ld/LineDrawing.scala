package ld

import chisel3._
import chisel3.util._

// https://www.google.com/search?q=bresenham%27s+line+algorithm&sxsrf=AOaemvL1TxCiXvAjdJEoqqyHit-YOLiabQ:1633605785405&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjQtqrkl7jzAhXnQvEDHVxHC0AQ_AUoAXoECAEQAw&biw=1440&bih=788&dpr=2#imgrc=MemqMsI7g2nbiM
class LineDrawing(
    coordWidth: Int = 16
) extends Module {
  def delay(x: SInt) = RegNext(x)
  val io = IO(new Bundle {
    val xs = Input(SInt(coordWidth.W))
    val ys = Input(SInt(coordWidth.W))
    val xe = Input(SInt(coordWidth.W))
    val ye = Input(SInt(coordWidth.W))
    // Todo: should we have an input that controls whether or not we should output? (output enable)

    val start = Input(Bool())

    val writeEnable = Output(Bool())
    val writeX = Output(SInt(coordWidth.W))
    val writeY = Output(SInt(coordWidth.W))
    val writeVal = Output(Vec(3, UInt(4.W)))

    val done = Output(Bool())
  })

  // Needed because Bresenham's algorithm is not
  // symmetrical, and we don't want gaps
  val xs = Wire(SInt())
  val xe = Wire(SInt())
  val ys = Wire(SInt())
  val ye = Wire(SInt())

  // Swap points if x_start is less than x_end to ensure
  // a consistent way to order the points. This way
  // ensures that we always draw down on the screen.
  when(io.xs < io.xe) {
    xs := io.xs;
    xe := io.xe;
    ys := io.ys;
    ye := io.ye;
  }.otherwise {
    xs := io.xe;
    xe := io.xs;
    ys := io.ye;
    ye := io.ys;
  }

  val init :: draw :: idle :: Nil = Enum(3)
  val state = RegInit(idle)

  val x = Reg(SInt(coordWidth.W))
  val y = Reg(SInt(coordWidth.W))
  val dx = Reg(SInt((coordWidth + 1).W))
  val dy = Reg(SInt((coordWidth + 1).W))
  val e = Reg(SInt((coordWidth + 1).W))

  io.writeVal(0) := "h1".U
  io.writeVal(1) := "h2".U
  io.writeVal(2) := "h0".U

  io.done := true.B
  io.writeEnable := false.B

  switch(state) {
    is(idle) {
      io.done := false.B
      io.writeEnable := false.B
      when(io.start) {
        state := init
      }
    }
    is(init) {
      io.done := false.B
      io.writeEnable := true.B
      x := io.xs
      y := io.ys
      dx := io.xe - io.xs
      dy := io.ye - io.ys
      e := delay(-(dx >> 1.U))
      state := draw
    }
    is(draw) {
      // Draw pixel
      when(x <= io.xe && y <= io.ye) {
        io.done := false.B
        io.writeEnable := true.B

        x := x + 1.S;
        e := e + dy;

        when(e >= 0.S) {
          y := y + 1.S;
          e := e + dx;
        }

      }.otherwise {
        state := idle
        io.done := true.B
        io.writeEnable := false.B
      }
    }
  }

  io.writeX := x
  io.writeY := y

}
