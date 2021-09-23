package fb

import chisel3._
import scala.math._
import Array._

object Matrix {
  // Yaw
  val rotateX = (theta: Double) =>
    Array(
      Array(1.0, 0.0, 0.0),
      Array(0, cos(theta), -sin(theta)),
      Array(0.0, sin(theta), cos(theta))
    )
  // Pitch
  val rotateY = (theta: Double) =>
    Array(
      Array(cos(theta), 0.0, sin(theta)),
      Array(0, 1.0, 0),
      Array(-sin(theta), 0.0, cos(theta))
    )
  // Roll
  val rotateZ = (theta: Double) =>
    Array(
      Array(cos(theta), -sin(theta), 0.0),
      Array(sin(theta), cos(theta), 0.0),
      Array(0.0, 0.0, 1.0)
    )
  
  def mvpMultiply: Vec[SInt] =
    // 4x1 * 4x4
    (U: Vec[SInt], MVP: Vec[Vec[SInt]]) => {
      val V = RegInit(VecInit(Seq.fill(4)(0.S)))
      for (r <- 0 to 3) {
        for (c <- 0 to 3) {
          V(r) := V(r) + (MVP(r)(c) * U(c))
        }
      }
      return V
    }


  val ladermanMultiply: Vec[Vec[SInt]] =
    (a: Vec[SInt], b: Vec[Vec[SInt]]) => {
      var m = RegInit(VecInit(Seq.fill(23)(0.S)))
      var c = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
      
      m(0) := (a(0)(0)+a(0)(1)+a(0)(2)-a(1)(0)-a(1)(1)-a(2)(1)-a(2)(2))*b(1)(1);
      m(1) := (a(0)(0)-a(1)(0))*(-b(0)(1)+b(1)(1));
      m(2) := a(1)(1)*(-b(0)(0)+b(0)(1)+b(1)(0)-b(1)(1)-b(1)(2)-b(2)(0)+b(2)(2));
      m(3) := (-a(0)(0)+a(1)(0)+a(1)(1))*(b(0)(0)-b(0)(1)+b(1)(1));
      m(4) := (a(1)(0)+a(1)(1))*(-b(0)(0)+b(0)(1));
      m(5) := a(0)(0)*b(0)(0);
      m(6) := (-a(0)(0)+a(2)(0)+a(2)(1))*(b(0)(0)-b(0)(2)+b(1)(2));
      m(7) := (-a(0)(0)+a(2)(0))*(b(0)(2)-b(1)(2));
      m(8) := (a(2)(0)+a(2)(1))*(-b(0)(0)+b(0)(2));
      m(9) := (a(0)(0)+a(0)(1)+a(0)(2)-a(1)(1)-a(1)(2)-a(2)(0)-a(2)(1))*b(1)(2);
      m(10) := a(2)(1)*(-b(0)(0)+b(0)(2)+b(1)(0)-b(1)(1)-b(1)(2)-b(2)(0)+b(2)(1));
      m(11) := (-a(0)(2)+a(2)(1)+a(2)(2))*(b(1)(1)+b(2)(0)-b(2)(1));
      m(12) := (a(0)(2)-a(2)(2))*(b(1)(1)-b(2)(1));
      m(13) := a(0)(2)*b(2)(0);
      m(14) := (a(2)(1)+a(2)(2))*(-b(2)(0)+b(2)(1));
      m(15) := (-a(0)(2)+a(1)(1)+a(1)(2))*(b(1)(2)+b(2)(0)-b(2)(2));
      m(16) := (a(0)(2)-a(1)(2))*(b(1)(2)-b(2)(2));
      m(17) := (a(1)(1)+a(1)(2))*(-b(2)(0)+b(2)(2));
      m(18) := a(0)(1)*b(1)(0);
      m(19) := a(1)(2)*b(2)(1);
      m(20) := a(1)(0)*b(0)(2);
      m(21) := a(2)(0)*b(0)(1);
      m(22) := a(2)(2)*b(2)(2);

      c(0)(0) := m(5)+m(13)+m(18);
      c(0)(1) := m(0)+m(3)+m(4)+m(6)+m(11)+m(13)+m(15);
      c(0)(2) := m(5)+m(6)+m(8)+m(10)+m(13)+m(15)+m(18);
      c(1)(0) := m(1)+m(2)+m(3)+m(6)+m(13)+m(15)+m(17);
      c(1)(1) := m(1)+m(3)+m(4)+m(6)+m(18);
      c(1)(2) := m(13)+m(15)+m(16)+m(17)+m(20);
      c(2)(0) := m(5)+m(6)+m(7)+m(11)+m(10)+m(12)+m(13);
      c(2)(1) := m(11)+m(12)+m(13)+m(14)+m(21);
      c(2)(2) := m(5)+m(6)+m(7)+m(8)+m(22);

      return c
    }
}