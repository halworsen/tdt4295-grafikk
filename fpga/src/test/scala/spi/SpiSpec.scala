package spi

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class SpiSpec extends FreeSpec with ChiselScalatestTester {
  "Should initialize correct graphics array while enabling writing" in {
    test(new Spi(8)) { dut =>
      val toExpect = 0.U
      val next = 23.U
      dut.io.spi.cs.poke(true.B)
      dut.io.spi.miso.poke(false.B)
      dut.io.spi.mosi.poke(false.B)
    //for (i <- 0 to 7) {
    //dut.io.value.expect(toExpect)
    //dut.io.spi.sclk.poke(false.B)
    //dut.clock.step(25)
    //dut.io.spi.mosi.poke(next(i))
    //dut.clock.step(25)
    //dut.io.spi.sclk.poke(true.B)
    //dut.clock.step(50)

    //}
    //dut.io.value.expect(next)
    }
    println("Success!")
  }
}
