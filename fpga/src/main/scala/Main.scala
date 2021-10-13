import chisel3._
import chisel3.util._
import tools.WriteBtn
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.VGAClock

class Main extends Module {
  def delay(x: UInt) = RegNext(x)

  val io = IO(new Bundle {
    val aresetn = Input(Bool())

    val btn = Input(UInt(4.W))

    val vga_hsync = Output(Bool())
    val vga_vsync = Output(Bool())
    val vga_r = Output(UInt(4.W))
    val vga_g = Output(UInt(4.W))
    val vga_b = Output(UInt(4.W))
  })

  withReset(~io.aresetn) {
    val fb = Module(new FrameBuffer(640, 480))
    val bresenhams = Module(new LineDrawing)
    bresenhams.io.xs := 0.S
    bresenhams.io.ys := 0.S
    bresenhams.io.xe := 600.S
    bresenhams.io.ye := 400.S

    fb.io.writeEnable := bresenhams.io.writeEnable
    //bresenhams.io.writeEnable := DontCare
    //fb.io.writeEnable := false.B
    fb.io.writeX := bresenhams.io.writeX
    fb.io.writeY := bresenhams.io.writeY
    fb.io.writeVal := bresenhams.io.writeVal

    val vga = Module(new VGA)
    val vgaClock = Module(new VGAClock)

    val writeBtn = Module(new WriteBtn)
    writeBtn.io.aresetn := io.aresetn
    writeBtn.io.btn := io.btn

    bresenhams.io.start := writeBtn.io.writeEnable

    vgaClock.io.clk := clock

    //val shouldDraw = vga.io.selX < 48.U && vga.io.selY < 48.U
    withClock(vgaClock.io.clk_pix) {
      vga.io.clock := vgaClock.io.clk_pix
      vga.io.reset := ~io.aresetn
      fb.io.readEnable := vga.io.dataEnable

      vga.io.data := fb.io.readVal
      fb.io.readClock := vgaClock.io.clk_pix
      fb.io.readX := vga.io.selX
      fb.io.readY := vga.io.selY

      // Delay all VGA signals by 1 cycle due to 1 cycle delay from memory reads
      io.vga_hsync := delay(vga.io.hsync)
      io.vga_vsync := delay(vga.io.vsync)

      io.vga_r := delay(vga.io.out(0))
      io.vga_g := delay(vga.io.out(1))
      io.vga_b := delay(vga.io.out(2))

      //when(~vga.io.enable) {
      //io.vga_r := "h0".U
      //io.vga_g := "h0".U
      //io.vga_b := "h0".U

      //}.elsewhen(shouldDraw) {
      //io.vga_r := "hf".U
      //io.vga_g := "h8".U
      //io.vga_b := "h0".U
      //}.otherwise {
      //io.vga_r := "h0".U + vga.io.selX
      //io.vga_g := "h8".U + vga.io.selX
      //io.vga_b := "hf".U
      //}

    }
  }
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
