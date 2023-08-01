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
import permutation._

class Permutation_once extends AnyFlatSpec with ChiselScalatestTester {
  test(new permutation_two()) { dut =>
    val result0 = BigInt("", 16)
    val result1 = BigInt("", 16)
    val result2 = BigInt("", 16)
    val result3 = BigInt("", 16)
    val result4 = BigInt("", 16)
    // split
    val x = VecInit(Seq.fill(5)(UInt(64.W)))
    for (i <- 0 to 4) {
      x(i) := 0.U
    }
    dut.io.round_in.poke(0.U)
    dut.io.x_in.poke(x)
    dut.clock.step(3)
    // dut.io.x_out(0).expect()
    // dut.io.x_out(1).expect()
    // dut.io.x_out(2).expect()
    // dut.io.x_out(3).expect()
    // dut.io.x_out(4).expect()
  }
}
