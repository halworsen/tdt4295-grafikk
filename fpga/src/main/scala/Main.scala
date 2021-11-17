import chisel3._
import chisel3.util._
import tools.WriteBtn
import tools._
import tools.Generators._
import tools.Helpers._
import fb.FrameBuffer
import ld.LineDrawing
import vga.VGA
import vga.VGAClock
import spi._
import matrix.MVP
import stateMachine.StateMachine
import matrix.Normalizer

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

    val writeBtn = Module(new WriteBtn)
    writeBtn.io.aresetn := io.aresetn
    writeBtn.io.btn := io.btn

    val stateMachine = Module(new StateMachine)
    val spi = Module(new Spi((new DataFrame).getWidth))
    spi.io.spi := io.spi
    val lastRecievedFrame = RegInit(0.U.asTypeOf(new DataFrame))
    when(spi.io.outputReady) {
      lastRecievedFrame := spi.io.value.asTypeOf(new DataFrame)
    }

    // Code for use with SPI

    /* stateMachine.io.newFrameRecieved := spi.io.outputReady
    val renderingFrame = RegInit(0.U.asTypeOf(new DataFrame))
    when(stateMachine.io.loadNextFrame){
      renderingFrame := lastRecievedFrame
    } */
    

    // Test code for use without SPI
    val (simulatedInputCounter, simulatedInputWrap) = Counter(true.B, 1666667) // 60 fps
    stateMachine.io.newFrameRecieved := simulatedInputWrap
    // stateMachine.io.newFrameRecieved := writeBtn.io.writeEnable
    // val (frameNum, framesDone) =
    //   Counter(stateMachine.io.loadNextFrame, ExampleDataFrames.frames.length)
    // val renderingFrame = ExampleDataFrames.frames(frameNum)
    val renderingFrame = ExampleDataFrames.square1

    val normalizer1 = Module(new Normalizer)
    val normalizer2 = Module(new Normalizer)

    normalizer1.io.point := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.lineIndex).index1
    )
    normalizer2.io.point := renderingFrame.points(
      renderingFrame.lines(stateMachine.io.lineIndex).index2
    )


    val fb = Module(new FrameBuffer(STD.screenWidth, STD.screenHeight))
    val bresenhams = Module(new LineDrawing)
    fb.io.writeEnable := bresenhams.io.writeEnable
    fb.io.writePixel := bresenhams.io.writePixel
    fb.io.writeVal := bresenhams.io.writeVal

    bresenhams.io.start := stateMachine.io.bhStartRegular
    bresenhams.io.startClear := stateMachine.io.bhStartClear

    bresenhams.io.p1 := normalizer1.io.pixel
    bresenhams.io.p2 := normalizer2.io.pixel

    stateMachine.io.bhBussy := bresenhams.io.busy

    val vga = Module(new VGA)
    val vgaClock = Module(new VGAClock)

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

    io.led := DontCare
  }
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}
