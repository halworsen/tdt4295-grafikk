package matrix

import chisel3._
import chisel3.util._
import chisel3.experimental._

import tools._
import tools.helpers.{fp}

class Rotator(points: Int = STD.pointNum, coordWidth: Int = 16) extends Module {
  val io = IO(new Bundle {
    val inPoints = Input(Vec(points, new Point))
    val mat4 = Input(Vec(points, Vec(points, STD.FP)))
    val out = Output(Vec(points, new Pixel))
  })

  // 45 deg rotaton counter clockwize
  val rotMat = VecInit(
    VecInit(
      fp(0.54),
      fp(0.84),
      fp(1),
      fp(1)
    ),
    VecInit(
      fp(-0.84),
      fp(0.54),
      fp(1),
      fp(1)
    ),
    VecInit(
      fp(1),
      fp(1),
      fp(1),
      fp(1)
    ),
    VecInit(
      fp(1),
      fp(1),
      fp(1),
      fp(1)
    )
  )

  for (i <- 0 to points - 1) {
    val mvp = Module(new MVP)
    mvp.io.mat4 := rotMat
    mvp.io.vec4(0) := io.inPoints(i).x
    mvp.io.vec4(1) := io.inPoints(i).y
    mvp.io.vec4(2) := fp(0)
    mvp.io.vec4(3) := fp(0)

    val normalizer = Module(new Normalizer)

    normalizer.io.point.x := mvp.io.outVec4(0)
    normalizer.io.point.y := mvp.io.outVec4(1)
    normalizer.io.point.z := fp(0)
    normalizer.io.point.w := io.inPoints(i).w

    io.out(i).x := normalizer.io.pixel.x
    io.out(i).y := normalizer.io.pixel.y
  }

  io.mat4 := DontCare

}
