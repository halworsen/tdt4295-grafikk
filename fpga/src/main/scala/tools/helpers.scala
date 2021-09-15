package tools

import scala._
import chisel3._
class helpers {

}

object warnAssert {
  def apply(condition: Bool, message: String = "", isFatal: Boolean = false) {
    (isFatal, message.isEmpty) {
      case (true, true)   => assert(condition)
      case (true, false)  => assert(condition, message)
      case (false, _) => when(condition) { printf("Warning: %s\n", message) } // line number should get included here
      }
    }
  }
