package fb

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class FrameBufferSpec extends FreeSpec with ChiselScalatestTester {

  "Should initialize correct graphics array without enabling writing" in {
    test(new FrameBuffer(3, 4)) { dut =>
      dut.io.writeEnable.poke(false.B)
      val matrix = VecInit(Seq.fill(4)(VecInit(Seq.fill(3)(0.U(1.W)))))
      dut.io.output.expect(matrix)
      println("Horray!")
    }
  }
}
