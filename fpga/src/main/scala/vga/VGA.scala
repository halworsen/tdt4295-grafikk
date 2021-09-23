package vga

import chisel3._
import chisel3.util.Counter

class VGA extends Module {

  /** We primaraly focus on a 640 x 480px implementation
    */
  val io = IO(new Bundle {
    // Data is for now just a bool
    val data = Input(Bool())
    val selX = Output(UInt(16.W))
    val selY = Output(UInt(16.W))
    val hsync = Output(Bool())
    val vsync = Output(Bool())
    val enable = Output(Bool()) // Data enable. We can write to pixel.
    val out = Output(Bool())

    val clock = Input(Clock())
    val reset = Input(Bool())
  })

  withClockAndReset(io.clock, io.reset) {

    val (counterHsync, counterHsyncWrap) = Counter(0 to 800)
    val (counterVsync, counterVsyncWrap) = Counter(counterHsyncWrap, 525)
    io.hsync := false.B
    io.vsync := false.B
    io.out := false.B
    io.enable := false.B

    io.selX := counterHsync
    io.selY := counterVsync
    // Visible Area
    when(counterHsync < 640.U & counterVsync < 480.U) {
      io.out := io.data
      io.enable := true.B
    } // HSYNC and VSYNC
      .elsewhen(
        counterHsync >= (640 + 16).U & counterHsync < (640 + 16 + 96).U & counterVsync >= (480 + 10).U & counterVsync < (480 + 10 + 2).U
      ) {
        io.hsync := true.B
        io.vsync := true.B
      } // HSYNC
      .elsewhen(
        counterHsync >= (640 + 16).U & counterHsync < (640 + 16 + 96).U
      ) {
        io.hsync := true.B
      } // VSYNC
      .elsewhen(
        counterVsync >= (480 + 10).U & counterVsync < (480 + 10 + 2).U
      ) {
        io.vsync := true.B
        // Porches
      }
  }
}
