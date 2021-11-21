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

    //Code for use with SPI
    // ------------------------------------------------------------
    val lastRecievedFrame = RegInit(0.U.asTypeOf(new DataFrame))
    when(spi.io.outputReady) {
      lastRecievedFrame := spiToDataframe(spi.io.value)
      //lastRecievedFrame := ExampleDataFramesFP.frames(0)
    }

    stateMachine.io.newFrameRecieved := spi.io.outputReady
    val renderingFrame = RegInit(0.U.asTypeOf(new DataFrame))
    stateMachine.io.newHeader := lastRecievedFrame.header
    stateMachine.io.currentHeader := renderingFrame.header

    when(stateMachine.io.loadNextFrame) {
      renderingFrame := lastRecievedFrame
    }
    // ------------------------------------------------------------

    // Test code for use without SPI
    /*
    // ------------------------------------------------------------
    val lastRecievedFrame = RegInit(ExampleDataFramesFP.frames(0))

    val (counter, counterWrap) = Counter(true.B, 10000000) // 10 fps
    stateMachine.io.newFrameRecieved := counterWrap

    val rotator = Module(new Rotator)
    rotator.io.mat4 := DontCare

    rotator.io.inPoints := lastRecievedFrame.points
    when(counter === 1000000.U) {
      lastRecievedFrame.points := rotator.io.outFP
    }

    val renderingFrame = Reg(new PixelFrame)
    when(stateMachine.io.loadNextFrame) {
      renderingFrame.lines := lastRecievedFrame.lines
      renderingFrame.points := rotator.io.out
    }
     */
    // ------------------------------------------------------------

    val rotator = Module(new Rotator(2))
    rotator.io.mat4 := renderingFrame.matrix
    //rotator.io.mat4 := DontCare
    // Inputs to rotator are ready one cycle after loadNextFrame
    rotator.io.inputReady := RegNext(stateMachine.io.loadNextPoints)
    rotator.io.inPoints(0) := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.calcLineIndex).index1
    )
    rotator.io.inPoints(1) := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.calcLineIndex).index2
    )
    stateMachine.io.pixelCalculationReady := rotator.io.outputReady

    val renderedPixels = Reg(Vec(STD.pointNum, new Pixel))

    // Load computed pixels into this frame's rendered points for immediate access later
    when(stateMachine.io.loadNextPixels) {
      renderedPixels(
        renderingFrame.lines(stateMachine.io.calcLineIndex).index1
      ) := rotator.io.out(0)
      renderedPixels(
        renderingFrame.lines(stateMachine.io.calcLineIndex).index2
      ) := rotator.io.out(1)
    }

    val fb = Module(new FrameBuffer(STD.screenWidth, STD.screenHeight))
    val bresenhams = Module(new LineDrawing)
    fb.io.writeEnable := bresenhams.io.writeEnable
    fb.io.writePixel := bresenhams.io.writePixel
    fb.io.writeVal := bresenhams.io.writeVal
    fb.io.clear := stateMachine.io.fbClear

    stateMachine.io.fbReady := fb.io.ready
    stateMachine.io.fbClearStarted := fb.io.clearStarted

    bresenhams.io.start := stateMachine.io.bhStartRegular
    bresenhams.io.startClear := stateMachine.io.bhStartClear

    bresenhams.io.p1 := renderedPixels(
      renderingFrame.lines(stateMachine.io.lineIndex).index1
    )
    bresenhams.io.p2 := renderedPixels(
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

    val frame_done = Module(new CDC)
    frame_done.io.clk_in := vgaClock.io.clk_pix
    frame_done.io.clk_out := clock
    frame_done.io.input := vga.io.frameDone
    fb.io.frameDone := frame_done.io.output

    vgaClock.io.clk := clock

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
