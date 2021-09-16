import chisel3._
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.{Clock => VGAClock}

class Main extends Module {
  val io = IO(new Bundle {})

  val fb = new FrameBuffer(640, 480)
  val bresenhams = new LineDrawing(fb, 10, 500, 200, 250)

  val vga = new VGA
  val vgaClock = new VGAClock
  fb.io.readX := vga.io.selX
  fb.io.readY := vga.io.selY
  vga.io.data := fb.io.readVal
  vga.io.clock := vgaClock.io.clkout
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
