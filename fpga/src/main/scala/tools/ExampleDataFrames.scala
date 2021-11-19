package tools
import chisel3._
import Chisel.log2Up
import chisel3.experimental.FixedPoint
import tools.helpers.{log2, fp}

object ExampleDataFrames {
  val square1 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 100.U
    bundle.points(0).y := 100.U
    bundle.points(1).x := 100.U
    bundle.points(1).y := 200.U
    bundle.points(2).x := 200.U
    bundle.points(2).y := 200.U
    bundle.points(3).x := 200.U
    bundle.points(3).y := 100.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square2 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 110.U
    bundle.points(0).y := 110.U
    bundle.points(1).x := 110.U
    bundle.points(1).y := 210.U
    bundle.points(2).x := 210.U
    bundle.points(2).y := 210.U
    bundle.points(3).x := 210.U
    bundle.points(3).y := 110.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square3 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 120.U
    bundle.points(0).y := 120.U
    bundle.points(1).x := 120.U
    bundle.points(1).y := 220.U
    bundle.points(2).x := 220.U
    bundle.points(2).y := 220.U
    bundle.points(3).x := 220.U
    bundle.points(3).y := 120.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square4 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 130.U
    bundle.points(0).y := 130.U
    bundle.points(1).x := 130.U
    bundle.points(1).y := 230.U
    bundle.points(2).x := 230.U
    bundle.points(2).y := 230.U
    bundle.points(3).x := 230.U
    bundle.points(3).y := 130.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square5 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 140.U
    bundle.points(0).y := 140.U
    bundle.points(1).x := 140.U
    bundle.points(1).y := 240.U
    bundle.points(2).x := 240.U
    bundle.points(2).y := 240.U
    bundle.points(3).x := 240.U
    bundle.points(3).y := 140.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square6 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 150.U
    bundle.points(0).y := 150.U
    bundle.points(1).x := 150.U
    bundle.points(1).y := 250.U
    bundle.points(2).x := 250.U
    bundle.points(2).y := 250.U
    bundle.points(3).x := 250.U
    bundle.points(3).y := 150.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square7 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 160.U
    bundle.points(0).y := 160.U
    bundle.points(1).x := 160.U
    bundle.points(1).y := 260.U
    bundle.points(2).x := 260.U
    bundle.points(2).y := 260.U
    bundle.points(3).x := 260.U
    bundle.points(3).y := 160.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square8 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 170.U
    bundle.points(0).y := 170.U
    bundle.points(1).x := 170.U
    bundle.points(1).y := 270.U
    bundle.points(2).x := 270.U
    bundle.points(2).y := 270.U
    bundle.points(3).x := 270.U
    bundle.points(3).y := 170.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square9 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 180.U
    bundle.points(0).y := 180.U
    bundle.points(1).x := 180.U
    bundle.points(1).y := 280.U
    bundle.points(2).x := 280.U
    bundle.points(2).y := 280.U
    bundle.points(3).x := 280.U
    bundle.points(3).y := 180.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square10 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := 190.U
    bundle.points(0).y := 190.U
    bundle.points(1).x := 190.U
    bundle.points(1).y := 290.U
    bundle.points(2).x := 290.U
    bundle.points(2).y := 290.U
    bundle.points(3).x := 290.U
    bundle.points(3).y := 190.U
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }

  val frames = VecInit(
    square1,
    square2,
    square3,
    square4,
    square5,
    square6,
    square7,
    square8,
    square9,
    square10
  )
}

object ExampleDataFramesFP {
  val square1 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := fp(-0.2)
    bundle.points(0).y := fp(-0.2)
    bundle.points(0).z := fp(0)
    bundle.points(0).w := fp(1)
    bundle.points(1).x := fp(0.2)
    bundle.points(1).y := fp(-0.2)
    bundle.points(1).z := fp(0)
    bundle.points(1).w := fp(1)
    bundle.points(2).x := fp(0.2)
    bundle.points(2).y := fp(0.2)
    bundle.points(2).z := fp(0)
    bundle.points(2).w := fp(1)
    bundle.points(3).x := fp(-0.2)
    bundle.points(3).y := fp(0.2)
    bundle.points(3).z := fp(0)
    bundle.points(3).w := fp(1)
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }
  val square2 = {
    val bundle = Wire(new DataFrame)
    bundle.points(0).x := fp(-0.5)
    bundle.points(0).y := fp(-0.5)
    bundle.points(0).z := fp(0)
    bundle.points(0).w := fp(1)
    bundle.points(1).x := fp(0.5)
    bundle.points(1).y := fp(-0.5)
    bundle.points(1).z := fp(0)
    bundle.points(1).w := fp(1)
    bundle.points(2).x := fp(0.5)
    bundle.points(2).y := fp(0.5)
    bundle.points(2).z := fp(0)
    bundle.points(2).w := fp(1)
    bundle.points(3).x := fp(-0.5)
    bundle.points(3).y := fp(0.5)
    bundle.points(3).z := fp(0)
    bundle.points(3).w := fp(1)
    bundle.lines(0).index1 := 0.U
    bundle.lines(0).index2 := 1.U
    bundle.lines(1).index1 := 1.U
    bundle.lines(1).index2 := 2.U
    bundle.lines(2).index1 := 2.U
    bundle.lines(2).index2 := 3.U
    bundle.lines(3).index1 := 3.U
    bundle.lines(3).index2 := 0.U
    bundle
  }

  val frames = VecInit(
    square1,
    square2
  )
}
