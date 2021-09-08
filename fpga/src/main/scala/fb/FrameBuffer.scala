package fb

import chisel3._

class FrameBuffer(width: Int, height: Int) extends Module{
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val out = Output(UInt(1.W))
  })
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
