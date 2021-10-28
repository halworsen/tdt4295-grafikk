package fb

import chisel3._
import chisel3.util._

class BufferInput(colorDepth: Int = 4, width: Int = 640, height: Int = 480)
    extends Bundle {
  val writeX = SInt(log2Up(width).W)
  val writeY = SInt(log2Up(height).W)
  val writeVal = Vec(3, UInt(colorDepth.W))
  val writeEnable = Bool()
  val readEnable = Bool()
  val clearBuffer = Bool()
  val readClock = Clock()
  val readX = UInt((log2Up(width) + 1).W)
  val readY = UInt((log2Up(height) + 1).W)
}

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel

  val io = IO(new Bundle {

    val input = Input(new BufferInput)

    val readVal = Output(Vec(3, UInt(colorDepth.W)))

    val done = Output(Bool())
  })

  withClock(io.input.readClock) {

    val bram_sdp =
      Module(new Bram_sdp(1, width * height, "../../resources/bugge_large.mem"))
    bram_sdp.io.clk_write := clock
    //bram_sdp.io.reset := reset
    io.input.readEnable := DontCare

    bram_sdp.io.write_enable := io.input.writeEnable
    bram_sdp.io.write_addr := io.input.writeY.asUInt() * width.U + io.input.writeX
      .asUInt()
    bram_sdp.io.data_in := 1.U
    io.input.writeVal := DontCare

    val read_addr = RegInit(0.U(20.W))
    bram_sdp.io.clk_read := io.input.readClock
    bram_sdp.io.read_addr := read_addr
    when(io.input.readY === 0.U && io.input.readX === 0.U) { read_addr := 0.U }
      .elsewhen(io.input.readY < height.U && io.input.readX < width.U) {
        read_addr := read_addr + 1.U
      }

    // Clearing framebuffer
    val isClearing = RegInit(false.B)
    val (counterValue, counterWrap) = Counter(isClearing, 640 * 480)
    bram_sdp.io.write_enable := isClearing
    bram_sdp.io.write_addr := counterValue
    bram_sdp.io.data_in := 0.U
    isClearing := !counterWrap | io.input.clearBuffer

    val r = Wire(Vec(3, UInt(colorDepth.W)))
    r(0) := bram_sdp.io.data_out
    r(1) := bram_sdp.io.data_out
    r(2) := bram_sdp.io.data_out

    io.readVal := r
  }
}
