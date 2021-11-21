package vga

import chisel3._
import chisel3.util.Counter
import tools._

class VGA extends Module {

  // 640 * 480 display @ 60fps
  val io = IO(new Bundle {
    val data = Input(Bool())
    val dataEnable = Output(Bool()) // Data enable. We can write to pixel.
    val selX = Output(UInt(16.W))
    val selY = Output(UInt(16.W))
    val hsync = Output(Bool())
    val vsync = Output(Bool())
    val out = Output(new Color)

    // Is the current output in the blanking interval
    val blanking = Output(Bool())
    val frameDone = Output(Bool())

    val clock = Input(Clock())
    val reset = Input(Bool())
  })

  withClockAndReset(io.clock, io.reset) {
    val (counterHsync, counterHsyncWrap) = Counter(0 to 800)
    val (counterVsync, counterVsyncWrap) = Counter(counterHsyncWrap, 525)

    io.hsync := !(counterHsync >= (640 + 16).U & counterHsync < (640 + 16 + 96).U)
    io.vsync := !(counterVsync >= (480 + 10).U & counterVsync < (480 + 10 + 2).U)
    io.dataEnable := counterHsync < 640.U & counterVsync < 480.U

    // Output high when we are in this space in the blanking interval
    // To implement verical sync & avoid tearing
    io.blanking := counterVsync > 480.U & counterVsync < 522.U
    io.frameDone := counterVsync === 480.U && counterHsync === 800.U

    io.selX := counterHsync
    io.selY := counterVsync

    when(~io.dataEnable) {
      io.data := DontCare
      io.out := 0.U.asTypeOf(new Color)
    }.otherwise {
      io.out := Mux(
        io.data,
        STD.mainColor.asTypeOf(new Color),
        STD.bgColor.asTypeOf(new Color)
      )
    }
  }
}
