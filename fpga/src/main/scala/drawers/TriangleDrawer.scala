package fb

import chisel3._
import chisel3.util._

class TriangleDrawer() extends Module {

  val io = IO(new Bundle {
    val firstLine = Input();
    val secondLine = Input();
    val thirdLine = Input();
    val triangle = Output();
  })

  
  
}
