package fb

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel

  val io = IO(new Bundle {
    val writeX = Input(SInt(log2Up(width).W))
    val writeY = Input(SInt(log2Up(height).W))
    val writeVal = Input(Vec(3, UInt(colorDepth.W)))
    val writeEnable = Input(Bool())
    val clearBuffer = Input(Bool())
    val readX = Input(UInt((log2Up(width) + 1).W))
    val readY = Input(UInt((log2Up(height) + 1).W))
    val readVal = Output(Vec(3, UInt(colorDepth.W)))
    val readEnable = Input(Bool())

    val readClock = Input(Clock())
  })

  withClock(io.readClock) {

    val fb = Module(new Bram_sdp(1, width * height, "./bugge_large.mem"))
    fb.io.clk_write := clock
    //fb.io.reset := reset
    io.readEnable := DontCare
    //fb.io.read_enable := io.readEnable

    fb.io.write_enable := io.writeEnable
    fb.io.write_addr := io.writeY.asUInt() * width.U + io.writeX.asUInt()
    fb.io.data_in := 1.U
    io.writeVal := DontCare

    //fb.io.writeport_enable := DontCare
    //fb.io.read_out_reg_en := true.B

    val read_addr = RegInit(0.U(20.W))
    fb.io.clk_read := io.readClock
    fb.io.read_addr := read_addr
    when(io.readY === 0.U && io.readX === 0.U) {
      read_addr := 0.U
    } .elsewhen(io.readY < height.U && io.readX < width.U) {
        read_addr := read_addr + 1.U
    }

    when (io.clearBuffer === true.B) {
      fb.io.write_enable := true.B
      // fb.write_addr = clearBufferFbAddr
      // fb.data_in := 0.U 
      // clear buffer 
      for (i <- 0 until 640*480) {
        fb.io.write_addr := i.U
        fb.io.data_in := 0.U 
      }
    }  

    val r = Wire(Vec(3, UInt(colorDepth.W)))
    r(0) := fb.io.data_out
    r(1) := fb.io.data_out
    r(2) := fb.io.data_out
    //r(0) := fb.io.data_out(colorDepth - 1, 0)
    //r(1) := fb.io.data_out(2 * colorDepth - 1, colorDepth)
    //r(2) := fb.io.data_out(3 * colorDepth - 1, 2 * colorDepth)

    io.readVal := r
  }
}
