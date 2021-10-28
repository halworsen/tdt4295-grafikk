package ld

import chisel3._
import chisel3.util.{Enum, is, switch}

// https://www.google.com/search?q=bresenham%27s+line+algorithm&sxsrf=AOaemvL1TxCiXvAjdJEoqqyHit-YOLiabQ:1633605785405&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjQtqrkl7jzAhXnQvEDHVxHC0AQ_AUoAXoECAEQAw&biw=1440&bih=788&dpr=2#imgrc=MemqMsI7g2nbiM
class LineDrawing(
    coordWidth: Int = 16
) extends Module {
  val io = IO(new Bundle {
    val xs = SInt(coordWidth.W)
    val ys = SInt(coordWidth.W)
    val xe = SInt(coordWidth.W)
    val ye = SInt(coordWidth.W)
    val start = Bool()

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
  val init1 :: init2 :: draw :: idle :: Nil = Enum(4)

  // Swap points if y_end is less than y_start to ensure
  // a consistent way to order the points. This way
  // ensures that we always draw down on the screen.
  xs := io.xs;
  xe := io.xe;
  when(io.ys < io.ye) {
    ys := io.ys;
    ye := io.ye;
  }.otherwise {
    ys := io.ye;
    ye := io.ye;
  }
  val state = RegInit(idle)
  val right = Reg(Bool())
  val x = Reg(SInt(coordWidth.W))
  val y = Reg(SInt(coordWidth.W))
  val dx = Reg(SInt((coordWidth + 1).W))
  val dy = Reg(SInt((coordWidth + 1).W))
  val e = Reg(SInt((coordWidth + 1).W))
  // These signals say whether we should inc/dec x and/or inc y
  // based on the error value
  val updX = Reg(Bool())
  val updY = Reg(Bool())
  val drawDone = Reg(Bool())

  def delay(x: SInt) = RegNext(x)
  drawDone := Mux(right, x >= xe, x <= xe) && y >= ye

  updX := (2.S * e >= dy);
  updY := (2.S * e <= dx);

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
        state := init1
        right := xe > xs
      }
    }
    is(init1) {
      io.done := false.B
      dx := Mux(right, xe - xs, xs - xe)
      dy := ys - ye
      state := init2
    }
    is(init2) {
      io.writeEnable := true.B
      e := dx + dy
      x := xs
      y := ys
      state := draw
    }
    is(draw) {
      // Draw pixel
      when(drawDone) {
        state := idle
        io.done := true.B
        io.writeEnable := false.B
      }.otherwise {
        io.done := false.B
        io.writeEnable := true.B

        when(updX && updY) {
          x := Mux(right, x + 1.S, x - 1.S)
          y := y + 1.S;
          e := e + dy + dx;
        }.otherwise {
          when(updX) {
            x := Mux(right, x + 1.S, x - 1.S)
            e := e + dy;
          }
          when(updY) {
            y := y + 1.S;
            e := e + dx;
          }
        }
      }
    }
  }

  io.writeX := x
  io.writeY := y

}
