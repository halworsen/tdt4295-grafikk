package spi

import chisel3._

import tools.helpers.log2
import tools._
// import tools.DataFrame

class SpiSlave extends Bundle {
  // This module accurately represents a SPI slave
  // Mosi: Master Out, Slave In
  // Miso: Master In, Slave Out
  // SCLK: System Clock, 25MHz in our case
  // CS: Chip Select
  val mosi = Bool()
  val miso = Bool()
  val sclk = Bool()
  val cs = Bool()
}

/** [[Spi]]
 * @param dWidth
 */
class Spi(dWidth: Int = 8) extends Module {

  val io = IO(new Bundle {
    // Spi signal
    val spi = Input(new SpiSlave())
    val value = Output(UInt(dWidth.W))
  })

  val count = RegInit(0.U(dWidth.W)) // FIXME: maybe downsize this register
  val valueReg = RegInit(0.U(dWidth.W))
  val valueOutput = RegInit(0.U(dWidth.W))
  io.value := valueOutput
  val clockReg = RegInit(false.B)
  clockReg := io.spi.sclk
  
  // When master starts sending
  when(!clockReg & io.spi.sclk) {
    valueReg := (valueReg ^ (io.spi.mosi << count))
    count := count + 1.U 
    // Reset count when we've reached 8 bits
    // Send this value to 
    when (count === (dWidth-1).U) {
      valueOutput := valueReg
      valueReg := 0.U
      count := 0.U
    }
  }


  // TODO: Send data from FPGA to MCU - MISO
}

