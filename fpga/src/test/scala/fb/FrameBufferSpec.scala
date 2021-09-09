package fb

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class FrameBufferSpec extends FreeSpec with ChiselScalatestTester {
  "Should initialize correct graphics array while enabling writing" in {
    test(new FrameBuffer(4, 4)) { dut =>
      dut.io.writeX.poke(1.U)
      dut.io.writeY.poke(1.U)
      dut.io.writeEnable.poke(true.B)
      dut.io.writeVal.poke(true.B)
      dut.clock.step(1)
      dut.io.readX.poke(1.U)
      dut.io.readY.poke(1.U)
      dut.io.readVal.expect(true.B)
    }
    println("Success!")
  }
}
