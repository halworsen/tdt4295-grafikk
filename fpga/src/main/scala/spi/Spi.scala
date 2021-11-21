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

class Spi(dWidth: Int = 8) extends Module {

  def delay(x: Bool) = RegNext(x)

  val io = IO(new Bundle {
    // Spi signal
    val spi = Input(new SpiSlave())
    val value = Output(UInt(dWidth.W))
    val outputReady = Output(Bool())
  })

  val count = RegInit(
    0.U((log2Up(dWidth) + 1).W)
  )
  val valueReg = RegInit(0.U(dWidth.W))
  val valueOutput = RegInit(0.U(dWidth.W))
  io.value := valueOutput
  val clockReg = RegInit(0.U(3.W))
  val inputReg = RegInit(0.U(2.W))
  val csReg = RegInit(0.U(2.W))

  // Synchronize SPI clock and detect edges
  // Use a shift register to poll values from spi clk
  clockReg := Cat(clockReg(1, 0), io.spi.sclk)

  // SPI falling detection
  val spi_falling = clockReg(2, 1) === "b10".U
  val spi_rising = clockReg(2, 1) === "b01".U

  inputReg := Cat(inputReg(0), io.spi.mosi)
  val input = inputReg(1)
  csReg := Cat(csReg(0), io.spi.cs)
  val csActive = !csReg(1)

  io.outputReady := false.B

  when(!csActive) {
    // Reset count on CS inactive (active low)
    count := 0.U
  }.elsewhen(count === dWidth.U) {
    io.outputReady := true.B
  }
    // When master starts sending
    .elsewhen(spi_rising) {
      valueReg := Cat(valueReg(dWidth - 2, 0), input)
      count := count + 1.U
    }

  valueOutput := valueReg

  // TODO: Send data from FPGA to MCU - MISO
  // Won't be implemented.
}
