package matrix

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import tools._
import tools.Helpers._
import chisel3.experimental.FixedPoint

class NormalizationSpec extends FreeSpec with ChiselScalatestTester {
  "Should w normalize and convert point to pixel" in {
    test(new Normalizer) { dut =>

      dut.io.point.x.poke(doubleToFP(0.0))
      dut.io.point.y.poke(doubleToFP(0.0))
      dut.io.point.z.poke(doubleToFP(0.25))
      dut.io.point.w.poke(doubleToFP(1.0))

      dut.io.pixel.x.expect(320.U)
      dut.io.pixel.y.expect(240.U)

      dut.io.point.x.poke(doubleToFP(-1.0))
      dut.io.point.y.poke(doubleToFP(1.0))

      dut.io.pixel.x.expect(0.U)
      dut.io.pixel.y.expect(0.U)

      dut.io.point.w.poke(doubleToFP(2.0))

      dut.io.pixel.x.expect(160.U)
      dut.io.pixel.y.expect(120.U)

      dut.io.point.x.poke(doubleToFP(-0.5))
      dut.io.point.y.poke(doubleToFP(0.5))
      dut.io.point.w.poke(doubleToFP(0.5))

      dut.io.pixel.x.expect(0.U)
      dut.io.pixel.y.expect(0.U)

      dut.io.point.w.poke(doubleToFP(0.0))
      dut.io.point.x.poke(doubleToFP(0.0))
      dut.io.point.y.poke(doubleToFP(0.0))

      println(dut.io.pixel.x.peek())
      println(dut.io.pixel.y.peek())

    }
    println("Successfully converted point to pixel!")
  }
}