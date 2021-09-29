package spi

import chisel3._

import tools.helpers.log2

class QSpiSlave extends Module {
  // This module accurately represents a QSPI slave
  // Mosi: Master Out, Slave In
  // Miso: Master In, Slave Out
  // SCLK: System Clock, 25MHz in our case
  // CS: Chip Select
  val io = IO(new Bundle {
      val mosi = Input(Bool())
      val miso = Output(Bool())
      val sclk = Input(Bool())
      val cs = Input(Bool())
  })
}

/** [[Qspi]]
 * @param dWidth
 */
class QSpi(dWidth: Int = 8) extends Module {

  val io = IO(new Bundle {
    // Spi signal
    val spi = new QSpiSlave
  })

  println("Generate SPI for :")
  println("Data size : " + dWidth)

  // TODO: Find out the length of the messages we're going to send between FPGA and MCU
  assert(dWidth == 8 || dWidth == 16, "Only 8 orr 16 bit support")

  // TODO: Find out supported address lengths

  mosiReg = RegInit(true.B)

  val misoReg = RegInit(true.B)
  sclkReg = RegInit(io.spi.sclk)
  val csReg = RegInit(io.spi.cs)

  val dataReg = RegInit("h00".U(dWidth.W))

  val count = RegInit(0.U(dWidth.W))


  // Clock Polarity, level of sck clock signal idle state
  // CPOL  | leading edge | trailing edge
  // ------|--------------|--------------
  // false | rising       | falling
  // true  | falling      | rising
  val CPOL = false

  // Clock Phase, specifies whether or not sampling occurs on rising or falling edge
  // of sck clock
  // CPHA  | data change    | data read
  // ------|----------------|--------------
  // false | trailling edge | leading edge
  // true  | leading edge   | trailing edge
  val CPHA = true

  // Current support, we can change whether or not we want to write or read on leading/trailing edge
  assert(CPHA && !CPOL)

  def fallingEdge(x: Bool) = x && !RegNext(x)
  def risingEdge(x: Bool) = !x && RegNext(x)

  // Read flag 
  val readReg  = RegInit(false.B)  

  val sInit = 0.U
  val stateReg = RegInit(S)

  // Definition of messages
  /*
  ----- 8 Bit -----
  [111 | 110 | 101 | 100 | 011 | 010 | 001 | 000]


  */
  

  // State machine logic
  switch(stateReg) {
    is(sInit) {
    
    }
    is(1.U) {

    }
  }

  // Reset state machine to sInit when cs rise
  // Count does not have to be right
  when(risingEdge(csReg)){
    stateReg := sInit
  }

  // QSPI Signals
  io.spi.miso := misoReg

}

