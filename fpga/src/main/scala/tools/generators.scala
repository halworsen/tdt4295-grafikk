package tools

import chisel3._

object generators {

  /** Generate a chisel Vec[Vec[SInt]] of dimension nxm
    *
    * @returns
    *   The matrix
    */
  def genMat(n: Int, m: Int) = {
    VecInit(
      Array
        .fill(n) { VecInit(Array.range(1, m + 1).map(_.S(32.W))) }
    )
  }

  /** Generate a chisel Vec[SInt] of dimension n
    *
    * @returns
    *   The vector
    */
  def genVec(n: Int, values: Array[Int]) = {
    VecInit(values.map(_.S(32.W)))
  }

}
