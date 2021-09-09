package fb

import scala.math._
import Array._

class Rotation {
  // Yaw
  val matrix_rotate_x = (theta: Double) => Array(
    Array(1.0, 0.0, 0.0),
    Array(0, cos(theta), -sin(theta)),
    Array(0.0, sin(theta), cos(theta))
  )
  // Pitch
  val matrix_rotate_y = (theta: Double) => Array(
    Array(cos(theta), 0.0, sin(theta)),
    Array(0, 1.0, 0),
    Array(-sin(theta), 0.0, cos(theta))
  )
  // Roll
  val matrix_rotate_z = (theta: Double) => Array(
    Array(cos(theta), -sin(theta), 0.0),
    Array(sin(theta), cos(theta), 0.0),
    Array(0.0, 0.0, 1.0)
  )

  def matrix_multiplication_3x3: Object = (A: Array[Array[Double]], B: Array[Array[Double]]) => {
    val C = ofDim[Double](3,3)
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
