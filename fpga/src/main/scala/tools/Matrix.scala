package tools

import scala.math._
import Array._
import chisel3._

TODO: Find out how much to scale with
var SCALE_VALUE = 1000

// Theta is in radians
// TODO: Should probably use 4d vectors, but it's late and Im too tired to change: https://tenor.com/view/pooh-dancing-excited-winnie-the-pooh-gangnam-style-gif-7703016
class Matrix {
  
  val matrix_rotate_x = (theta: SInt) => {
    val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(1) = 1.S;
    mat(1)(1) = cos(theta);
    mat(1)(2) = -sin(theta);
    mat(2)(1) = sin(theta);
    mat(2)(2) = cos(theta);

    return mat
   }

  val matrix_rotate_y = (theta: SInt) => {
    val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(1)(1) = 1.S;
    mat(0)(0) = cos(theta);
    mat(0)(2) = -sin(theta);
    mat(2)(0) = sin(theta);
    mat(2)(2) = cos(theta);

    return mat
  }
  
  val matrix_rotate_z = (theta: SInt) => {
    val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(2)(2) = 1.S;
    mat(0)(0) = cos(theta);
    mat(0)(1) = -sin(theta);
    mat(1)(0) = sin(theta);
    mat(1)(1) = cos(theta);

    return mat
  }

  val scale = (vertex: Vec(3, SInt(32.W)), scaleX: SInt = 1.S, scaleY: SInt = 1.S, scaleZ: SInt = 1.S) => {
    val newVertex = RegInit(VecInit(Seq.fill(3)));
    newVertex(0) = vertex(0) * scaleX;
    newVertex(1) = vertex(0) * scaleY;
    newVertex(2) = vertex(0) * scaleZ;

    return newVertex
  }

  val translate = (vertex: Vec(3, SInt(32.W)), tx: SInt, ty: SInt, tz: SInt) => {
    val newVertex = RegInit(VecInit(Seq.fill(3)));
    newVertex(0) = vertex(0) + tx;
    newVertex(1) = vertex(1) + tx;
    newVertex(2) = vertex(2) + tx;

    return newVertex
  }

  val identity3 = () => {
    val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(0) = 1.S;
    mat(1)(1) = 1.S;
    mat(2)(2) = 1.S;

    return mat
  }

  val identity4 = () => {
    val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(0) = 1.S;
    mat(1)(1) = 1.S;
    mat(2)(2) = 1.S;
    mat(3)(3) = 1.S;
    
    return mat
  }

  def matrix_multiplication_3x3: Object =
    (A: Vec[Vec[SInt]], B: Vec[Vec[SInt]]) => {
      val C = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
      for (i <- 0 to 2) {
        for (j <- 0 to 2) {
          for (k <- 0 to 2) {
            C(i)(j) += A(i)(k) * B(k)(j)
          }
        }
      }
      return C
    }

}
