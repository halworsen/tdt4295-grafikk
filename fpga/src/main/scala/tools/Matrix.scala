// package tools

// import scala.math._
// import Array._
// import chisel3._

// // TODO: Find out how much to scale with

// // Theta is in radians
// // TODO: Should probably use 4d vectors, but it's late and Im too tired to change: https://tenor.com/view/pooh-dancing-excited-winnie-the-pooh-gangnam-style-gif-7703016
// class Matrix {

//   val rotateX = (theta: SInt) => {
//     val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
//     mat(0)(1) = 1.S;
//     mat(1)(1) = cos(theta);
//     mat(1)(2) = -sin(theta);
//     mat(2)(1) = sin(theta);
//     mat(2)(2) = cos(theta);

//     return mat
//    }

//   val rotateY = (theta: SInt) => {
//     val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
//     mat(1)(1) = 1.S;
//     mat(0)(0) = cos(theta);
//     mat(0)(2) = -sin(theta);
//     mat(2)(0) = sin(theta);
//     mat(2)(2) = cos(theta);

//     return mat
//   }

//   val rotateZ = (theta: SInt) => {
//     val mat = RegInit(VecInit(Seq.fill(4)(VecInit(Seq.fill(3)(0.S)))))
//     mat(2)(2) = 1.S;
//     mat(0)(0) = cos(theta);
//     mat(0)(1) = -sin(theta);
//     mat(1)(0) = sin(theta);
//     mat(1)(1) = cos(theta);

//     return mat
//   }

//   val scale = (vertex: Vec(4, SInt(32.W)), scaleX: SInt = 1.S, scaleY: SInt = 1.S, scaleZ: SInt = 1.S) => {
//     val newVertex = RegInit(VecInit(Seq.fill(4)(1.S));
//     newVertex(0) = vertex(0) * scaleX;
//     newVertex(1) = vertex(0) * scaleY;
//     newVertex(2) = vertex(0) * scaleZ;

//     return newVertex
//   }

//   val translate = (vertex: Vec(4, SInt(32.W)), tx: SInt, ty: SInt, tz: SInt) => {
//     val newVertex = RegInit(VecInit(Seq.fill(4)(1.S));
//     newVertex(0) = vertex(0) + tx;
//     newVertex(1) = vertex(1) + tx;
//     newVertex(2) = vertex(2) + tx;

//     return newVertex
//   }

//   val identity3 = () => {
//     val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
//     mat(0)(0) = 1.S;
//     mat(1)(1) = 1.S;
//     mat(2)(2) = 1.S;

//     return mat
//   }

//   val identity4 = () => {
//     val mat = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))))
//     mat(0)(0) = 1.S;
//     mat(1)(1) = 1.S;
//     mat(2)(2) = 1.S;
//     mat(3)(3) = 1.S;

//     return mat
//   }

//   val ladermanMultiply: Vec[Vec[SInt]] =
//     (a: Vec[SInt], b: Vec[Vec[SInt]]) => {
//       var m = RegInit(VecInit(Seq.fill(23)(0.S)));
//       var c = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(3)(0.S)))));

//       m(0) := (a(0)(0) + a(0)(1) + a(0)(2) - a(1)(0) - a(1)(1) - a(2)(1) - a(2)(
//         2
//       )) * b(1)(1);
//       m(1) := (a(0)(0) - a(1)(0)) * (-b(0)(1) + b(1)(1));
//       m(2) := a(1)(1) * (-b(0)(0) + b(0)(1) + b(1)(0) - b(1)(1) - b(1)(2) - b(
//         2
//       )(0) + b(2)(2));
//       m(3) := (-a(0)(0) + a(1)(0) + a(1)(1)) * (b(0)(0) - b(0)(1) + b(1)(1));
//       m(4) := (a(1)(0) + a(1)(1)) * (-b(0)(0) + b(0)(1));
//       m(5) := a(0)(0) * b(0)(0);
//       m(6) := (-a(0)(0) + a(2)(0) + a(2)(1)) * (b(0)(0) - b(0)(2) + b(1)(2));
//       m(7) := (-a(0)(0) + a(2)(0)) * (b(0)(2) - b(1)(2));
//       m(8) := (a(2)(0) + a(2)(1)) * (-b(0)(0) + b(0)(2));
//       m(9) := (a(0)(0) + a(0)(1) + a(0)(2) - a(1)(1) - a(1)(2) - a(2)(0) - a(2)(
//         1
//       )) * b(1)(2);
//       m(10) := a(2)(1) * (-b(0)(0) + b(0)(2) + b(1)(0) - b(1)(1) - b(1)(2) - b(
//         2
//       )(0) + b(2)(1));
//       m(11) := (-a(0)(2) + a(2)(1) + a(2)(2)) * (b(1)(1) + b(2)(0) - b(2)(1));
//       m(12) := (a(0)(2) - a(2)(2)) * (b(1)(1) - b(2)(1));
//       m(13) := a(0)(2) * b(2)(0);
//       m(14) := (a(2)(1) + a(2)(2)) * (-b(2)(0) + b(2)(1));
//       m(15) := (-a(0)(2) + a(1)(1) + a(1)(2)) * (b(1)(2) + b(2)(0) - b(2)(2));
//       m(16) := (a(0)(2) - a(1)(2)) * (b(1)(2) - b(2)(2));
//       m(17) := (a(1)(1) + a(1)(2)) * (-b(2)(0) + b(2)(2));
//       m(18) := a(0)(1) * b(1)(0);
//       m(19) := a(1)(2) * b(2)(1);
//       m(20) := a(1)(0) * b(0)(2);
//       m(21) := a(2)(0) * b(0)(1);
//       m(22) := a(2)(2) * b(2)(2);

//       c(0)(0) := m(5) + m(13) + m(18);
//       c(0)(1) := m(0) + m(3) + m(4) + m(6) + m(11) + m(13) + m(15);
//       c(0)(2) := m(5) + m(6) + m(8) + m(10) + m(13) + m(15) + m(18);
//       c(1)(0) := m(1) + m(2) + m(3) + m(6) + m(13) + m(15) + m(17);
//       c(1)(1) := m(1) + m(3) + m(4) + m(6) + m(18);
//       c(1)(2) := m(13) + m(15) + m(16) + m(17) + m(20);
//       c(2)(0) := m(5) + m(6) + m(7) + m(11) + m(10) + m(12) + m(13);
//       c(2)(1) := m(11) + m(12) + m(13) + m(14) + m(21);
//       c(2)(2) := m(5) + m(6) + m(7) + m(8) + m(22);

//       return c
//     }

//   def mvpMultiply: Vec[SInt] =
//     // 4x1 * 4x4
//     (U: Vec[SInt], MVP: Vec[Vec[SInt]]) => {
//       val V = RegInit(VecInit(Seq.fill(4)(0.S)))
//       for (r <- 0 to 3) {
//         for (c <- 0 to 3) {
//           V(r) := V(r) + (MVP(r)(c) * U(c))
//         }
//       }
//       return V
//     }

// }
