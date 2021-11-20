package fb

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import tools._

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel
  val pixel_count = width * height

  val io = IO(new Bundle {
    val writePixel = Input(new Pixel)
    val writeVal = Input(Bool())
    val writeEnable = Input(Bool())
    val readX = Input(UInt((log2Up(width) + 1).W))
    val readY = Input(UInt((log2Up(height) + 1).W))
    val readVal = Output(Bool())
    val readEnable = Input(Bool())
    val clear = Input(Bool())
    val ready = Output(Bool())
    val clearStarted = Output(Bool())

    val readClock = Input(Clock())
    val frameDone = Input(Bool())
  })

  io.clearStarted := false.B

  val frame_done = Module(new CDC)
  frame_done.io.clk_in := io.readClock
  frame_done.io.clk_out := clock
  frame_done.io.input := io.frameDone
  val frameDone = frame_done.io.output ^ RegNext(frame_done.io.output)

  val fb_internal =
    Module(
      new Bram_sdp(
        1,
        2 * math.pow(2, log2Up(pixel_count)).toInt /*, "./bugge_large.mem"*/
      )
    )

  val init :: clear :: idle :: active :: Nil = Enum(4)
  val state = RegInit(idle)
  val fb_clear_addr = RegInit(0.U(log2Up(pixel_count).W))
  val fb_write_addr = RegInit(0.U(log2Up(pixel_count).W))
  val current_buffer = RegInit(0.U)
  val write_val = Wire(Bool())

  io.ready := state === active

  when(frameDone) {
    current_buffer := ~current_buffer
  }

  switch(state) {
    is(init) {
      when(io.clear) {
        io.clearStarted := true.B
        state := clear
        fb_clear_addr := 0.U
      }.otherwise {
        state := active
      }
    }

    is(clear) {
      when(fb_clear_addr === (pixel_count - 1).U) {
        state := active
      }
      fb_clear_addr := fb_clear_addr + 1.U
    }

    is(idle) {
      when(frameDone) {
        state := init
      }
    }

    is(active) {
      when(frameDone) {
        state := init
      }
    }
  }

  when(state === clear) {
    fb_write_addr := fb_clear_addr
    write_val := false.B
  }.otherwise {
    fb_write_addr := io.writePixel.y * width.U + io.writePixel.x
    write_val := io.writeVal
  }

  val out_of_frame = io.writePixel.x > width.U || io.writePixel.y > height.U

  fb_internal.io.clk_write := clock
  //fb.io.reset := reset
  io.readEnable := DontCare
  //fb.io.read_enable := io.readEnable

  fb_internal.io.write_enable := RegNext(
    io.writeEnable && !out_of_frame
  ) || (state === clear)
  fb_internal.io.write_addr := Cat(current_buffer, fb_write_addr)
  fb_internal.io.data_in := write_val.asUInt()

  //fb.io.writeport_enable := DontCare
  //fb.io.read_out_reg_en := true.B

  withClock(io.readClock) {
    val read_addr = RegInit(0.U(20.W))
    fb_internal.io.clk_read := io.readClock
    fb_internal.io.read_addr := Cat(~current_buffer, read_addr)
    when(io.readY === 0.U && io.readX === 0.U) {
      read_addr := 0.U
    }
      .elsewhen(io.readY < height.U && io.readX < width.U) {
        read_addr := read_addr + 1.U
      }
    //r(0) := fb.io.data_out(colorDepth - 1, 0)
    //r(1) := fb.io.data_out(2 * colorDepth - 1, colorDepth)
    //r(2) := fb.io.data_out(3 * colorDepth - 1, 2 * colorDepth)
  }

  io.readVal := fb_internal.io.data_out.asBool()
}
