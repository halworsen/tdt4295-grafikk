package tools

import scala.math._
import Array._
import chisel3._

// TODO: Find out how much to scale with
var SCALE_VALUE = 1000

// Theta is in radians
class Matrix {

  val rotateX = (theta: SInt) => {
    var mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(1) = 1.S;
    mat(1)(1) = cos(theta);
    mat(1)(2) = -sin(theta);
    mat(2)(1) = sin(theta);
    mat(2)(2) = cos(theta);

    return mat
   }

  val rotateY = (theta: SInt) => {
    var mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(1)(1) = 1.S;
    mat(0)(0) = cos(theta);
    mat(0)(2) = -sin(theta);
    mat(2)(0) = sin(theta);
    mat(2)(2) = cos(theta);

    return mat
  }

  val rotateZ = (theta: SInt) => {
    var mat = RegInit(VecInit(Seq.fill(4)(VecInit(Seq.fill(3)(0.S)))))
    mat(2)(2) = 1.S;
    mat(0)(0) = cos(theta);
    mat(0)(1) = -sin(theta);
    mat(1)(0) = sin(theta);
    mat(1)(1) = cos(theta);

    return mat
  }

  val scale = (vertex: Vec(4, SInt(32.W)), scaleX: SInt = 1.S, scaleY: SInt = 1.S, scaleZ: SInt = 1.S) => {
    var newVertex = RegInit(VecInit(Seq.fill(4)(1.S));
    newVertex(0) = vertex(0) * scaleX;
    newVertex(1) = vertex(0) * scaleY;
    newVertex(2) = vertex(0) * scaleZ;

    return newVertex
  }

  val translate = (vertex: Vec(4, SInt(32.W)), tx: SInt, ty: SInt, tz: SInt) => {
    var newVertex = RegInit(VecInit(Seq.fill(4)(1.S));
    newVertex(0) = vertex(0) + tx;
    newVertex(1) = vertex(1) + tx;
    newVertex(2) = vertex(2) + tx;

    return newVertex
  }

  val identity3 = () => {
    var mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(0) = 1.S;
    mat(1)(1) = 1.S;
    mat(2)(2) = 1.S;

    return mat
  }

  val identity4 = () => {
    var mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
    mat(0)(0) = 1.S;
    mat(1)(1) = 1.S;
    mat(2)(2) = 1.S;
    mat(3)(3) = 1.S;

    return mat
  }

  val mvpMultiply: Vec[SInt] =
    // 4x1 * 4x4
    (U: Vec[SInt], MVP: Vec[Vec[SInt]]) => {
      var V = RegInit(VecInit(Seq.fill(4)(0.S)))
      for (r <- 0 to 3) {
        for (c <- 0 to 3) {
          V(r) := V(r) + (MVP(r)(c) * U(c))
        }
      }
      return V
    }

    val matrixMultiply: Vec[SInt] =
    // 4x4 * 4x4
    (A: Vec[Vec[SInt]], B: Vec[Vec[SInt]]) => {
      var M = RegInit(VecInit(Seq.fill(4)(0.S)))
      for (r <- 0 to 3) {
        for (c <- 0 to 3) {
            M(r)(c) := 0
            for (k <- 0 to 3) {
                M(r)(c) := M(r)(c) + A(r)(k) * B(k)(c)
            }
        }
      }
      return M
    }

}