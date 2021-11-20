package tools

import chisel3._
import chisel3.util._

class CDC extends Module {
  val io = IO(new Bundle {
    val clk_in = Input(Clock())
    val clk_out = Input(Clock())
    val input = Input(Bool())
    val output = Output(Bool())
  })

  val input_toggle_wire = Wire(Bool())

  // The input_toggle register is used as a toggle register
  // based on the input from the source domain
  withClock(io.clk_in) {
    val input_toggle = RegInit(false.B)
    input_toggle := input_toggle ^ io.input
    input_toggle_wire := input_toggle
  }

  // Shift register used to cross the value into the destination domain
  val out_reg = RegInit(0.U(4.W))

  // We shift the value from source domain into the output domain
  withClock(io.clk_out) {
    out_reg := Cat(out_reg(2, 0), input_toggle_wire)
  }

  // The output is high when we detect a pulse
  io.output := out_reg(3) ^ out_reg(2)

}
