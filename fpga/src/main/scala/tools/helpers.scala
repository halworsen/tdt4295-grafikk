package tools

import chisel3._
import chisel3.util.Reverse
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

  def spiToDataframe = (data: Bits) => {
    val dataFrame = Wire(new DataFrame)
    val rawData = data.asTypeOf(new DataFrame)
    dataFrame.points := rawData.points.reverse
    dataFrame.lines := rawData.lines.reverse
    val matrixRev = rawData.matrix.reverse
    for (i <- 0 until dataFrame.matrix.length) {
      dataFrame.matrix(i) := matrixRev(i).reverse
    }

    dataFrame.header := rawData.header

    dataFrame
  }
}
