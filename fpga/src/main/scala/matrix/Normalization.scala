package matrix

import chisel3._
import chisel3.util._
import tools._
import tools.Helpers._

class Normalizer extends Module {

  val io = IO(new Bundle {
    val point = Input(new Point)
    val pixel = Output(new Pixel)
  })


  io.pixel.x := ((divFP(io.point.x, io.point.w) + toFP(1.S)).pad(32) * toFP(STD.screenWidth.S).pad(32)).head(32-STD.binaryPoint)
  io.pixel.y := ((divFP(io.point.x, io.point.w) + toFP(1.S)).pad(32) * -toFP(STD.screenHeight.S).pad(32)).head(32-STD.binaryPoint)
}