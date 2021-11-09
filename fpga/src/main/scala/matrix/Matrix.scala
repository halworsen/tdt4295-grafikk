package matrix

import chisel3._
import chisel3.experimental.FixedPoint
import tools._


class MVP extends Module {
  val io = IO(new Bundle {
    val vec4 = Input(new Point)
    val mat4 = Input(Vec(4, Vec(4, FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))))
    val outVec4 = Output(new Point)
  })

  io.outVec4.x := (io.mat4(0)(0) * io.vec4.x + io.mat4(0)(1) 
                  * io.vec4.y + io.mat4(0)(2) * io.vec4.z + io.mat4(0)(3) * io.vec4.w)
  io.outVec4.y := (io.mat4(1)(0) * io.vec4.x + io.mat4(1)(1) 
                  * io.vec4.y + io.mat4(1)(2) * io.vec4.z + io.mat4(1)(3) * io.vec4.w)
  io.outVec4.z := (io.mat4(2)(0) * io.vec4.x + io.mat4(2)(1) 
                  * io.vec4.y + io.mat4(2)(2) * io.vec4.z + io.mat4(2)(3) * io.vec4.w)
  io.outVec4.w := (io.mat4(3)(0) * io.vec4.x + io.mat4(3)(1) 
                  * io.vec4.y + io.mat4(3)(2) * io.vec4.z + io.mat4(3)(3) * io.vec4.w)
}

class Mat4Multiply extends Module {
  val io = IO(new Bundle {
    val A = Input(Vec(4, Vec(4, FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))))
    val B = Input(Vec(4, Vec(4, FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))))
    val C = Output(Vec(4, Vec(4, FixedPoint(STD.fixedWidth, STD.binaryPoint.BP))))
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
