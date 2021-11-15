import chisel3._
import chisel3.util._
import tools.WriteBtn
import tools._
import tools.generators._
import tools.helpers._
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.VGAClock
import spi._
import stateMachine.StateMachine
import matrix._

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

    val stateMachine = Module(new StateMachine)
    val spi = Module(new Spi((new DataFrame).getWidth))
    spi.io.spi := io.spi
    val lastRecievedFrame = RegInit(0.U.asTypeOf(new DataFrame))
    when(spi.io.outputReady) {
      lastRecievedFrame := spi.io.value.asTypeOf(new DataFrame)
    }

    //Code for use with SPI
    stateMachine.io.newFrameRecieved := spi.io.outputReady
    val renderingFrame = RegInit(0.U.asTypeOf(new PixelFrame))

    val rotator = Module(new Rotator)
    rotator.io.mat4 := DontCare
    rotator.io.inPoints := lastRecievedFrame.points

    when(stateMachine.io.loadNextFrame) {
      renderingFrame.lines := lastRecievedFrame.lines
      renderingFrame.points := rotator.io.out
    }

    // Test code for use without SPI
    /*
    val (counter, counterWrap) = Counter(true.B, 10000000) // 10 fps
    stateMachine.io.newFrameRecieved := counterWrap
    val (frameNum, framesDone) =
      Counter(stateMachine.io.loadNextFrame, ExampleDataFrames.frames.length)
    val renderingFrame = ExampleDataFrames.frames(frameNum)
     */

    val fb = Module(new FrameBuffer(STD.screenWidth, STD.screenHeight))
    val bresenhams = Module(new LineDrawing)
    fb.io.writeEnable := bresenhams.io.writeEnable
    fb.io.writePixel := bresenhams.io.writePixel
    fb.io.writeVal := bresenhams.io.writeVal

    bresenhams.io.start := stateMachine.io.bhStartRegular
    bresenhams.io.startClear := stateMachine.io.bhStartClear

    bresenhams.io.p1 := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.lineIndex).index1
    )
    bresenhams.io.p2 := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.lineIndex).index2
    )

    val vgaBlanking = Module(new CDC)

    stateMachine.io.bhBussy := bresenhams.io.busy
    stateMachine.io.inBlanking := vgaBlanking.io.output

    val vga = Module(new VGA)
    val vgaClock = Module(new VGAClock)

    vgaBlanking.io.clk_in := vgaClock.io.clk_pix
    vgaBlanking.io.clk_out := clock
    vgaBlanking.io.input := vga.io.blanking

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

      io.vga_r := delay(vga.io.out.r)
      io.vga_g := delay(vga.io.out.g)
      io.vga_b := delay(vga.io.out.b)

    }

    val (cnt, cntWrap) = Counter(true.B, 100000000)

    val led = RegInit(1.U(4.W))
    when(cntWrap) {
      led := led + 1.U
    }

    io.led := led
    io.btn := DontCare

  }
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}
