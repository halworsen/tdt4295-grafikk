package matrix

import chisel3._
import chisel3.experimental._
import tools._
import tools.helpers.{divFP, fp}

class Normalizer extends Module {
  val io = IO(new Bundle {
    val point = Input(new Point)
    val pixel = Output(new Pixel)
  })

  val pX = divFP(io.point.x, io.point.w)
  val pY = divFP(io.point.y, io.point.w)

  val testOutX = Wire(FixedPoint(16.W, 0.BP))
  val testOutY = Wire(FixedPoint(16.W, 0.BP))

  // Converting coordinate system [-1, 1] -> [0, 640] , [0, 480]
  testOutX := ((pX + fp(1)) * fp(STD.screenWidth / 2)) // 640
  testOutY := ((pY * fp(-1.0) + fp(1)) * fp(
    STD.screenHeight / 2
  ))

  io.pixel.x := testOutX.asUInt()
  io.pixel.y := testOutY.asUInt()
}
