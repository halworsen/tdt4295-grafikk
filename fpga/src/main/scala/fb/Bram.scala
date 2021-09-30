package fb

import chisel3._
import chisel3.util.HasBlackBoxResource

// Wrapper module around ARTIX BRAM_SDP_MACRO
class Bram extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk_read = Input(Clock())
    val clk_write = Input(Clock())
    val read_enable = Input(Bool())
    val write_enable = Input(Bool())

    val read_addr = Input(UInt(10.W))
    val write_addr = Input(UInt(10.W))

    val data_in = Input(UInt(12.W))
    val data_out = Output(UInt(12.W))
  })
  addResource("/bram_sdp.sv")
}
