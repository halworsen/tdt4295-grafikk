package tools

import scala._
import chisel3._
import fb.FrameBuffer

import scala.math.log10

object helpers {
  var log2 = (x: Int) => (log10(x) / log10(2.0)).toInt
  var setPixel = (fb: FrameBuffer, x: UInt, y: UInt, value: Bool) => {
     fb.io.writeEnable := true.B;
     fb.io.writeVal := value;
     fb.io.writeX := x;
     fb.io.writeY := y;
  };
}