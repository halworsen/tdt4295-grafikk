package fb

import chisel3._
import scala.math._

class FrameBuffer(width: Int, height: Int) extends Module{
  var log2 = (x: Int) => (log10(x)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val writeX = Input(UInt(log2(width).W))
    val writeY = Input(UInt(log2(height).W))
    val writeVal = Input(Bool())
    val writeEnable = Input(Bool())
    val readX = Input(UInt(log2(width).W))
    val readY = Input(UInt(log2(height).W))
    val readVal = Output(Bool())
  })

  val fb = RegInit(VecInit(Seq.fill(height)(VecInit(Seq.fill(width)(false.B)))))

  when(io.writeEnable) {
    fb(io.writeX)(io.writeY) := io.writeVal
  }
  io.readVal := fb(io.readX)(io.readY)
}

/*class FrameBuffer(width: Int, height: Int) extends Module{
  val io = IO(new Bundle {
    val input = Input(Vec(height, Vec(width, UInt(1.W))))
    val writeEnable = Input(Bool())
    val selx = Input(UInt(5.W))
    val sely = Input(UInt(5.W))
    val output = Output(Vec(height, Vec(width, UInt(1.W))))
    val selected = Output(UInt(1.W))
  })

  val fb = RegInit(VecInit(Seq.fill(height)(VecInit(Seq.fill(width)(0.U(1.W))))))

  when(io.writeEnable) {
    fb := io.input
  }.otherwise {
    fb := fb
  }

  io.selected := fb(io.sely)(io.selx)
  io.output := fb
}*/
