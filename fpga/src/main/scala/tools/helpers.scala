package tools

import chisel3._

import scala.math.log10

object helpers {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt
}
