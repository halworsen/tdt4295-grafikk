package clock

import chisel3._

class Clock extends Module{
  val io = IO(new Bundle {
    val count = Output(UInt(16.W))
  })

  val counter = RegInit(0.U(16.W))
  counter := counter + 1.U

  io.count := counter
}

class HasClock extends Module{
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val count = Output(UInt(16.W))
  })

  val clock2 = (clock.asUInt()(0) & io.enable).asClock()

  withClock(clock2) {
    val clockModule = Module(new Clock)
  }

  io.count := clockModule.io.count
}