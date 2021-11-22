package matrix

import chisel3._
import chisel3.util._
import chisel3.experimental._

import tools._
import tools.helpers.{fp}

class Rotator(points: Int = STD.pointNum, dimension: Int = STD.pointDimension)
    extends Module {
  val io = IO(new Bundle {
    val inPoints = Input(Vec(points, new Point))
    val mat4 = Input(Vec(dimension, Vec(dimension, STD.FP)))
    val outFP = Output(Vec(points, new Point))
    val out = Output(Vec(points, new Pixel))
    val behindPoints = Output(Vec(points, Bool()))
    val inputReady = Input(Bool())
    val outputReady = Output(Bool())
  })

  val mat = RegNext(io.mat4)

  // 5 deg rotation counter clockwize
  val rotMat = VecInit(
    VecInit(
      fp(0.996),
      fp(0.087),
      //fp(1),
      //fp(0),
      fp(0),
      fp(0)
    ),
    VecInit(
      fp(-0.087),
      fp(0.996),
      //fp(0),
      //fp(1),
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

  val outputs = Wire(Vec(points, Bool()))

  for (i <- 0 to points - 1) {
    val mvp = Module(new MVP)
    mvp.io.mat4 := mat
    //mvp.io.mat4 := rotMat
    mvp.io.vec4(0) := io.inPoints(i).x
    mvp.io.vec4(1) := io.inPoints(i).y
    mvp.io.vec4(2) := io.inPoints(i).z
    mvp.io.vec4(3) := io.inPoints(i).w

    io.outFP(i).x := mvp.io.outVec4(0)
    io.outFP(i).y := mvp.io.outVec4(1)
    io.outFP(i).z := mvp.io.outVec4(2)
    io.outFP(i).w := mvp.io.outVec4(3)

    val normalizer = Module(new Normalizer)
    outputs(i) := normalizer.io.outputReady

    // RegNext to not break timing
    normalizer.io.inputReady := RegNext(io.inputReady)
    normalizer.io.point.x := RegNext(mvp.io.outVec4(0))
    normalizer.io.point.y := RegNext(mvp.io.outVec4(1))
    normalizer.io.point.z := RegNext(mvp.io.outVec4(2))
    normalizer.io.point.w := RegNext(mvp.io.outVec4(3))

    io.out(i).x := RegNext(normalizer.io.pixel.x)
    io.out(i).y := RegNext(normalizer.io.pixel.y)
    io.out(i).behind := RegNext(normalizer.io.pixel.behind)
  }

  io.outputReady := RegNext(outputs.reduce((a, b) => a & b))
}
