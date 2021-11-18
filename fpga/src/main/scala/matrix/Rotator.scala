package matrix

import chisel3._
import chisel3.util._
import chisel3.experimental._

import tools._
import tools.helpers.{fp}

class Rotator(points: Int = STD.pointNum) extends Module {
  val io = IO(new Bundle {
    val inPoints = Input(Vec(points, new Point))
    val mat4 = Input(Vec(points, Vec(points, STD.FP)))
    val outFP = Output(Vec(points, new Point))
    val out = Output(Vec(points, new Pixel))
  })

  // 5 deg rotation counter clockwize
  val rotMat = VecInit(
    VecInit(
      //fp(0.996),
      //fp(0.087),
      fp(1),
      fp(0),
      fp(0),
      fp(0)
    ),
    VecInit(
      //fp(-0.087),
      //fp(0.996),
      fp(0),
      fp(1),
      fp(0),
      fp(0)
    ),
    VecInit(
      fp(0),
      fp(0),
      fp(1),
      fp(0)
    ),
    VecInit(
      fp(0),
      fp(0),
      fp(0),
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

    io.outFP(i).x := mvp.io.outVec4(0)
    io.outFP(i).y := mvp.io.outVec4(1)
    io.outFP(i).z := fp(0)
    io.outFP(i).w := io.inPoints(i).w

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
