package fb

import chisel3._
import chisel3.util._
import ld.LineDrawing

class RecDrawer(coordWidth: Int = 16) extends Module {

  val io = IO(new Bundle {
    val firstX = Input(SInt(coordWidth.W))
    val firstY = Input(SInt(coordWidth.W))

    val secondX = Input(SInt(coordWidth.W))
    val secondY = Input(SInt(coordWidth.W))

    val thirdX = Input(SInt(coordWidth.W))
    val thirdY = Input(SInt(coordWidth.W))

    val fourthX = Input(SInt(coordWidth.W))
    val fourthY = Input(SInt(coordWidth.W))

    val start = Input(Bool())
    val clear = Input(Bool())

    val writeEnable = Output(Bool())
    val writeX = Output(SInt(coordWidth.W))
    val writeY = Output(SInt(coordWidth.W))
    val writeVal = Output(UInt(1.W))

    val done = Output(Bool())
    val busy = Output(Bool())
  })

  val ld = Module(new LineDrawing)

  io.writeEnable := ld.io.writeEnable
  io.writeX := ld.io.writeX
  io.writeY := ld.io.writeY
  io.writeVal := ld.io.writeVal
  io.done := false.B
  ld.io.clear := io.clear

  ld.io.start := false.B

  ld.io.xs := DontCare
  ld.io.ys := DontCare
  ld.io.xe := DontCare
  ld.io.ye := DontCare
  io.busy := false.B

  val currLine = RegInit(0.U(3.W));

  // 4 POINTS
  // DRAW 1 -> 2, 2 -> 3, 3->4 and finally 4 -> 1

  // When everything is set up
  switch(currLine) {
    is(1.U) {
      ld.io.xs := io.firstX
      ld.io.ys := io.firstY
      ld.io.xe := io.secondX
      ld.io.ye := io.secondY
      ld.io.start := true.B
    }
    is(2.U) {
      ld.io.xs := io.secondX
      ld.io.ys := io.secondY
      ld.io.xe := io.thirdX
      ld.io.ye := io.thirdY
      ld.io.start := true.B
    }
    is(3.U) {
      ld.io.xs := io.thirdX
      ld.io.ys := io.thirdY
      ld.io.xe := io.fourthX
      ld.io.ye := io.fourthY
      ld.io.start := true.B
    }
    is(4.U) {
      ld.io.xs := io.fourthX
      ld.io.ys := io.fourthY
      ld.io.xe := io.firstX
      ld.io.ye := io.firstY
      ld.io.start := true.B
    }
  }

  io.busy := currLine > 0.U

  when(io.start && currLine === 0.U) {
    currLine := 1.U
  }

  when(ld.io.done) {
    when(currLine >= 1.U && currLine < 4.U) {
      currLine := currLine + 1.U
      ld.io.start := false.B
    }
      .elsewhen(currLine === 4.U) {
        currLine := 0.U
        io.done := true.B
      }
  }

}
