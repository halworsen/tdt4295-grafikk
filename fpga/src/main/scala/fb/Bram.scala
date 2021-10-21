package fb

import chisel3._
import chisel3.util._

class Bram_sdp(width: Int, depth: Int, init_file: String = "")
    extends BlackBox(
      Map("WIDTH" -> width, "DEPTH" -> depth, "INIT_F" -> init_file)
    )
    with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk_read = Input(Clock())
    val clk_write = Input(Clock())
    val write_enable = Input(Bool())
    // TODO: Implement this when we want to parallelize clearing out the buffer
    // val clearBuffer = Input(Bool())

    val write_addr = Input(UInt(log2Up(depth).W))
    val read_addr = Input(UInt(log2Up(depth).W))

    val data_in = Input(Bits(width.W))
    //val data_out = Output(Bits(12.W))
    val data_out = Output(Bits(width.W))
  })

  addResource("/bram_sdp_custom.sv")
}
