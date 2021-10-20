package fb

import chisel3._
import chisel3.util._
import ld.LineDrawing

class TriangleDrawer(coordWidth: Uint: 16) extends Module {

  val io = IO(new Bundle {
    val firstX = Input(SInt(coordWidth.W))
    val firstY = Input(SInt(coordWidth.W))

    val secondX = Input(SInt(coordWidth.W))
    val secondY = Input(SInt(coordWidth.W))

    val thirdX = Input(SInt(coordWidth.W))
    val thirdY = Input(SInt(coordWidth.W))
    // TODO: should we have an input that controls whether or not we should output? (output enable)
    

    val start = Input(Bool())

    val writeEnable = Output(Bool())
    val writeX = Output(SInt(coordWidth.W))
    val writeY = Output(SInt(coordWidth.W))
    val writeVal = Output(Vec(3, UInt(4.W)))

    val done = Output(Bool())
  })

  val ld1 = Module (new LineDrawing)
  val ld2 = Module (new LineDrawing)
  val ld3 = Module (new LineDrawing)

  // 3 POINTS
  // DRAW 1 -> 2, 2 -> 3 and finally 3 -> 1
  // TODO: Do we need to check which direction we're drawing the lines?

  // When everything is set up
  when (ld1.io.done === true && ld2.io.done === true && ld3.io.done === true)
  {
    io.done := true
    // Set up ld3
  } .elsewhen (ld1.io.done === true && ld2.io.done === true) {
    ld3.io.xs := io.thirdX
    ld3.io.ys := io.thirdY
    ld3.io.xe := io.firstX
    ld3.io.ye := io.firstY

    when (io.start) {
      ld3.io.start := io.start
    }

    io.writeEnable := ld3.io.writeEnable
    io.writeX := ld3.io.writeX
    io.writeY := ld3.io.writeY
    io.writeVal := ld3.io.writeVal

    // Set up ld2
  } .elsewhen (ld1.io.done === true) {

    ld2.io.xs := io.secondX
    ld2.io.ys := io.secondY
    ld2.io.xe := io.thirdX
    ld2.io.ye := io.thirdY

    when (io.start) {
      ld2.io.start := io.start
    }

    io.writeEnable := ld2.io.writeEnable
    io.writeX := ld2.io.writeX
    io.writeY := ld2.io.writeY
    io.writeVal := ld2.io.writeVal
    
    // Set up ld1
  } .otherwise {




    ld1.io.xs := io.firstX
    ld1.io.ys := io.firstY
    ld1.io.xe := io.secondX
    ld1.io.ye := io.secondY

    when (io.start) {
      ld1.io.start := io.start
    }

    io.writeEnable := ld1.io.writeEnable
    io.writeX := ld1.io.writeX
    io.writeY := ld1.io.writeY
    io.writeVal := ld1.io.writeVal
  }

  /*
  - connect to framebuffer
  - Set up bresenham 3 times
  - let framebuffer draw

  */
  
}
