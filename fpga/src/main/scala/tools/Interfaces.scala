package tools
import chisel3._
import tools.helpers.log2
import Chisel.log2Up
import chisel3.experimental.FixedPoint

object STD {
  val pointNum = 4
  val linenum = 4
  val pointIndexWidth = 16.W
  val fixedWidth = 16.W
  val binaryPoint = 12.BP
  val binaryPointVal = 12
  val colorEnabled = true
  val colorWidth = 4.W

  val screenWidth = 640
  val screenHeight = 480
  val coordWidth = 16.W
  val bgColor = "b000100010001".U
  val mainColor = "b110010010001".U
  def FP = FixedPoint(STD.fixedWidth, STD.binaryPoint)
}

// Classes for multiple objects
// class DataFrame(objectsNum: Int = 1, lineNum: Int, pointNum: Int)
//     extends Bundle {
//   val VPMatrix = Vec(4, Vec(4, FixedPoint(12.W, 10.BP)))
//   val Objects = Vec(objectsNum, new RenderObject(lineNum, pointNum))
// }

// class RenderObject(lineNum: Int, pointNum: Int) extends Bundle {
//   val Lines = Vec(lineNum, new Line(log2Up(pointNum)))
//   val Points = Vec(pointNum, new Point)
//   val MMatrix = Vec(4, Vec(4, FixedPoint(12.W, 10.BP)))
// }

class DataFrame extends Bundle {
  val points = Vec(STD.pointNum, new Point)
  val lines = Vec(STD.linenum, new Line)
  val matrix = Vec(
    STD.pointNum,
    Vec(STD.pointNum, STD.FP)
  )
}

class PixelFrame extends Bundle {
  val points = Vec(STD.pointNum, new Pixel)
  val lines = Vec(STD.linenum, new Line)
}

class Line extends Bundle {
  val index1 = UInt(STD.pointIndexWidth)
  val index2 = UInt(STD.pointIndexWidth)
}

class Color extends Bundle {
  val r = UInt(STD.colorWidth)
  val g = UInt(STD.colorWidth)
  val b = UInt(STD.colorWidth)
}

class Point extends Bundle {
  val x = STD.FP
  val y = STD.FP
  val z = STD.FP
  val w = STD.FP
}

class Pixel extends Bundle {
  val x = UInt(STD.coordWidth)
  val y = UInt(STD.coordWidth)
}
