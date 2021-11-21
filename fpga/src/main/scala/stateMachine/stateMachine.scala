package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module {
  val io = IO(new Bundle {
    val newFrameRecieved = Input(Bool())
    val bhBussy = Input(Bool())
    val inBlanking = Input(Bool())
    val fbReady = Input(Bool())
    val fbClearStarted = Input(Bool())

    val bhStartRegular = Output(Bool())
    val bhStartClear = Output(Bool())
    val fbClear = Output(Bool())
    val loadNextFrame = Output(Bool())
    val loadNextPoints = Output(Bool())
    val pixelCalculationReady = Input(Bool())
    val loadNextPixels = Output(Bool())
    val lineIndex = Output(UInt(log2Up(STD.linenum).W))
  })

  io.bhStartRegular := false.B
  io.bhStartClear := false.B
  io.loadNextFrame := false.B
  io.loadNextPixels := false.B
  io.loadNextPoints := false.B
  io.fbClear := false.B

  val lineIndex = RegInit(0.U(log2Up(STD.linenum).W))
  io.lineIndex := lineIndex
  val unrenderedFrame = RegInit(false.B)
  when(io.newFrameRecieved) {
    unrenderedFrame := true.B
  }

  val waiting :: clearSetup :: clearing :: calculationWait :: loadPoints :: loadPixels :: renderSetup :: rendering :: Nil =
    Enum(8)
  val state = RegInit(waiting)

  switch(state) {
    is(waiting) {
      when(unrenderedFrame) {
        state := clearSetup
      }
    }
    is(clearSetup) {
      // Wait for fb clearing to start
      io.fbClear := true.B
      when(io.fbClearStarted) {
        state := clearing
      }
    }
    is(clearing) {
      // Wait for fb clearing to finish
      when(io.fbReady) {
        io.loadNextFrame := true.B
        unrenderedFrame := false.B
        lineIndex := 0.U
        state := loadPoints
      }
    }
    is(loadPoints) {
      io.loadNextPoints := true.B
      state := calculationWait
    }
    is(calculationWait) {
      when(io.pixelCalculationReady) {
        state := loadPixels
        io.loadNextPixels := true.B // Load calculated pixels
      }
    }
    is(loadPixels) {
      // Wait for pixel registers to be updated
      when(io.fbReady) {
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
        state := loadPoints
      }
      when(!io.bhBussy && lineIndex >= STD.linenum.U) {
        state := waiting
      }
    }
  }
}
