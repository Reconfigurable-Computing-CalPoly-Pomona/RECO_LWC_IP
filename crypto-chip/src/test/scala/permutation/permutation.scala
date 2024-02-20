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

// TODO: add multiple clocks test for permutation

class Permutation_once extends AnyFlatSpec with ChiselScalatestTester {
  "permutation" should "work" in {
    // let the ratio of main, sub, diff clock be 3,2,1 respectively
    test(new permutation_two()).withAnnotations(Seq(WriteVcdAnnotation)) {
      dut =>
        val diff_clock = 1
        val sub_clock = 2
        dut.io.reset_diff.poke(1)
        dut.io.clock_diff.poke(1)
        dut.io.reset_diff.poke(0)
        dut.io.reset_sub.poke(1)
        dut.io.clock_sub.poke(1)
        dut.io.reset_sub.poke(0)
        for (round <- 0 until 5) {
          // start with state of all 10, round with 10; CONFIRMED: this causes problems only with the first round of output
          for (i <- 0 until 5) {
            dut.io.x_in(i).poke(10)
          }
          dut.io.round_in.poke(10)
          dut.io.start.poke(0)
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until diff_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          // create an array with 5 elements constructed with a function for each element of a BigInt
          val x = Array.tabulate(5) { x => BigInt(x) }
          for (x_index <- 0 until 5) {
            x(x_index) = BigInt(x_index * 1234)
          }
          dut.io.round_in.poke(round.U)
          for (i <- 0 until 5) {
            dut.io.x_in(i).poke(x(i))
          }
          dut.io.start.poke(1)
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until diff_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          dut.io.start.poke(0)
          dut.io.done.expect(false)
          var count = 0
          while (dut.io.done.peekBoolean() == false) {
            dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until diff_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
            count = count + 1
            // println("Result is: " + (dut.io.x_out.peek()))
          }
          println("Result is: " + (dut.io.x_out.peek()))
          println(
            "finished processing first permutations and took " + count + " cycles"
          )
        }
    }
    // Vivado 2022.2: 870 LUT, 879 FF, 4.090ns
  }
  "permutation original" should "work" in {
    test(new permutation_one()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      for (round <- 0 until 5) {
          // start with state of all 10, round with 10; CONFIRMED: this does not cause problems, as it shouldn't
          for (i <- 0 until 5) {
            dut.io.x_in(i).poke(10)
          }
          dut.io.round_in.poke(10)
          dut.clock.step()

        // create an array with 5 elements constructed with a function for each element of a BigInt
        val x = Array.tabulate(5) { x => BigInt(x) }
        for (x_index <- 0 until 5) {
          x(x_index) = BigInt(x_index * 1234)
        }
        dut.io.round_in.poke(round.U)
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
}
