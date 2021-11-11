package tools

import chisel3._

import scala.math.log10
import chisel3.experimental.FixedPoint

object Helpers {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt : Int
  val toFP = (v: SInt) => (v << STD.binaryPoint).asFixedPoint(STD.binaryPoint.BP) : FixedPoint
  val divFP = (a: FixedPoint, w: FixedPoint) => ((a<<STD.binaryPoint).asSInt() / w.asSInt()).asFixedPoint(STD.binaryPoint.BP)

  /** Generate a chisel FixedPoint from a decimal number (double)
    *
    * @return 
    *   The newly created fixedpoint
    */
  val decToFP = (v: Double) => FixedPoint.fromDouble(v, STD.fixedWidth, STD.binaryPoint.BP) : FixedPoint

  def bitNr(reg: UInt, nr: Int, bufferWidth: Int = 64, dataWidth: Int = 16) = {
    reg(
      bufferWidth - nr * dataWidth - 1,
      bufferWidth - (nr + 1) * dataWidth
    )
  } 
}
