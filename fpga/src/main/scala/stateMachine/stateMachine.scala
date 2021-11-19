package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module {
  val io = IO(new Bundle {
    val newFrameRecieved = Input(Bool())
    val bhBussy = Input(Bool())
    val inBlanking = Input(Bool())

    val bhStartRegular = Output(Bool())
    val bhStartClear = Output(Bool())
    val loadNextFrame = Output(Bool())
    val lineIndex = Output(UInt(STD.linenum.W))
  })

  io.bhStartRegular := false.B
  io.bhStartClear := false.B
  io.loadNextFrame := false.B

  val lineIndex = RegInit(0.U(STD.linenum.W))
  io.lineIndex := lineIndex
  val unrenderedFrame = RegInit(false.B)
  when(io.newFrameRecieved) {
    unrenderedFrame := true.B
  }

  val waiting :: clearSetup :: clearing :: renderSetup :: rendering :: Nil =
    Enum(5)
  val state = RegInit(waiting)

  switch(state) {
    is(waiting) {
      when(unrenderedFrame & io.inBlanking) {
        lineIndex := 0.U
        state := clearSetup
      }
    }
    is(clearSetup) {
      // Wait 1 cycle for bh inputs to become valid
      io.bhStartClear := true.B
      state := clearing
    }
    is(clearing) {
      when(!io.bhBussy && lineIndex < STD.linenum.U) {
        lineIndex := lineIndex + 1.U
        state := clearSetup
      }
      when(!io.bhBussy && lineIndex >= STD.linenum.U) {
        io.loadNextFrame := true.B
        unrenderedFrame := false.B
        lineIndex := 0.U
        state := renderSetup
      }
    }
    is(renderSetup) {
      // Wait 1 cycle for bh inputs to become valid
      io.bhStartRegular := true.B
      state := rendering
    }
    is(rendering) {
      when(!io.bhBussy && lineIndex < STD.linenum.U) {
        lineIndex := lineIndex + 1.U
        state := renderSetup
      }
      when(!io.bhBussy && lineIndex >= STD.linenum.U) {
        state := waiting
      }
    }
  }

}
