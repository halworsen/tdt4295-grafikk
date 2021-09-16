package vga

import chisel3._
import chisel3.util.HasBlackBoxResource

/* ARTIX-7 primitive MMCE2 module.
 *
 *  NOTE: This module needs to be connected to a clock upon usage,
 *  as it is not implicitly connected.
 */
class MMCE2_BASE(divide0_f: Double, mult_f: Double = 5)
    extends BlackBox(
      Map("CLKOUT0_DIVIDE_F" -> divide0_f, "CLKFBOUT_MULT_F" -> mult_f)
    ) {
  val io = IO(new Bundle {
    val CLKIN1 = Input(Clock()) // 1-bit input: Clock input
    val CLKFBIN = Input(Clock()) // 1-bit input: Feedback clock

    // Control Ports: 1-bit (each) input: MMCM control ports
    val PWRDWN = Input(Clock()) // 1-bit input: Power-down
    val RST = Input(Bool()) // 1-bit input: Reset

    // Clock outputs
    val CLKOUT0 = Output(Clock()) // 1-bit output: CLKOUT0
    val CLKOUT0B = Output(Clock()) // 1-bit output: CLKOUT0
    val CLKOUT1 = Output(Clock()) // 1-bit output: CLKOUT1
    val CLKOUT1B = Output(Clock()) // 1-bit output: Inverted CLKOUT1
    val CLKOUT2 = Output(Clock()) // 1-bit output: CLKOUT2
    val CLKOUT2B = Output(Clock()) // 1-bit output: Inverted CLKOUT2
    val CLKOUT3 = Output(Clock()) // 1-bit output: CLKOUT3
    val CLKOUT3B = Output(Clock()) // 1-bit output: Inverted CLKOUT3
    val CLKOUT4 = Output(Clock()) // 1-bit output: CLKOUT4
    val CLKOUT5 = Output(Clock()) // 1-bit output: CLKOUT5
    val CLKOUT6 = Output(Clock()) // 1-bit output: CLKOUT6

    // Feedback Clocks: 1-bit (each) output: Clock feedback ports
    val CLKFBOUT = Output(Clock()) // 1-bit output: Feedback clock
    val CLKFBOUTB = Output(Clock()) // 1-bit output: Inverted CLKFBOUT

    // Status Ports: 1-bit (each) output: MMCM status ports
    val LOCKED = Output(Clock()) // 1-bit output: LOCK
  })
}

// Wrapper module around ARTIX MMCE2 module
class Clock() extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle{
    val clk = Input(Clock())
    val rst = Input(Reset())
    val clk_pix = Output(Wire(Bool()))
    val clk_locked = Output(Wire(Bool()))
  })
  addResource("/clock_gen.v")
}


