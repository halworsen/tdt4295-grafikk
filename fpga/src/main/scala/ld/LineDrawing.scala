package ld

import chisel3._
import chisel3.util._

// https://www.google.com/search?q=bresenham%27s+line+algorithm&sxsrf=AOaemvL1TxCiXvAjdJEoqqyHit-YOLiabQ:1633605785405&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjQtqrkl7jzAhXnQvEDHVxHC0AQ_AUoAXoECAEQAw&biw=1440&bih=788&dpr=2#imgrc=MemqMsI7g2nbiM
class LineDrawing(
    coordWidth: Int = 16,
    maxWidth: Int = 640,
    maxHeight: Int = 480
) extends Module {
  def delay(x: UInt) = RegNext(x)
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
    val writeVal = Output(UInt(1.W))
    val clear = Input(Bool())

    val done = Output(Bool())
    val busy = Output(Bool())
  })

  // Needed because Bresenham's algorithm is not
  // symmetrical, and we don't want gaps
  val xs = Wire(SInt())
  val xe = Wire(SInt())
  val ys = Wire(SInt())
  val ye = Wire(SInt())

  // Swap points if y_end is less than y_start to ensure
  // a consistent way to order the points. This way
  // ensures that we always draw down on the screen.
  when(io.ys <= io.ye) {
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

  val idle :: init1 :: init2 :: init3 :: draw :: Nil = Enum(5)
  val state = RegInit(idle)
  val right = Reg(Bool())

  val x = Reg(SInt(coordWidth.W))
  val y = Reg(SInt(coordWidth.W))
  val x_end = Reg(SInt(coordWidth.W))
  val y_end = Reg(SInt(coordWidth.W))
  io.writeX := x
  io.writeY := y
  val dx = Reg(SInt((coordWidth + 1).W))
  val dy = Reg(SInt((coordWidth + 1).W))
  val e = Reg(SInt((coordWidth + 1).W))

  // These signals say whether we should inc/dec x and/or inc y
  // based on the error value
  val updX = 2.S * e >= dy;
  val updY = 2.S * e <= dx;

  io.writeVal := ~io.clear.asUInt()

  io.busy := state =/= idle
  io.done := false.B
  io.writeEnable := false.B

  switch(state) {
    is(idle) {
      when(io.start) {
        state := init1
        right := xe > xs
      }
    }
    is(init1) {
      dx := Mux(right, xe - xs, xs - xe)
      dy := ys - ye
      state := init2
    }
    is(init2) {
      e := dx + dy
      x := xs
      y := ys
      x_end := xe
      y_end := ye
      state := init3
    }
    is(init3) {
      io.writeEnable := true.B
      state := draw
    }
    is(draw) {
      // Draw pixel
      when(
        (x === x_end && y === y_end) || Mux(
          right,
          x < xs || x > x_end,
          x > xs || x < x_end
        ) || y < ys || y > y_end
      ) {
        state := idle
        io.done := true.B
        io.writeEnable := false.B
      }.otherwise {
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

}
