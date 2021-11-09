package tools

import chisel3._
import chisel3.Experimental.FixedPoint

import scala.math.log10

object helpers {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt

  def bitNr(reg: UInt, nr: Int, bufferWidth: Int = 64, dataWidth: Int = 16) = {
    reg(
      bufferWidth - nr * dataWidth - 1,
      bufferWidth - (nr + 1) * dataWidth
    )
  }
}
