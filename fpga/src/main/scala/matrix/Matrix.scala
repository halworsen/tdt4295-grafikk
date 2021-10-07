package matrix

import chisel3._

class MVP extends Module {
  val io = IO(new Bundle {
    val vec4 = Input(Vec(4, SInt(32.W)))
    val mat4 = Input(Vec(4, Vec(4, SInt(32.W))))
    val outVec4 = Output(Vec(4, SInt(32.W)))
  })

  for (r <- 0 to 3) {
    for (c <- 0 to 3) {
      io.outVec4(r) := io.outVec4(r) + (io.mat4(r)(c) * io.vec4(c))
    }
  }
}

class Mat4Multiply extends Module {
  val io = IO(new Bundle {
    val A = Input(Vec(4, Vec(4, SInt(32.W))))
    val B = Input(Vec(4, Vec(4, SInt(32.W))))
    val C = Output(Vec(4, Vec(4, SInt(32.W))))
  })

  for (r <- 0 to 3) {
    for (c <- 0 to 3) {
      io.C(r) := 0.S
      for (k <- 0 to 3) {
        io.C(r)(c) := io.A(r)(k) * io.B(k)(c)
      }
    }
  }
}
