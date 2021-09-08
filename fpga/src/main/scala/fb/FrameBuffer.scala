package fb

import chisel3._

class FrameBuffer(width: Int, height: Int) extends Module{
  val io = IO(new Bundle {
    val input = Input(Vec(height, Vec(width, UInt(1.W))))
    val writeEnable = Input(Bool())
    val output = Output(Vec(height, Vec(width, UInt(1.W))))
  })

  val fb = RegInit(VecInit(Seq.fill(height)(VecInit(Seq.fill(width)(0.U(1.W))))))

  when(io.writeEnable) {
    fb := io.input
  }.otherwise {
    fb := fb
  }

  io.output := fb
}
