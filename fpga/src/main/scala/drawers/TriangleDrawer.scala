package fb

import chisel3._
import chisel3.util._
import ld.LineDrawing

class TriangleDrawer() extends Module {

  val io = IO(new Bundle {
    val firstLine = Input();
    val secondLine = Input();
    val thirdLine = Input();
    val triangle = Output();
  })

  /*
  - connect to framebuffer
  - Set up bresenham 3 times
  - let framebuffer draw

  */
  
}
