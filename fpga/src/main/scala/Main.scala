import chisel3._
import chisel3.util._
import tools.WriteBtn
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.VGAClock
import spi._

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

    val spi = Input(new SpiSlave())
    val led = Output(UInt(4.W))
  })

  withReset(~io.aresetn) {
    val fb = Module(new FrameBuffer(640, 480))
    val bresenhams = Module(new LineDrawing)
    fb.io.writeEnable := bresenhams.io.writeEnable
    fb.io.writeX := bresenhams.io.writeX
    fb.io.writeY := bresenhams.io.writeY
    fb.io.writeVal := bresenhams.io.writeVal

    val vga = Module(new VGA)
    val vgaClock = Module(new VGAClock)

    val writeBtn = Module(new WriteBtn)
    writeBtn.io.aresetn := io.aresetn
    writeBtn.io.btn := io.btn

    vgaClock.io.clk := clock

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

    }

    val spiDataWidth = 64;
    val spiSIntWidth = 16;

    val spi = Module(new Spi(spiDataWidth))
    spi.io.spi := io.spi

    val spiBuffer = RegInit(0.U(spiDataWidth.W))

    when(spi.io.outputReady) {
      spiBuffer := spi.io.value
    }

    bresenhams.io.start := delay(spi.io.outputReady)
    bresenhams.io.xs := spiBuffer(
      spiDataWidth - 1,
      spiDataWidth - spiSIntWidth
    ).asSInt
    bresenhams.io.ys := spiBuffer(
      spiDataWidth - spiSIntWidth - 1,
      spiDataWidth - 2 * spiSIntWidth
    ).asSInt
    bresenhams.io.xe := spiBuffer(
      spiDataWidth - 2 * spiSIntWidth - 1,
      spiDataWidth - 3 * spiSIntWidth
    ).asSInt
    bresenhams.io.ye := spiBuffer(
      spiDataWidth - 3 * spiSIntWidth - 1,
      spiDataWidth - 4 * spiSIntWidth
    ).asSInt

    //io.led <> spiBuffer(
    //spiDataWidth - 2 * spiSIntWidth - 1,
    //spiDataWidth - 2 * spiSIntWidth - 5
    //)
    io.led := DontCare

    // Draw border around FB
    val top :: right :: left :: bottom :: done :: Nil = Enum(5)
    val state = RegInit(top)
    switch(state) {
      is(top) {
        bresenhams.io.xs := 0.S
        bresenhams.io.ys := 0.S
        bresenhams.io.xe := 640.S
        bresenhams.io.ye := 0.S
        when(bresenhams.io.done) {
          state := right
        }.otherwise {
          bresenhams.io.start := true.B
        }
      }
      is(right) {
        bresenhams.io.xs := 640.S
        bresenhams.io.ys := 0.S
        bresenhams.io.xe := 640.S
        bresenhams.io.ye := 480.S
        when(bresenhams.io.done) {
          state := left
        }.otherwise {
          bresenhams.io.start := true.B
        }

      }
      is(left) {
        bresenhams.io.xs := 0.S
        bresenhams.io.ys := 0.S
        bresenhams.io.xe := 0.S
        bresenhams.io.ye := 480.S
        when(bresenhams.io.done) {
          state := bottom
        }.otherwise {
          bresenhams.io.start := true.B
        }

      }
      is(bottom) {
        bresenhams.io.xs := 0.S
        bresenhams.io.ys := 480.S
        bresenhams.io.xe := 640.S
        bresenhams.io.ye := 480.S
        when(bresenhams.io.done) {
          state := done
        }.otherwise {
          bresenhams.io.start := true.B
        }

      }
    }
  }
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}
