package matrix

import chisel3._
import chisel3.util._
import chisel3.experimental._

import tools.Pixel

class Rotator(points: Int = 4, coordWidth: Int = 16) extends Module {
  val io = IO(new Bundle {
    val inPoints = Input(Vec(points, new Pixel(coordWidth)))
    val mat4 = Input(Vec(4, Vec(4, FixedPoint(8.W, 4.BP))))
    val outPoints = Output(Vec(points, new Pixel(coordWidth)))
  })
  val toFP = (v: SInt) => (v << 4.U)(7, 0).asFixedPoint(4.BP)

  val rotMat = VecInit(
    VecInit(
      0.54.F(8.W, 4.BP),
      0.84.F(8.W, 4.BP),
      1.F(8.W, 4.BP),
      1.F(8.W, 4.BP)
    ),
    VecInit(
      -0.84.F(8.W, 4.BP),
      0.54.F(8.W, 4.BP),
      1.F(8.W, 4.BP),
      1.F(8.W, 4.BP)
    ),
    VecInit(
      1.F(8.W, 4.BP),
      1.F(8.W, 4.BP),
      1.F(8.W, 4.BP),
      1.F(8.W, 4.BP)
    ),
    VecInit(1.F(8.W, 4.BP), 1.F(8.W, 4.BP), 1.F(8.W, 4.BP), 1.F(8.W, 4.BP))
  )

  for (i <- 0 to points - 1) {
    val trMMa = Module(new Mat4Multiply)
    val trMMb = Module(new Mat4Multiply)
    trMMa.io.A := VecInit(
      VecInit(1.F(8.W, 4.BP), 0.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(0.F(8.W, 4.BP), 1.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(0.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(
        toFP(io.inPoints(i).x.asSInt),
        toFP(io.inPoints(i).y.asSInt),
        1.F(8.W, 4.BP),
        1.F(8.W, 4.BP)
      )
    )
    trMMa.io.B := rotMat

    trMMb.io.A := trMMa.io.C
    trMMb.io.B := VecInit(
      VecInit(1.F(8.W, 4.BP), 0.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(0.F(8.W, 4.BP), 1.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(0.F(8.W, 4.BP), 0.F(8.W, 4.BP), 1.F(8.W, 4.BP), 1.F(8.W, 4.BP)),
      VecInit(
        toFP(-io.inPoints(i).x.asSInt),
        toFP(-io.inPoints(i).y.asSInt),
        1.F(8.W, 4.BP),
        1.F(8.W, 4.BP)
      )
    )

    val mvp = Module(new MVP)
    mvp.io.mat4 := trMMb.io.C
    mvp.io.vec4(0) := io.inPoints(i).x.asSInt
    mvp.io.vec4(1) := io.inPoints(i).y.asSInt
    mvp.io.vec4(2) := 0.S
    mvp.io.vec4(3) := 0.S

    io.outPoints(i).x := mvp.io.outVec4(0).asUInt
    io.outPoints(i).y := mvp.io.outVec4(1).asUInt
  }

  io.mat4 := DontCare

}
