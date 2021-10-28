import chisel3._
import fb.{BufferInput, FrameBuffer}
import ld.LineDrawing
import tools.WriteBtn
// import drawers.TriangleDrawer
// import drawers.QuadDrawer
import spi._
import vga.{VGA, VGAClock}

class Main extends Module {
  val WIDTH = 640
  val HEIGHT = 480
  val io = IO(new Bundle {
    val aresetn = Input(Bool())

    val btn = Input(UInt(4.W))
    //val clearBufferFbAddr = Input(UInt(12.W))

    val drawing = Input(Bool())

    val vga_hsync = Output(Bool())
    val vga_vsync = Output(Bool())
    val vga_r = Output(UInt(4.W))
    val vga_g = Output(UInt(4.W))
    val vga_b = Output(UInt(4.W))

    val spi = Input(new SpiSlave())
    val led = Output(UInt(4.W))
  })

  def delay(x: UInt) = RegNext(x)

  withReset(~io.aresetn) {

    val fb = Module(new FrameBuffer(WIDTH, HEIGHT))
    val fb2 = Module(new FrameBuffer(WIDTH, HEIGHT))
    // Control signals from vga to control what gets written to screen
    val vgaFbIn = Module(new BufferInput)
    // clear then draw
    val bresenhamFbIn = Module(new BufferInput)

    val bresenhams = Module(new LineDrawing)
    bresenhams.io.xs := 500.S
    bresenhams.io.ys := 0.S
    bresenhams.io.xe := 0.S
    bresenhams.io.ye := 400.S

    bresenhamFbIn.writeEnable := bresenhams.io.writeEnable
    //bresenhams.io.writeEnable := DontCare
    //fb.io.writeEnable := false.B
    bresenhamFbIn.writeX := bresenhams.io.writeX
    bresenhamFbIn.writeY := bresenhams.io.writeY
    bresenhamFbIn.writeVal := bresenhams.io.writeVal
    val vga = Module(new VGA)
    val vgaClock = Module(new VGAClock)

    val writeBtn = Module(new WriteBtn)
    writeBtn.io.aresetn := io.aresetn
    writeBtn.io.btn := io.btn

    bresenhams.io.start := writeBtn.io.writeEnable

    // Which buffer is being drawn to
    val fbReadBresenham = RegInit(false.B)

    // TODO: Make available data
    bresenhams.io.start := Mux(fbReadBresenham, fb.io.done, fb2.io.done)
    vgaClock.io.clk := clock

    fb.io.input := Mux(fbReadBresenham, bresenhamFbIn, vgaFbIn)
    fb2.io.input := Mux(!fbReadBresenham, bresenhamFbIn, vgaFbIn)

    // When bresenham is done drawing, we want to clear one of the buffers
    fbReadBresenham := !fbReadBresenham ^ vga.io.done
    bresenhamFbIn.clearBuffer := RegNext(vga.io.done)

    //val shouldDraw = vga.io.selX < 48.U && vga.io.selY < 48.U
    withClock(vgaClock.io.clk_pix) {
      vga.io.clock := vgaClock.io.clk_pix
      vga.io.reset := ~io.aresetn
      vgaFbIn.readEnable := vga.io.dataEnable

      // Select which output we are currently reading from
      vga.io.data := Mux(fbReadBresenham, fb2.io.readVal, fb.io.readVal)
      vgaFbIn.readClock := vgaClock.io.clk_pix
      vgaFbIn.readX := vga.io.selX
      vgaFbIn.readY := vga.io.selY

      // Delay all VGA signals by 1 cycle due to 1 cycle delay from memory reads
      io.vga_hsync := delay(vga.io.hsync)
      io.vga_vsync := delay(vga.io.vsync)

      io.vga_r := delay(vga.io.out(0))
      io.vga_g := delay(vga.io.out(1))
      io.vga_b := delay(vga.io.out(2))
    }

    val spi = Module(new Spi)
    spi.io.spi := io.spi
    io.led := spi.io.value(3, 0)
  }
}

// Compiles chisel files to one single verilog file.
object Main extends App {
  (new chisel3.stage.ChiselStage)
    .emitVerilog(new Main(), Array("--target-dir", "verilog/"))
}
