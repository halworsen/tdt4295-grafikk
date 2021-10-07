package matrix

import chisel3._

class MVP extends Module {
  val io = IO(new Bundle {
    val vec4 = Input(Vec(4, SInt(32.W)))
    val mat4 = Input(Vec(4, Vec(4, SInt(32.W))))
    val outVec4 = Output(Vec(4, SInt(32.W)))
  })

  for (r <- 0 to 3) {
    io.outVec4(r) := (io.mat4(r)(0) * io.vec4(0) + io.mat4(r)(1) * io.vec4(1) + io.mat4(r)(2) * io.vec4(2) + io.mat4(r)(3) * io.vec4(3))
  }
}

class Mat4Multiply extends Module {
  val io = IO(new Bundle {
    val A = Input(Vec(4, Vec(4, SInt(32.W))))
    val B = Input(Vec(4, Vec(4, SInt(32.W))))
    val C = Output(Vec(4, Vec(4, SInt(32.W))))
  })

  val matC = RegInit(VecInit(Seq.fill(4)(VecInit(Seq.fill(4)(0.S(32.W))))))
  var sum = 0.S

  for (r <- 0 to 3) {
    for (c <- 0 to 3) {
      sum = 0.S
      for (k <- 0 to 3) {
        sum = sum + io.A(r)(k) * io.B(k)(c)
      }
      println(sum)
      matC(r)(c) := sum
    }
  }
  io.C := matC
}
