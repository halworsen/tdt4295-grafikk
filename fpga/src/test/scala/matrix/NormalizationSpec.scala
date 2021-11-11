package matrix

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import tools._
import tools.Helpers._
import chisel3.experimental.FixedPoint

class NormalizationSpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x1 with 4x4" in {
    test(new Normalizer) { dut =>

      // val p = new Point
      // p.x := decToFP(0.0)
      // p.y := decToFP(0.0)
      // p.z := decToFP(0.25)
      // p.w := decToFP(1.0)
      // dut.io.point.poke(p)

      // val pix = new Pixel
      // // Center of coordinate system
      // pix.x := 320.U
      // pix.y := 240.U

      // dut.io.pixel.expect(pix)

      dut.io.point.x.poke(decToFP(0.0))
      dut.io.point.y.poke(decToFP(0.0))
      dut.io.point.z.poke(decToFP(0.25))
      dut.io.point.w.poke(decToFP(1.0))

      dut.io.pixel.x.expect(320.U)
      dut.io.pixel.y.expect(240.U)

      dut.io.point.x.poke(decToFP(-1.0))
      dut.io.point.y.poke(decToFP(1.0))

      dut.io.pixel.x.expect(0.U)
      dut.io.pixel.y.expect(0.U)

    }
    println("Successfully converted point to pixel!")
  }
}