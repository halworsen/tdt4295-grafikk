package tools

import chisel3._
import chisel3.experimental._

import scala.math.log10

object helpers {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt

  def bitNr(reg: UInt, nr: Int, bufferWidth: Int = 64, dataWidth: Int = 16) = {
    reg(
      bufferWidth - nr * dataWidth - 1,
      bufferWidth - (nr + 1) * dataWidth
    )
  }

  def bitNrHW(
      reg: UInt,
      nr: UInt,
      bufferWidth: Int = 64,
      dataWidth: Int = 16
  ) = {
    (reg << (bufferWidth.U - nr * dataWidth.U - 1.U))
  }

  def fp = (v: Double) => v.F(STD.fixedWidth, STD.binaryPoint)

  val divFP = (a: FixedPoint, w: FixedPoint) =>
    ((a << STD.binaryPointVal).asSInt() / w.asSInt())
      .asFixedPoint(STD.binaryPoint)
}
