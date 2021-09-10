package dvi

import chisel3._

class DVI(width: Int, height: Int) extends Module {
  val io = IO(new Bundle {

    val horizontalSync = Output(1.U)
    val verticalSync = Output(1.U)

    val vgaR = Output(UInt(4.W))
    val vgaG = Output(UInt(4.W))
    val vgaB = Output(UInt(4.W))
  })

  val horizontalCounter = RegInit(UInt(32.W))
  val verticalCounter = RegInit(UInt(32.W))

}
