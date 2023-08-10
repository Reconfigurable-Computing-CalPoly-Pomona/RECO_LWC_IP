/*
 * Dummy tester to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package permutation

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.collection.mutable.ArrayBuffer
// import permutation._

class Permutation_once extends AnyFlatSpec with ChiselScalatestTester {
  "permutation" should "work" in {
    test(new permutation_two()) { dut =>
      // val result0 = BigInt("", 16)
      // val result1 = BigInt("", 16)
      // val result2 = BigInt("", 16)
      // val result3 = BigInt("", 16)
      // val result4 = BigInt("", 16)
      // split
      // val x = Array[BigInt](5)
      // create an array with 5 elements constructed with a function for each element of a BigInt
      val x = Array.tabulate(5) { x => BigInt(x) }
      for (i <- 0 to 4) {
        x(i) = BigInt(0)
      }
      dut.io.round_in.poke(0.U)
      // dut.io.x_in.poke(x)
      for (i <- 0 to 4) {
        dut.io.x_in(i).poke(x(i))
      }
      dut.clock.step(3)
      // dut.io.x_out(0).expect()
      // dut.io.x_out(1).expect()
      // dut.io.x_out(2).expect()
      // dut.io.x_out(3).expect()
      // dut.io.x_out(4).expect()
    }
  }
}
  