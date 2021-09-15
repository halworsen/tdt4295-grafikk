package fb

import chisel3._
import scala.math._

class FrameBuffer(width: UInt, height: UInt) extends Module {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt
  val io = IO(new Bundle {
    val writeX = Input(UInt(log2(width).W))
    val writeY = Input(UInt(log2(height).W))
    val writeVal = Input(Bool())
    val writeEnable = Input(Bool())
    val readX = Input(UInt(log2(width).W))
    val readY = Input(UInt(log2(height).W))
    val readVal = Output(Bool())
  })

  // Init framebuffer -> Vec[Vec[UInt]]
  val fb = RegInit(VecInit(Seq.fill(height)(VecInit(Seq.fill(width)(false.B)))))

  when(io.writeEnable) {
    fb(io.writeX)(io.writeY) := io.writeVal
  }

  // 2D Array Indexing
  io.readVal := fb(io.readX)(io.readY)
}
