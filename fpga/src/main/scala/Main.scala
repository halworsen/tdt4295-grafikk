import chisel3._
import chisel3.util._
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.{Clock => VGAClock}

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

    //var clocks = Module(new Clock())
    //io.clkout := clocks.io.clkout
    val ledReg = RegInit(0.U(4.W))

    when(risingEdge) {
      write := !write
    }

    io.writeEnable := write
  }
}

class Main extends Module {
  val io = IO(new Bundle {
    val aresetn = Input(Bool())

    val btn = Input(UInt(4.W))
  })

  val fb = Module(new FrameBuffer(24, 24))
  val bresenhams = Module(new LineDrawing(10, 500, 200, 250))
  bresenhams.io.xs := 0.U
  bresenhams.io.xe := 400.U
  bresenhams.io.ys := 200.U
  bresenhams.io.ye := 200.U

  fb.io.writeEnable := bresenhams.io.writeEnable
  fb.io.writeX := bresenhams.io.writeX
  fb.io.writeY := bresenhams.io.writeY
  fb.io.writeVal := bresenhams.io.writeVal

  val vga = Module(new VGA)
  val vgaClock = Module(new VGAClock)
  fb.io.readX := vga.io.selX
  fb.io.readY := vga.io.selY

  val writeBtn = Module(new WriteBtn)
  writeBtn.io.aresetn := io.aresetn
  writeBtn.io.btn := io.btn

  //fb.io.writeEnable := writeBtn.io.writeEnable

  vga.io.data := fb.io.readVal
  vga.io.clock := vgaClock.io.clk_pix
  vga.io.reset := writeBtn.io.writeEnable

  vgaClock.io.clk := clock
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}

/*

TEST CODE

import chisel3.util._

class Main extends Module {
  val io = IO(new Bundle {
    val aresetn = Input(Bool())

    val led = Output(Bits(4.W))
    //val clkout = Output(Clock())

    val btn = Input(UInt(4.W))
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

    //var clocks = Module(new Clock())
    //io.clkout := clocks.io.clkout
    val ledReg = RegInit(0.U(4.W))

    when(risingEdge) {
      counter := counter + 1.U
    }
    when(counter === 0.U) {
      ledReg := 0.U
    }

    when(counter === 1.U) {
      ledReg := "b0001".U
    }
    when(counter === 2.U) {
      ledReg := "b0010".U
    }
    when(counter === 3.U) {
      ledReg := "b0100".U
    }

    when(counter === 4.U) {
      ledReg := "b1000".U
    }
    when(counter === 5.U) {
      counter := 0.U
    }
    io.led := ledReg
  }

}

 */
