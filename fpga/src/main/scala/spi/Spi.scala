package spi

import chisel3._
import chisel3.util._

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

  val count = RegInit(
    0.U(log2Up(dWidth).W)
  )
  val valueReg = RegInit(0.U(dWidth.W))
  val valueOutput = RegInit(0.U(dWidth.W))
  io.value := valueOutput
  val clockReg = RegInit(0.U(3.W))
  val inputReg = RegInit(0.U(2.W))

  // Synchronize SPI clock and detect edges
  // Use a shift register to poll values from spi clk
  clockReg := Cat(clockReg(1, 0), io.spi.sclk)

  // SPI falling detection
  val spi_falling = clockReg(2, 1) === "b10".U
  val spi_rising = clockReg(2, 1) === "b01".U

  inputReg := Cat(inputReg(0), io.spi.mosi)
  val input = inputReg(1)

  // When master starts sending
  when(spi_rising) {
    valueReg := Cat(valueReg(6, 0), input)
    count := count + 1.U
    // Reset count when we've reached 8 bits
    // Send this value to
    when(count === (dWidth - 1).U) {
      //valueReg := 0.U
      count := 0.U
    }
  }

  valueOutput := valueReg

  // TODO: Send data from FPGA to MCU - MISO
}
