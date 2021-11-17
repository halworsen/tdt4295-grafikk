package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module {
  val io = IO(new Bundle {
    val newFrameRecieved = Input(Bool())
    val bhBussy = Input(Bool())

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
  val (cPropCounter, cPropDone) = Counter(state === clearSetup, 30) 
  val (rPropCounter, rPropDone) = Counter(state === renderSetup, 30) 

  switch(state) {
    is(waiting) {
      when(unrenderedFrame) {
        lineIndex := 0.U
        state := clearSetup
      }
    }
    is(clearSetup) {
      // Wait 30 cycles for linalg
      when(cPropDone){
        state := clearing
      }
    }
    is(clearing) {
      when(!io.bhBussy){
        io.bhStartClear := true.B

        when(lineIndex === STD.linenum.U){
          io.loadNextFrame := true.B
          lineIndex := 0.U
          state := renderSetup
        }
        .otherwise{
          lineIndex := lineIndex + 1.U
          state := clearSetup
        }
      }
    }
    is(renderSetup) {
      // Wait 30 cycles for linalg
      when(rPropDone){
        state := clearing
      }
    }
    is(rendering) {
      when(!io.bhBussy){
        io.bhStartRegular := true.B

        when(lineIndex === STD.linenum.U){
          lineIndex := 0.U
          state := waiting
        }
        .otherwise{
          lineIndex := lineIndex + 1.U
          state := renderSetup
        }
      }
    }
  }

}
