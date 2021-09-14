import chisel3._

class Main extends Module {
  val io = IO(new Bundle {
    val led = Output(Vec(4, UInt(1.W)))

    val btn = Input(Vec(2, UInt(1.W)))
  })

  var counter = Reg(UInt())

  when(io.btn(0) === true.B) {
    counter := counter + 1.U
  }
  for (i <- 0 to 3) {
    io.led(i) := 0.U
  }

  when(counter === 1.U) {
    io.led(0) := true.B
  }
  when(counter === 2.U) {
    io.led(2) := true.B
  }
  when(counter === 3.U) {
    io.led(3) := true.B
  }

  when(counter === 4.U) {
    counter := 0.U
    io.led(0) := true.B
  }

  //val x  = Reg(UInt())
  //val y  = Reg(UInt())
}

object Main extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Main())
}
