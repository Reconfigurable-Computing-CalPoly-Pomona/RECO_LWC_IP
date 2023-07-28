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

class Permutation_once extends AnyFlatSpec with ChiselScalatestTester {
  test(new permutation_two()) { dut =>
    val x = Vec(5, UInt(64.W))
    for (i <- 0 to 4) {
      x(i) = 0
    }
    dut.io.round_in.poke(0.U)
    dut.io.x_in.poke(x.U)
    dut.clock.step(3)
    // dut.io.x_out.expect()
  }
}
