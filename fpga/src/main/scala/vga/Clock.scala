package vga

import chisel3._
import chisel3.util.HasBlackBoxResource

// Wrapper module around ARTIX MMCE2 module
class Clock() extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val rst = Input(Reset())
    val clk_pix = Output(Wire(Bool()))
    val clk_locked = Output(Wire(Bool()))
  })
  addResource("/clock_gen.v")
}
