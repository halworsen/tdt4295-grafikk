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
      val mosi1 = Input(Bool())
      val mosi2 = Input(Bool())
      val mosi3 = Input(Bool())
      val mosi4 = Input(Bool())
      val miso1 = Output(Bool())
      val miso2 = Output(Bool())
      val miso3 = Output(Bool())
      val miso4 = Output(Bool())
      val sclk = Input(Bool())
      val cs = Input(Bool())
  })
}

/** [[Qspi]]
 * @param dWidth
 * @param aWidth
 */
class QSpi(dWidth: Int, aWidth: Int) extends Module {

  val io = IO(new Bundle {
    // Spi signal
    val spi = new QSpiSlave
  })

  println("Generate SPI for :")
  println("Data size : " + dWidth)
  println("Addr size : " + aWidth)

  // TODO: Find out the length of the messages we're going to send between FPGA and MCU
  assert(dWidth == 8 || dWidth == 16, "Only 8 orr 16 bit support")

  // TODO: Find out supported address lengths

  mosi1Reg = RegInit(true.B)
  mosi2Reg = RegInit(true.B)
  mosi3Reg = RegInit(true.B)
  mosi4Reg = RegInit(true.B)

  val miso1Reg = RegInit(true.B)
  val miso2Reg = RegInit(true.B)
  val miso3Reg = RegInit(true.B)
  val miso4Reg = RegInit(true.B)
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

  ----- 16 Bit -----
  [1111 | 1110 | 1101 | 1100 | 1011 | 1010 | 1001 | 1000 | 0111 | 0110 | 0101 | 0100 | 0011 | 0010 | 0001 | 0000]

  

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
  io.spi.miso1 := miso1Reg
  io.spi.miso2 := miso2Reg
  io.spi.miso3 := miso3Reg
  io.spi.miso4 := miso4Reg




}

