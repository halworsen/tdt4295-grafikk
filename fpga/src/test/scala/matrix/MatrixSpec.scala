package matrix

import chisel3._
import chisel3.experimental._
import chisel3.tester._
import org.scalatest.FreeSpec
import tools.helpers.fp

class MVPSpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x1 with 4x4" in {
    test(new MVP) { dut =>
      for (i <- 0 to 3) {
        dut.io.vec4(i).poke(fp(0.5))
        dut.io.mat4(0)(i).poke(fp(0.5))
        dut.io.mat4(1)(i).poke(fp(0.25))
        dut.io.mat4(2)(i).poke(fp(1))
        dut.io.mat4(3)(i).poke(fp(1))
      }

      dut.io.outVec4(0).expect(fp(1.375))
      dut.io.outVec4(1).expect(fp(1.375))
      dut.io.outVec4(2).expect(fp(1.375))
      dut.io.outVec4(3).expect(fp(1.375))
    }
    println("Successfully multiplied 4x1 with 4x4 matrix!")
  }
}

class Mat4MultiplySpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x4 with 4x4" in {
    test(new Mat4Multiply) { dut =>
      for (i <- 0 to 3) {
        dut.io.A(0)(i).poke(fp(i + 1))
        dut.io.A(1)(i).poke(fp(i + 1))
        dut.io.A(2)(i).poke(fp(i + 1))
        dut.io.A(3)(i).poke(fp(i + 1))

        dut.io.B(0)(i).poke(fp(i + 1))
        dut.io.B(1)(i).poke(fp(i + 1))
        dut.io.B(2)(i).poke(fp(i + 1))
        dut.io.B(3)(i).poke(fp(i + 1))
      }

      for (j <- 0 to 3) {
        dut.io.C(j)(0).expect(fp(10))
        dut.io.C(j)(1).expect(fp(20))
        dut.io.C(j)(2).expect(fp(30))
        dut.io.C(j)(3).expect(fp(40))
      }
    }
    println("Successfully multiplied 4x4 with 4x4 matrix!")
  }
}
