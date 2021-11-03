package matrix

import chisel3._
import chisel3.experimental._
import chisel3.tester._
import org.scalatest.FreeSpec

class MVPSpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x1 with 4x4" in {
    test(new MVP) { dut =>
      for (i <- 0 to 3) {
        dut.io.vec4(i).poke((i + 1).S)
        dut.io.mat4(0)(i).poke(FixedPoint(i + 1, 8.W, 4.BP))
        dut.io.mat4(1)(i).poke(FixedPoint(i + 1, 8.W, 4.BP))
        dut.io.mat4(2)(i).poke(FixedPoint(i + 1, 8.W, 4.BP))
        dut.io.mat4(3)(i).poke(FixedPoint(i + 1, 8.W, 4.BP))
      }

      dut.io.outVec4(0).expect(30.S)
      dut.io.outVec4(1).expect(30.S)
      dut.io.outVec4(2).expect(30.S)
      dut.io.outVec4(3).expect(30.S)
    }
    println("Successfully multiplied 4x1 with 4x4 matrix!")
  }
}

class Mat4MultiplySpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x4 with 4x4" in {
    test(new Mat4Multiply) { dut =>
      for (i <- 0 to 3) {
        dut.io.A(0)(i).poke((i + 1).S)
        dut.io.A(1)(i).poke((i + 1).S)
        dut.io.A(2)(i).poke((i + 1).S)
        dut.io.A(3)(i).poke((i + 1).S)

        dut.io.B(0)(i).poke((i + 1).S)
        dut.io.B(1)(i).poke((i + 1).S)
        dut.io.B(2)(i).poke((i + 1).S)
        dut.io.B(3)(i).poke((i + 1).S)
      }

      for (j <- 0 to 3) {
        dut.io.C(j)(0).expect(10.S)
        dut.io.C(j)(1).expect(20.S)
        dut.io.C(j)(2).expect(30.S)
        dut.io.C(j)(3).expect(40.S)
      }
    }
    println("Successfully multiplied 4x4 with 4x4 matrix!")
  }
}
