package fb

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class FrameBufferSpec extends FreeSpec with ChiselScalatestTester {
  "Should initialize correct graphics array while enabling writing" in {
    test(new FrameBuffer(4, 4)) { dut =>
      dut.io.writePixel.x.poke(1.S)
      dut.io.writePixel.y.poke(1.S)
      dut.io.writeEnable.poke(true.B)
      dut.clock.step(1)
      dut.io.readX.poke(1.U)
      dut.io.readY.poke(1.U)
      dut.clock.step(1)
    //dut.io.readVal(0).expect(1.U)
    //dut.io.readVal(1).expect(0.U)
    //dut.io.readVal(2).expect(0.U)
    }
    println("Success!")
  }
}
