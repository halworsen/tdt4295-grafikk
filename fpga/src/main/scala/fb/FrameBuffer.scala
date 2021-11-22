package fb

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import tools._

class FrameBuffer(width: Int, height: Int) extends Module {

  val colorDepth: Int = 4 // Bit width of a single color channel
  val pixel_count = width * height
  val buf_width = math.pow(2, log2Up(pixel_count)).toInt

  val io = IO(new Bundle {
    val writePixel = Input(new Pixel)
    val writeVal = Input(Bool())
    val writeEnable = Input(Bool())
    val readX = Input(UInt(log2Up(width).W))
    val readY = Input(UInt(log2Up(height).W))
    val readVal = Output(Bool())
    val readEnable = Input(Bool())
    val clear = Input(Bool())
    val ready = Output(Bool())
    val clearStarted = Output(Bool())

    val readClock = Input(Clock())
    val frameDone = Input(Bool())
  })

  val read_addr_cdc = Module(new CDC)
  read_addr_cdc.io.clk_in := io.readClock
  read_addr_cdc.io.clk_out := clock

  io.clearStarted := false.B

  val frameDone = io.frameDone

  val fb_internal =
    Module(
      new Bram_sdp(
        1,
        2 * buf_width /*, "./bugge_large.mem"*/
      )
    )

  val init :: clear :: idle :: active :: Nil = Enum(4)
  val state = RegInit(idle)
  val fb_clear_addr = RegInit(0.U(log2Up(buf_width).W))
  val fb_write_addr = RegInit(0.U(log2Up(buf_width).W))
  val current_buffer = RegInit(0.U)
  val clearWhileDraw = RegInit(false.B)
  val write_val = Wire(Bool())

  io.ready := state === active

  when(frameDone && (io.clear || clearWhileDraw)) {
    current_buffer := ~current_buffer
    clearWhileDraw := false.B
  }

  switch(state) {
    is(init) {
      when(io.clear) {
        io.clearStarted := true.B
        state := clear
      }.otherwise {
        state := active
      }
    }

    is(clear) {
      when(fb_clear_addr === (pixel_count - 1).U) {
        state := active
        fb_clear_addr := 0.U
        clearWhileDraw := false.B
      }.otherwise {
        when(clearWhileDraw) {
          when(read_addr_cdc.io.output > fb_clear_addr + 10.U) {
            fb_clear_addr := fb_clear_addr + 1.U
          }
        }.otherwise {
          fb_clear_addr := fb_clear_addr + 1.U
        }
      }
    }

    is(idle) {
      when(frameDone) {
        state := init
      }
    }

    is(active) {
      when(frameDone) {
        state := init
      }.elsewhen(io.clear) {
        clearWhileDraw := true.B
        state := init
      }
    }
  }

  when(state === clear) {
    fb_write_addr := fb_clear_addr
    write_val := false.B
  }.otherwise {
    fb_write_addr := io.writePixel.y.asUInt * width.U + io.writePixel.x.asUInt
    write_val := io.writeVal
  }

  val out_of_frame =
    io.writePixel.x >= width.S || io.writePixel.x < 0.S || io.writePixel.y >= height.S || io.writePixel.y < 0.S

  fb_internal.io.clk_write := clock
  io.readEnable := DontCare

  fb_internal.io.write_enable := RegNext(
    io.writeEnable && !out_of_frame && io.ready
  ) || (state === clear)
  fb_internal.io.write_addr := Cat(
    ~current_buffer ^ clearWhileDraw,
    fb_write_addr
  )
  fb_internal.io.data_in := write_val.asUInt()

  withClock(io.readClock) {
    val read_addr = Wire(UInt(log2Up(buf_width).W))
    read_addr_cdc.io.input := read_addr
    read_addr := io.readY * width.U + io.readX
    fb_internal.io.clk_read := io.readClock
    fb_internal.io.read_addr := Cat(current_buffer, read_addr)
  }

  io.readVal := fb_internal.io.data_out.asBool()
}
