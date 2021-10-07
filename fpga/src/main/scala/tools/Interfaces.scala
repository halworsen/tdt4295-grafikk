package tools
import chisel3._

import tools.helpers.log2
import Chisel.log2Up
import chisel3.experimental.FixedPoint


class DataFrame(objectsNum: Int = 1, lineNum: Int, pointNum: Int) extends Bundle{
    val VPMatrix = Vec(4, Vec(4, FixedPoint(12.W, 10.BP)))
    val Objects = Vec(objectsNum, new RenderObject(lineNum, pointNum))
}

class RenderObject(lineNum: Int, pointNum: Int) extends Bundle{
    val Lines = Vec(lineNum, new Line(log2Up(pointNum)))
    val Points = Vec(pointNum, new Point)
    val MMatrix = Vec(4, Vec(4, FixedPoint(12.W, 10.BP)))
}

class Line(width: Int) extends Bundle{
    val p1 = UInt(width.W)
    val p2 = UInt(width.W)
    val color = new Pixel
}

class Pixel extends Bundle{
    val r = UInt(3.W)
    val g = UInt(3.W)
    val b = UInt(3.W)
}

class Point extends Bundle{
    val x = FixedPoint(12.W, 10.BP)
    val y = FixedPoint(12.W, 10.BP)
    val z = FixedPoint(12.W, 10.BP)
    val w = FixedPoint(12.W, 10.BP)
}