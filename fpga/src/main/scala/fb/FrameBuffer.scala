package fb

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import tools._

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel

  val io = IO(new Bundle {
    val writePixel = Input(new Pixel)
    val writeVal = Input(Bool())
    val writeEnable = Input(Bool())
    val readX = Input(UInt((log2Up(width) + 1).W))
    val readY = Input(UInt((log2Up(height) + 1).W))
    val readVal = Output(Bool())
    val readEnable = Input(Bool())

    val readClock = Input(Clock())
  })

  withClock(io.readClock) {

    val fb_internal =
      Module(new Bram_sdp(1, width * height, "./bugge_large.mem"))
    fb_internal.io.clk_write := clock
    //fb.io.reset := reset
    io.readEnable := DontCare
    //fb.io.read_enable := io.readEnable

    fb_internal.io.write_enable := io.writeEnable
    fb_internal.io.write_addr := io.writePixel.y * width.U + io.writePixel.x
    fb_internal.io.data_in := io.writeVal.asUInt()
    io.writeVal := DontCare

    //fb.io.writeport_enable := DontCare
    //fb.io.read_out_reg_en := true.B

    val read_addr = RegInit(0.U(20.W))
    fb_internal.io.clk_read := io.readClock
    fb_internal.io.read_addr := read_addr
    when(io.readY === 0.U && io.readX === 0.U) {
      read_addr := 0.U
    }
      .elsewhen(io.readY < height.U && io.readX < width.U) {
        read_addr := read_addr + 1.U
      }
    //r(0) := fb.io.data_out(colorDepth - 1, 0)
    //r(1) := fb.io.data_out(2 * colorDepth - 1, colorDepth)
    //r(2) := fb.io.data_out(3 * colorDepth - 1, 2 * colorDepth)

    io.readVal := fb_internal.io.data_out.asBool()
  }
}
