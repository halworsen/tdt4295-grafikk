package vga

import chisel3._
import chisel3.util.Counter

class VGA extends Module {

  /*
   * We primaraly focus on a 640 x 480px implementation
   */
  val io = IO(new Bundle {
    val data = Input(Vec(3, UInt(4.W)))
    val dataEnable = Output(Bool()) // Data enable. We can write to pixel.
    val selX = Output(UInt(16.W))
    val selY = Output(UInt(16.W))
    val hsync = Output(Bool())
    val vsync = Output(Bool())
    val out = Output(Vec(3, UInt(4.W)))

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
      io.out(0) := "h0".U
      io.out(1) := "h0".U
      io.out(2) := "h0".U
    }.otherwise {
      //io.out := io.data
      when(io.data(0) === 1.U) {
        io.out(0) := "hC".U
        io.out(1) := "h9".U
        io.out(2) := "h1".U
      } otherwise {
        io.out(0) := "h1".U
        io.out(1) := "h1".U
        io.out(2) := "h1".U
      }
    }
  }
}
