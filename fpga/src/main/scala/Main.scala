import chisel3._
import chisel3.util._
import tools.WriteBtn
import tools.generators._
import tools.helpers._
import fb.FrameBuffer
import ld.LineDrawing
import fb.RecDrawer
import vga.VGA
import vga.VGAClock
import spi._
import matrix.MVP

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
    /*
    val bresenhams = Module(new LineDrawing)
    fb.io.writeEnable := bresenhams.io.writeEnable
    fb.io.writeX := bresenhams.io.writeX
    fb.io.writeY := bresenhams.io.writeY
    fb.io.writeVal := bresenhams.io.writeVal
     */

    val square = Module(new RecDrawer)
    fb.io.writeEnable := square.io.writeEnable
    fb.io.writeX := square.io.writeX
    fb.io.writeY := square.io.writeY
    fb.io.writeVal := square.io.writeVal

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

    val mvp = Module(new MVP)

    mvp.io.mat4 := genMat(4, 4)
    mvp.io.vec4 := genVec(4, Array.range(1, 5))
    io.led := mvp.io.outVec4(0)(3, 0)

    val spiDataWidth = 128;
    val spiSIntWidth = 16;

    val spi = Module(new Spi(spiDataWidth))
    spi.io.spi := io.spi

    val spiBuffer = RegInit(0.U(spiDataWidth.W))

    when(spi.io.outputReady) {
      spiBuffer := spi.io.value
    }

    square.io.start := delay(spi.io.outputReady && !square.io.busy)
    square.io.firstX := bitNr(spiBuffer, 0, 128).asSInt
    square.io.firstY := bitNr(spiBuffer, 1, 128).asSInt
    square.io.secondX := bitNr(spiBuffer, 2, 128).asSInt
    square.io.secondY := bitNr(spiBuffer, 3, 128).asSInt
    square.io.thirdX := bitNr(spiBuffer, 4, 128).asSInt
    square.io.thirdY := bitNr(spiBuffer, 5, 128).asSInt
    square.io.fourthX := bitNr(spiBuffer, 6, 128).asSInt
    square.io.fourthY := bitNr(spiBuffer, 7, 128).asSInt

    /*
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
    //io.led := DontCare
     */

    /*
    // Draw border around FB
    val top :: right :: left :: bottom :: done :: Nil = Enum(5)
    val state = RegInit(top)
    switch(state) {
      is(top) {
        bresenhams.io.xs := 0.S
        bresenhams.io.ys := 0.S
        bresenhams.io.xe := 639.S
        bresenhams.io.ye := 0.S
        when(bresenhams.io.done) {
          state := right
        }.otherwise {
          bresenhams.io.start := true.B
        }
      }
      is(right) {
        bresenhams.io.xs := 638.S
        bresenhams.io.ys := 0.S
        bresenhams.io.xe := 638.S
        bresenhams.io.ye := 479.S
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
        bresenhams.io.ye := 479.S
        when(bresenhams.io.done) {
          state := bottom
        }.otherwise {
          bresenhams.io.start := true.B
        }

      }
      is(bottom) {
        bresenhams.io.xs := 0.S
        bresenhams.io.ys := 479.S
        bresenhams.io.xe := 639.S
        bresenhams.io.ye := 479.S
        when(bresenhams.io.done) {
          state := done
        }.otherwise {
          bresenhams.io.start := true.B
        }

      }
    }
     */
  }
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}
