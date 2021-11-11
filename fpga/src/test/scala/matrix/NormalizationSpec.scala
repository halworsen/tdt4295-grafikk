package matrix

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import tools._
import chisel3.experimental.FixedPoint

class NormalizationSpec extends FreeSpec with ChiselScalatestTester {
  "Should multiply 4x1 with 4x4" in {
    test(new Normalizer) { dut =>

      val p = new Point
      p.x := FixedPoint.fromDouble(0.0, STD.fixedWidth, STD.binaryPoint)
      p.y := FixedPoint.fromDouble(0.0, STD.fixedWidth, STD.binaryPoint)
      p.z := FixedPoint.fromDouble(0.25, STD.fixedWidth, STD.binaryPoint)
      p.w := FixedPoint.fromDouble(1.0, STD.fixedWidth, STD.binaryPoint)
      dut.io.point.poke(p)

      val pix = new Pixel

      // Center of coordinate system
      pix.x := 320.U
      pix.y := 240.U

      dut.io.pixel.expect(pix)
      

   
    }
    println("Successfully converted point to pixel!")
  }
}