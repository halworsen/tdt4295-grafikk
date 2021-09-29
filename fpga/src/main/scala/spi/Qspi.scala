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
 *
 */
class QSpi(dWidth: Int) extends Module {

  val io = IO(new Bundle {
    // Spi signal
    val spi = new QSpiSlave
  })

  println("Generate SPI for :")
  println("Data size : " + dWidth)

  assert(dWidth == 8 || dWidth == 16, "Only 8 orr 16 bit support")

  mosi1Reg = RegInit(true.B)
  mosi2Reg = RegInit(true.B)
  mosi3Reg = RegInit(true.B)
  mosi4Reg = RegInit(true.B)
  
  sclkReg = RegInit(io.spi.sclk)
  val csReg = RegInit(io.spi.cs)

  val dataReg = RegInit("h00".U(dWidth.W))

  val count = RegInit(0.U(dWidth.W))


  // Clock Polarity, level of sck clock signal idle state
  val CPOL = false

  // Clock Phase, specifies whether or not sampling occurs on rising or falling edge
  // of sck clock
  val CPHA = true

  def fallingEdge(x: Bool) = x && !RegNext(x)
  def risingEdge(x: Bool) = !x && RegNext(x)

  // Read flag 
  val readReg  = RegInit(false.B)  



  val sInit = 0.U
  val stateReg = RegInit(S)

  // Definition of messages
  

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




}

