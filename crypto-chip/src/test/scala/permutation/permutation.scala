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

class Permutation_once extends AnyFlatSpec with ChiselScalatestTester {
  "permutation" should "work" in {
    test(new permutation_two()) { dut =>
      // create an array with 5 elements constructed with a function for each element of a BigInt
      val x = Array.tabulate(5) { x => BigInt(x) }
      for (i <- 0 until 5) {
        x(i) = BigInt(0)
      }
      dut.io.round_in.poke(1.U)
      for (i <- 0 until 5) {
        dut.io.x_in(i).poke(x(i))
      }
      dut.io.start.poke(1)
      dut.clock.step()
      dut.io.start.poke(0)
      var count = 0
      while (dut.io.done.peekBoolean() == false) {
        dut.clock.step()
        count = count + 1
        println("Result is: " + (dut.io.x_out.peek()))
      }
      println("finished processing first permutations and took " + count + " cycles")

    }
  }
  "permutation original" should "work" in {
    test(new permutation_one()) { dut =>
      // create an array with 5 elements constructed with a function for each element of a BigInt
      val x = Array.tabulate(5) { x => BigInt(x) }
      for (i <- 0 until 5) {
        x(i) = BigInt(0)
      }
      dut.io.round_in.poke(1.U)
      for (i <- 0 until 5) {
        dut.io.x_in(i).poke(x(i))
      }
      // dut.io.start.poke(1)
      // dut.clock.step()
      // dut.io.start.poke(0)
      // var count = 0
      // while (dut.io.done.peekBoolean() == false) {
      //   dut.clock.step()
      //   count = count + 1
      // }
      // println("finished processing first permutations and took " + count + " cycles")
      println("Result is: " + (dut.io.x_out.peek()))

    }
  }
}
  