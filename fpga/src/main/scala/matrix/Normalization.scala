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

  val pX = io.point.x // divFP(io.point.x, io.point.w)
  val pY = io.point.y //divFP(io.point.y, io.point.w)

  val testOutX = Wire(FixedPoint(32.W, 0.BP))
  val testOutY = Wire(FixedPoint(32.W, 0.BP))

  // Converting coordinate system [-1, 1] -> [0, 640] , [0, 480]
  testOutX := ((pX + FixedPoint.fromBigInt(1, 0.BP)) * FixedPoint.fromBigInt(
    STD.screenWidth / 2,
    16.W,
    0.BP
  )) // 640
  testOutY := ((pY * FixedPoint.fromDouble(-1.0, 2.W, 0.BP) + FixedPoint
    .fromBigInt(
      1,
      0.BP
    )) * FixedPoint.fromBigInt(
    STD.screenHeight / 2,
    16.W,
    0.BP
  ))

  io.pixel.x := testOutX.asUInt()
  io.pixel.y := testOutY.asUInt()
}
