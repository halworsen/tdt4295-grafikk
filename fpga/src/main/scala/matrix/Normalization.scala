package matrix

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import tools._
import tools.Helpers._

class Normalizer extends Module {

  val io = IO(new Bundle {
    val point = Input(new Point)
    val pixel = Output(new Pixel)
  })


  val divx = Wire(FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))
  val divy = Wire(FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))

  

  divx := divFP(io.point.x, io.point.w)
  divy := divFP(io.point.y, io.point.w)

  val testOutX = Wire(FixedPoint(16.W, 0.BP))
  val testOutY = Wire(FixedPoint(16.W, 0.BP))

  // Converting coordinate system [-1, 1] -> [0, 640] , [0, 480]
  testOutX := ((divx               + intToFP(1)) * intToFP((STD.screenWidth  / 2))) // 640
  testOutY := ((divy * intToFP(-1) + intToFP(1)) * intToFP((STD.screenHeight / 2)))

  io.pixel.x := testOutX.asUInt()
  io.pixel.y := testOutY.asUInt()
}
