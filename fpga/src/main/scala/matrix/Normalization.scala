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

  // val tempZ = divFP(io.point.z, io.point.w)

  val pX = divFP(io.point.x, io.point.w)
  val pY = divFP(io.point.y, io.point.w)  

  val testOutX = Wire(FixedPoint(16.W, 0.BP))
  val testOutY = Wire(FixedPoint(16.W, 0.BP))

  // Converting coordinate system [-1, 1] -> [0, 640] , [0, 480]
  testOutX := ((pX + toFP(1.S)) * toFP((STD.screenWidth / 2).S)) // 640
  testOutY := ((pY * decToFP(-1.0) + toFP(1.S)) * toFP((STD.screenHeight * -1 / 2).S))

  io.pixel.x := testOutX.asUInt()
  io.pixel.y := testOutY.asUInt()

  //io.pixel.x := ((pixelX + toFP(1.S)) * toFP(STD.screenWidth.S)).head(32-STD.binaryPoint)
  //io.pixel.y := ((pixelY + toFP(1.S)) * -toFP(STD.screenHeight.S)).head(32-STD.binaryPoint)
}
