package fb

import chisel3._
import chisel3.tester._
import chisel3.experimental.{FixedPoint, fromDoubleToDoubleParam}
import org.scalatest.FreeSpec

class FixedPointSpec extends FreeSpec with ChiselScalatestTester {
  "Should initialize correct graphics array while enabling writing" in {
    test(new FrameBuffer(4, 4)) { dut =>
      val a = FixedPoint.fromDouble(3, 16.W, 4.BP)
      val b = FixedPoint.fromDouble(2, 16.W, 4.BP)
      println(a / b)
    }
    println("Success!")
  }
}
