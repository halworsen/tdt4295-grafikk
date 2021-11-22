package matrix

import chisel3._
import chisel3.experimental._
import tools._
import tools.helpers.fp
import dsptools.numbers._

class Normalizer extends Module {
  val io = IO(new Bundle {
    val point = Input(new Point)
    val pixel = Output(new Pixel)

    val inputReady = Input(Bool())
    val outputReady = Output(Bool())
  })

  val fixdivX = Module(new FixPointDivision)
  val fixdivY = Module(new FixPointDivision)

  fixdivX.io.divident := io.point.x
  fixdivX.io.divisor := io.point.w
  fixdivX.io.inputReady := io.inputReady
  val pX = fixdivX.io.result

  fixdivY.io.divident := io.point.y
  fixdivY.io.divisor := io.point.w
  fixdivY.io.inputReady := io.inputReady
  val pY = fixdivY.io.result

  io.outputReady := fixdivX.io.resultReady & fixdivY.io.resultReady

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

  io.pixel.x := testOutX.asSInt()
  io.pixel.y := testOutY.asSInt()
  // Check if a point is behind z axis (-1 since openGL uses this)
  io.pixel.behind := (io.point.z <= fp(-1))
}
