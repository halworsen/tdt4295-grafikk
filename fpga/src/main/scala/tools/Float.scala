package tools

import chisel3._
import chisel3.util._

class fix_to_float extends BlackBox {
  val io = IO(new Bundle {
    val aclk = Input(Clock())
    val s_axis_a_tvalid = Input(Bool())
    val s_axis_a_tdata = Input(STD.FP)
    val m_axis_result_tvalid = Output(Bool())
    val m_axis_result_tdata = Output(Bits(32.W))
  })
}

class float_to_fix extends BlackBox {
  val io = IO(new Bundle {
    val aclk = Input(Clock())
    val s_axis_a_tvalid = Input(Bool())
    val s_axis_a_tdata = Input(Bits(32.W))
    val m_axis_result_tvalid = Output(Bool())
    val m_axis_result_tdata = Output(STD.FP)
  })
}

class float_div extends BlackBox {
  val io = IO(new Bundle {
    val aclk = Input(Clock())
    val s_axis_a_tvalid = Input(Bool())
    val s_axis_a_tdata = Input(Bits(32.W))
    val s_axis_b_tvalid = Input(Bool())
    val s_axis_b_tdata = Input(Bits(32.W))
    val m_axis_result_tvalid = Output(Bool())
    val m_axis_result_tdata = Output(Bits(32.W))
  })
}

class FixPointDivision extends Module {
  val io = IO(new Bundle {
    val divisor = Input(STD.FP)
    val divident = Input(STD.FP)
    val inputReady = Input(Bool())

    val result = Output(STD.FP)
    val resultReady = Output(Bool())
  })

  val fix_to_float_a = Module(new fix_to_float)
  val fix_to_float_b = Module(new fix_to_float)
  val float_to_fix = Module(new float_to_fix)
  val float_div = Module(new float_div)

  fix_to_float_a.io.aclk := clock
  fix_to_float_b.io.aclk := clock
  float_to_fix.io.aclk := clock
  float_div.io.aclk := clock

  fix_to_float_a.io.s_axis_a_tvalid := io.inputReady
  fix_to_float_b.io.s_axis_a_tvalid := io.inputReady

  fix_to_float_a.io.s_axis_a_tdata := io.divident
  fix_to_float_b.io.s_axis_a_tdata := io.divisor

  float_div.io.s_axis_a_tdata := fix_to_float_a.io.m_axis_result_tdata
  float_div.io.s_axis_a_tvalid := fix_to_float_a.io.m_axis_result_tvalid
  float_div.io.s_axis_b_tdata := fix_to_float_b.io.m_axis_result_tdata
  float_div.io.s_axis_b_tvalid := fix_to_float_b.io.m_axis_result_tvalid

  float_to_fix.io.s_axis_a_tdata := float_div.io.m_axis_result_tdata
  float_to_fix.io.s_axis_a_tvalid := float_div.io.m_axis_result_tvalid

  io.result := float_to_fix.io.m_axis_result_tdata
  io.resultReady := float_to_fix.io.m_axis_result_tvalid

}
