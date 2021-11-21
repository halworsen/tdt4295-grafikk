package tools

import chisel3._
import chisel3.util._

class WriteBtn extends Module {
  val io = IO(new Bundle {
    val aresetn = Input(Bool())

    val btn = Input(UInt(4.W))
    val writeEnable = Output(Bool())
  })

  def tickGen(fac: Int) = {
    val reg = RegInit(0.U(log2Up(fac).W))
    val tick = reg === (fac - 1).U
    reg := Mux(tick, 0.U, reg + 1.U)
    tick
  }

  def rising(v: Bool) = v & !RegNext(v)

  def filter(v: Bool, t: Bool) = {
    val reg = RegInit(0.U(3.W))
    when(t) {
      reg := Cat(reg(1, 0), v)
    }
    (reg(2) & reg(1)) | (reg(2) & reg(0)) | (reg(1) & reg(0))
  }

  withReset(~io.aresetn) {
    val btnCnt = (io.btn(0)).asBool

    val btnSync = RegNext(RegNext(btnCnt))
    val tick = tickGen(100000000 / 100)
    val btnDeb = Reg(Bool())

    when(tick) {
      btnDeb := btnSync
    }
    val btnClean = filter(btnDeb, tick)
    val risingEdge = rising(btnClean)

    var counter = RegInit(0.U(4.W))
    val write = RegInit(false.B)

    val ledReg = RegInit(0.U(4.W))

    when(risingEdge) {
      write := !write
    }

    io.writeEnable := write
  }
}
