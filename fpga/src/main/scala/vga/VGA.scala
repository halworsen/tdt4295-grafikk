package vga

import chisel3._
import chisel3.util.Counter
import tools._

class VGA extends Module {

  /*
   * We primaraly focus on a 640 x 480px implementation
   */
  val io = IO(new Bundle {
    val data = Input(new Color)
    val dataEnable = Output(Bool()) // Data enable. We can write to pixel.
    val selX = Output(UInt(16.W))
    val selY = Output(UInt(16.W))
    val hsync = Output(Bool())
    val vsync = Output(Bool())
    val out = Output(new Color)

    val clock = Input(Clock())
    val reset = Input(Bool())
  })

  withClockAndReset(io.clock, io.reset) {
    val (counterHsync, counterHsyncWrap) = Counter(0 to 800)
    val (counterVsync, counterVsyncWrap) = Counter(counterHsyncWrap, 525)

    io.hsync := counterHsync >= (640 + 16).U & counterHsync < (640 + 16 + 96).U
    io.vsync := counterVsync >= (480 + 10).U & counterVsync < (480 + 10 + 2).U
    io.dataEnable := counterHsync < 640.U & counterVsync < 480.U

    io.selX := counterHsync
    io.selY := counterVsync

    when(~io.dataEnable) {
      io.data := DontCare
      io.out := STD.black
    }.otherwise {
      //io.out := io.data
      io.out := io.data
    }
  }
}
