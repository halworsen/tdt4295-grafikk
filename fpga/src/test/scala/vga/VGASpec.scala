
/*package vga

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class VGASpec extends FreeSpec with ChiselScalatestTester {
  "Should go to visible area" in {
    test(new VGA) { dut =>
      dut.io.data.poke(true.B)
      dut.clock.step(1)
      dut.io.hsync.expect(dut.io.selX < 640.U)
      dut.io.vsync.expect(dut.io.selY < 480.U)
      println(dut.io.selX.peek())
      println(dut.io.selY.peek())
      dut.io.out.expect(false.B)
    }
    println("Goes to visible Area!")
  }

  "Should go to HSYNC and VSYNC" in {
    test(new VGA) { dut =>
      dut.io.data.poke(true.B)
      dut.clock.step(1)
      dut.io.hsync.expect(dut.io.selX >= (640+16).U & dut.io.selX < (640+16+96).U)
      dut.io.vsync.expect(dut.io.selY >= (480+10).U & dut.io.selY < (480+10+2).U)
      println(dut.io.selX.peek())
      println(dut.io.selY.peek())
      dut.io.out.expect(false.B)
    }
    println("Goes to HSYNC and VSYNC!")
  }

  "Should go to HSYNC" in {
    test(new VGA) { dut =>
      dut.io.data.poke(true.B)
      dut.clock.step(1)
      dut.io.hsync.expect(dut.io.selX >= (640+16).U & dut.io.selX < (640+16+96).U)
      println(dut.io.selX.peek())
      println(dut.io.selY.peek())
      dut.io.out.expect(false.B)
    }
    println("Goes to HSYNC!")
  }

  "Should go to VSYNC" in {
    test(new VGA) { dut =>
      dut.io.data.poke(true.B)
      dut.clock.step(1)
      dut.io.vsync.expect(dut.io.selY >= (480+10).U & dut.io.selY < (480+10+2).U)
      println(dut.io.selX.peek())
      println(dut.io.selY.peek())
      dut.io.out.expect(false.B)
    }
    println("Goes to VSYNC!")
  }
  "Should go to Porches" in {
    test(new VGA) { dut =>
      dut.io.data.poke(true.B)
      dut.clock.step(1)
      println(dut.io.selX.peek())
      println(dut.io.selY.peek())
      dut.io.out.expect(false.B)
    }
    println("Goes to Porches!")
  }

}
*/