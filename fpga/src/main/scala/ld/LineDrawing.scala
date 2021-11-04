package ld

import chisel3._
import chisel3.util._
import tools._

// https://www.google.com/search?q=bresenham%27s+line+algorithm&sxsrf=AOaemvL1TxCiXvAjdJEoqqyHit-YOLiabQ:1633605785405&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjQtqrkl7jzAhXnQvEDHVxHC0AQ_AUoAXoECAEQAw&biw=1440&bih=788&dpr=2#imgrc=MemqMsI7g2nbiM
class LineDrawing extends Module {
  def delay(x: UInt) = RegNext(x)
  val io = IO(new Bundle {
    val p1 = Input(new Pixel)
    val p2 = Input(new Pixel)
    val color = Input(new Color)

    val start = Input(Bool())
    val startClear = Input(Bool())

    val writeEnable = Output(Bool())
    val writePixel = Output(new Pixel)
    val writeVal = Output(new Color)

    val done = Output(Bool())
    val busy = Output(Bool())
  })

  

  val idle :: init :: draw :: Nil = Enum(3)
  val state = RegInit(idle)
  val ps = RegInit(0.U.asTypeOf(new Pixel)) //Pixel start
  val pe = RegInit(0.U.asTypeOf(new Pixel)) //Pixel end

  val x = Reg(UInt(STD.coordWidth))
  val y = Reg(UInt(STD.coordWidth))
  val e  = Reg(SInt(STD.coordWidth + 1.W))
  val color = RegInit(new Color)

  // Calculated functions
  val dx = Mux(right, pe.x - ps.x, ps.x - pe.x).asSInt
  val dy = (ps.y - pe.y).asSInt
  val right = pe.x > ps.x
  val updX = 2.S * e >= dy;
  val updY = 2.S * e <= dx;



  

  
  //Defalut IO values
  io.writeVal := color
  io.writePixel.x := x
  io.writePixel.y := y

  io.busy := state =/= idle
  io.done := false.B
  io.writeEnable := false.B

  switch(state) {
    is(idle) {
      when(io.start || io.startClear) {
        ps := Mux(io.p1.y <= io.p2.y, io.p1, io.p2)
        pe := Mux(io.p1.y <= io.p2.y, io.p2, io.p1)
        state := init
        color := Mux(io.startClear, STD.black, io.color)
      }
    }
    is(init) {
      e := dx + dy
      x := ps.x
      y := ps.y
      state := draw
    }
    is(draw) {
      // Draw pixel
      when(
        (x === pe.x && y === pe.y) || Mux(
          right,
          x < ps.x || x > pe.x,
          x > ps.x || x < pe.x
        ) || y < ps.y || y > pe.y
      ) {
        state := idle
        io.done := true.B
      }.otherwise {
        io.writeEnable := true.B

        when(updX && updY) {
          x := Mux(right, x + 1.U, x - 1.U)
          y := y + 1.U;
          e := e + dy + dx;
        }.otherwise {
          when(updX) {
            x := Mux(right, x + 1.U, x - 1.U)
            e := e + dy;
          }
          when(updY) {
            y := y + 1.U;
            e := e + dx;
          }
        }
      }
    }
  }

}
