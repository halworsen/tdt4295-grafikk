package fb

import chisel3._

import chisel3.util._

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel

  val io = IO(new Bundle {
    val writeX = Input(UInt(log2Up(width).W))
    val writeY = Input(UInt(log2Up(height).W))
    val writeVal = Input(Vec(3, UInt(colorDepth.W)))
    val writeEnable = Input(Bool())
    val readX = Input(UInt(log2Up(width).W))
    val readY = Input(UInt(log2Up(height).W))
    val readVal = Output(Vec(3, UInt(colorDepth.W)))

    val clock = Input(Clock())
  })

  withClock(io.clock) {

    val fb = SyncReadMem(width * height, Vec(3, UInt(colorDepth.W)))

    when(io.writeEnable) {
      fb.write(io.writeY * width.U + io.writeX, io.writeVal)
    }
    val r = fb.read(io.readY * width.U + io.readX)

    when(r(0) === "h0".U && r(1) === "h0".U && r(2) === "h0".U) {
      io.readVal(0) := "hf".U
      io.readVal(1) := "h1".U
      io.readVal(2) := "h7".U

    }.otherwise {
      io.readVal := r
    }
  }
}
