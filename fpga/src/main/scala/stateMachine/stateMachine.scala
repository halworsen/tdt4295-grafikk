package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module {
  val io = IO(new Bundle {
    val newFrameRecieved = Input(Bool())
    val currentHeader = Input(new DataFrameHeader)
    val newHeader = Input(new DataFrameHeader)

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
    val calcLineIndex = Output(UInt(log2Up(STD.linenum).W))
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

  val waitingFrame :: waiting :: clearSetup :: clearing :: calculationWait :: loadPixels :: renderSetup :: rendering :: Nil =
    Enum(8)
  val state = RegInit(waiting)

  val pixelCalcReady = RegInit(0.U.asTypeOf(Vec(STD.linenum, Bool())))
  val calcInit :: calcWait :: calcLoadPixels :: calcIdle :: Nil = Enum(4)
  val calcState = RegInit(calcIdle)
  val calcLineIndex = RegInit(0.U(log2Up(STD.linenum).W))
  io.calcLineIndex := calcLineIndex
  switch(calcState) {
    is(calcInit) {
      when(calcLineIndex >= STD.linenum.U) {
        calcState := calcIdle
      }.otherwise {
        io.loadNextPoints := true.B
        calcState := calcWait
      }
    }
    is(calcWait) {
      when(io.pixelCalculationReady) {
        pixelCalcReady(calcLineIndex) := true.B
        io.loadNextPixels := true.B // Load calculated pixels
        calcState := calcLoadPixels
      }
    }
    is(calcLoadPixels) {
      calcLineIndex := calcLineIndex + 1.U
      calcState := calcInit
    }
  }

  switch(state) {
    is(waitingFrame) {
      when(unrenderedFrame && io.newHeader.frameStart) {
        state := waiting
      }
    }

    is(waiting) {
      when(unrenderedFrame) {
        unrenderedFrame := false.B
        state := renderSetup
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
        state := waitingFrame
      }
    }
    is(renderSetup) {
      pixelCalcReady := 0.U.asTypeOf(Vec(STD.linenum, Bool()))
      calcState := calcInit
      io.loadNextFrame := true.B
      lineIndex := 0.U
      calcLineIndex := 0.U
      state := calculationWait
    }
    is(calculationWait) {
      when(pixelCalcReady(lineIndex)) {
        state := loadPixels
      }
    }
    is(loadPixels) {
      // Wait for pixel registers to be updated
      when(io.fbReady) {
        io.bhStartRegular := true.B
        state := rendering
      }
    }
    is(rendering) {
      when(!io.bhBussy && lineIndex < STD.linenum.U) {
        lineIndex := lineIndex + 1.U
        state := calculationWait
      }
      when(!io.bhBussy && lineIndex >= STD.linenum.U) {
        when(io.currentHeader.clear) {
          state := clearSetup
        }.otherwise {
          state := waiting
        }
      }
    }
  }

}
