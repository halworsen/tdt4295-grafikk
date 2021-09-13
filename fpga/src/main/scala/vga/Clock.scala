package vga

import chisel3._

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
    val RST = Input(Clock()) // 1-bit input: Reset

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
class Clock() extends Module {
  val io = IO(new Bundle {
    val clkout = Output(Clock())
  })

  val MMCE2_BASE_inst = Module(new MMCE2_BASE(7.944, 2)) // 25.17 MHz

  // If needed and the synthesizer does not add a buffer, we can use the builtin BUFG module to add
  // a clock buffer here and connect between the output of this module and the MMCE2
  // BUFG bufg_clk(.I(clokout_unbuffered), .O(clkout));

  MMCE2_BASE_inst.io.CLKIN1 := clock
  MMCE2_BASE_inst.io.RST := reset
  MMCE2_BASE_inst.io.CLKFBIN := DontCare

  io.clkout := MMCE2_BASE_inst.io.CLKOUT0

  MMCE2_BASE_inst.io.CLKOUT0B := DontCare
  MMCE2_BASE_inst.io.CLKOUT1 := DontCare
  MMCE2_BASE_inst.io.CLKOUT1B := DontCare
  MMCE2_BASE_inst.io.CLKOUT2 := DontCare
  MMCE2_BASE_inst.io.CLKOUT2B := DontCare
  MMCE2_BASE_inst.io.CLKOUT3 := DontCare
  MMCE2_BASE_inst.io.CLKOUT3B := DontCare
  MMCE2_BASE_inst.io.CLKOUT4 := DontCare
  MMCE2_BASE_inst.io.CLKOUT5 := DontCare
  MMCE2_BASE_inst.io.CLKOUT6 := DontCare

  MMCE2_BASE_inst.io.PWRDWN := DontCare

}

/*
// MMCME2_BASE: Base Mixed Mode Clock Manager
// 7 Series
// Xilinx HDL Libraries Guide, version 2012.2

MMCME2_BASE #(
.BANDWIDTH("OPTIMIZED"), // Jitter programming (OPTIMIZED, HIGH, LOW)
.CLKFBOUT_MULT_F(5.0), // Multiply value for all CLKOUT (2.000-64.000).
.CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB (-360.000-360.000).
.CLKIN1_PERIOD(0.0), // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
// CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
.CLKOUT1_DIVIDE(1),
.CLKOUT2_DIVIDE(1),
.CLKOUT3_DIVIDE(1),
.CLKOUT4_DIVIDE(1),
.CLKOUT5_DIVIDE(1),
.CLKOUT6_DIVIDE(1),
.CLKOUT0_DIVIDE_F(1.0), // Divide amount for CLKOUT0 (1.000-128.000).
// CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
.CLKOUT0_DUTY_CYCLE(0.5),
.CLKOUT1_DUTY_CYCLE(0.5),
.CLKOUT2_DUTY_CYCLE(0.5),
.CLKOUT3_DUTY_CYCLE(0.5),
.CLKOUT4_DUTY_CYCLE(0.5),
.CLKOUT5_DUTY_CYCLE(0.5),
.CLKOUT6_DUTY_CYCLE(0.5),
// CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
.CLKOUT0_PHASE(0.0),
.CLKOUT1_PHASE(0.0),
.CLKOUT2_PHASE(0.0),
.CLKOUT3_PHASE(0.0),
.CLKOUT4_PHASE(0.0),
.CLKOUT5_PHASE(0.0),
.CLKOUT6_PHASE(0.0),
.CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
.DIVCLK_DIVIDE(1), // Master division value (1-106)
.REF_JITTER1(0.0), // Reference input jitter in UI (0.000-0.999).
.STARTUP_WAIT("FALSE") // Delays DONE until MMCM is locked (FALSE, TRUE)
)
MMCME2_BASE_inst (
// Clock Outputs: 1-bit (each) output: User configurable clock outputs
.CLKOUT0(CLKOUT0), // 1-bit output: CLKOUT0
.CLKOUT0B(CLKOUT0B), // 1-bit output: Inverted CLKOUT0
.CLKOUT1(CLKOUT1), // 1-bit output: CLKOUT1
.CLKOUT1B(CLKOUT1B), // 1-bit output: Inverted CLKOUT1
.CLKOUT2(CLKOUT2), // 1-bit output: CLKOUT2
.CLKOUT2B(CLKOUT2B), // 1-bit output: Inverted CLKOUT2
.CLKOUT3(CLKOUT3), // 1-bit output: CLKOUT3
.CLKOUT3B(CLKOUT3B), // 1-bit output: Inverted CLKOUT3
.CLKOUT4(CLKOUT4), // 1-bit output: CLKOUT4
.CLKOUT5(CLKOUT5), // 1-bit output: CLKOUT5
.CLKOUT6(CLKOUT6), // 1-bit output: CLKOUT6
// Feedback Clocks: 1-bit (each) output: Clock feedback ports
.CLKFBOUT(CLKFBOUT), // 1-bit output: Feedback clock
.CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT
// Status Ports: 1-bit (each) output: MMCM status ports
.LOCKED(LOCKED), // 1-bit output: LOCK
// Clock Inputs: 1-bit (each) input: Clock input
.CLKIN1(CLKIN1), // 1-bit input: Clock
// Control Ports: 1-bit (each) input: MMCM control ports
.PWRDWN(PWRDWN), // 1-bit input: Power-down
.RST(RST), // 1-bit input: Reset
// Feedback Clocks: 1-bit (each) input: Clock feedback ports
.CLKFBIN(CLKFBIN) // 1-bit input: Feedback clock
);
 */
