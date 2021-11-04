package tools
import chisel3._
import tools.helpers.log2
import Chisel.log2Up
import chisel3.experimental.FixedPoint
object STD {
  val pointNum = 8
  val linenum = 12
  val lineIndexWidth = 8.W
  val fixedWidth = 16.W
  val binaryPoint = 4.BP
  val colorEnabled = true
  val colorWidth = 3.W

  val screenWidth = 640
  val screenHeight = 480
  val coordWidth = 16.W
  val bgColor = "b001001001".U
  val yellow = "h1".U(colorWidth)##"h2".U(colorWidth)##"h0".U(colorWidth)
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



class DataFrame extends Bundle{
  val MPV = Vec(4, Vec(4, FixedPoint(STD.fixedWidth, STD.binaryPoint)))
  val lines = Vec(STD.linenum, new Line)
  val points = Vec(STD.pointNum, new Pixel)
}

class Line extends Bundle {
  val index1 = UInt(STD.lineIndexWidth)
  val index2 = UInt(STD.lineIndexWidth)
  val color = new Color
}

class Color extends Bundle {
  val r = UInt(STD.colorWidth)
  val g = UInt(STD.colorWidth)
  val b = UInt(STD.colorWidth)
}

class Point extends Bundle {
  val x = FixedPoint(STD.fixedWidth, STD.binaryPoint)
  val y = FixedPoint(STD.fixedWidth, STD.binaryPoint)
  val z = FixedPoint(STD.fixedWidth, STD.binaryPoint)
  val w = FixedPoint(STD.fixedWidth, STD.binaryPoint)
}

class Pixel extends Bundle {
  val x = UInt(STD.coordWidth)
  val y = UInt(STD.coordWidth)
}

