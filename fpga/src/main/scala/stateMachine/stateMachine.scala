package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module {
  val io = IO(new Bundle {
    val newFrameRecieved = Input(Bool())
    val bhDone = Input(Bool())

    val bhStartRegular = Output(Bool())
    val bhStartClear = Output(Bool())
    val loadNextFrame = Output(Bool())
    val lineIndex = Output(UInt())
  })

  io.bhStartRegular := false.B
  io.bhStartClear := false.B
  io.loadNextFrame := false.B

  val lineIndex = RegInit(0.U)
  io.lineIndex := lineIndex
  val unrenderedFrame = RegInit(false.B)
  when(io.newFrameRecieved) {
    unrenderedFrame := true.B
  }

  val waiting :: clearing :: rendering :: Nil = Enum(3)
  val state = RegInit(waiting)

  switch(state) {
    is(waiting) {
      when(unrenderedFrame) {
        lineIndex := 0.U
        io.bhStartClear := true.B
        state := clearing
      }
    }
    is(clearing) {
      when(io.bhDone && lineIndex < STD.linenum.U) {
        lineIndex := lineIndex + 1.U
        io.bhStartClear := true.B
      }
      when(io.bhDone && lineIndex === STD.linenum.U) {
        io.loadNextFrame := true.B
        unrenderedFrame := false.B
        io.bhStartRegular := true.B
        lineIndex := 0.U
        state := rendering
      }
    }
    is(rendering) {
      when(io.bhDone && lineIndex < STD.linenum.U) {
        lineIndex := lineIndex + 1.U
        io.bhStartClear := true.B
      }
      when(io.bhDone && lineIndex === STD.linenum.U) {
        state := waiting
      }
    }
  }

}
