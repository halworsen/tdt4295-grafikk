package matrix

import chisel3._
import chisel3.experimental._
import tools._

class MVP(dim: Int = STD.pointNum) extends Module {
  val io = IO(new Bundle {
    val vec4 = Input(Vec(dim, STD.FP))
    val mat4 = Input(Vec(dim, Vec(dim, STD.FP)))
    val outVec4 = Output(Vec(dim, STD.FP))
  })

  for (r <- 0 to dim - 1) {
    io.outVec4(r) := (io.mat4(r)(0) * io.vec4(0) + io.mat4(
      r
    )(
      1
    ) *
      io
        .vec4(
          1
        )

      + io.mat4(r)(2) * io.vec4(2) + io.mat4(r)(3) * io.vec4(3))
  }
}

class Mat4Multiply extends Module {
  val io = IO(new Bundle {
    val A = Input(Vec(4, Vec(4, STD.FP)))
    val B = Input(Vec(4, Vec(4, STD.FP)))
    val C = Output(Vec(4, Vec(4, STD.FP)))
  })

  for (r <- 0 to 3) {
    for (c <- 0 to 3) {
      io.C(r)(c) :=
        io.A(r)(0) * io.B(0)(c) +
          io.A(r)(1) * io.B(1)(c) +
          io.A(r)(2) * io.B(2)(c) +
          io.A(r)(3) * io.B(3)(c)
    }
  }
}
