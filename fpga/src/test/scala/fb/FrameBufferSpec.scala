package fb

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class FrameBufferSpec extends FreeSpec with ChiselScalatestTester {
  /*
  "Should initialize correct graphics array without enabling writing" in {
    test(new FrameBuffer(3, 4)) { dut =>
      dut.io.writeEnable.poke(false.B)
      dut.io.selx.poke(1.U)
      dut.io.sely.poke(1.U)
      println(dut.io.selected.peek())

      // val matrix = VecInit(Seq.fill(4)(VecInit(Seq.fill(3)(0.U(1.W)))))
      println(dut.io.writeEnable.peek())
      // dut.io.output.expect(matrix)
      println("Horray!")
    }
  }

  "Should initialize correct graphics array while enabling writing" in {
    test(new FrameBuffer(4, 4)) { dut =>
      dut.io.writeEnable.poke(true.B)
      val matrix = VecInit(Seq.fill(4)(VecInit(Seq.fill(4)(1.U(1.W)))))
      dut.io.input.poke(matrix)
      dut.io.output.expect(dut.io.input)
    }
  }*/

  "Should initialize correct graphics array while enabling writing" in {
    test(new FrameBuffer(4, 4)) { dut =>
      dut.io.writeX.poke(1.U)
      dut.io.writeY.poke(1.U)

    }
  }
}
