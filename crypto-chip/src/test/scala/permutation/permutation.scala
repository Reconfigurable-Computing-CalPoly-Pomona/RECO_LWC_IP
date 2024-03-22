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
  "permutation reduced io" should "work" in {
    // let the ratio of main, sub, diff clock be 3,2,1 respectively
    test(new Module {
      val io = IO(new Bundle {
        val clock_sub = Input(Bool())
        val clock_diff = Input(Bool())
        val round = Input(UInt(4.W)) // total number of rounds to run
        val s_in = Input(UInt(64.W))
        val write = Input(Bool())
        val done = Output(Bool())
        val read = Input(Bool())
        val s_out = Output(UInt(64.W))
      })
      val wrapper_reduced = Module(new permutation_two_wrapper_reduced_io)
      wrapper_reduced.io.clock_sub := io.clock_sub.asClock
      wrapper_reduced.io.clock_diff := io.clock_diff.asClock
      wrapper_reduced.io.round := io.round
      wrapper_reduced.io.s_in := io.s_in
      wrapper_reduced.io.write := io.write
      io.done := wrapper_reduced.io.done
      wrapper_reduced.io.read := io.read
      io.s_out := wrapper_reduced.io.s_out
    }).withAnnotations(Seq(WriteVcdAnnotation)).withAnnotations(Seq(VerilatorBackendAnnotation)) {
      dut =>
        dut.io.write.poke(false)
        val diff_clock = 1
        val sub_clock = 2
        // dut.io.clock_diff.poke(1)
        // dut.io.clock_sub.poke(1)
        for (round <- 0 until 5) {
          // inputs are: x_in(i) = 10, round_in = 10 for the initial after reset
          for (i <- 0 until 5) {
            dut.io.s_in.poke(10)
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            dut.io.write.poke(true)
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            dut.io.write.poke(false)
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
          }
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          while (dut.io.done.peekBoolean() == false) {
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            println("Result reset is: " + (dut.io.s_out.peek()))
          }
          // start of real inputs to with correct data to test with
          dut.io.round.poke(10)
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          // inputs are now x_in(i) = i * 1234, round = 0..5 (not inclusive at end)
          // create an array with 5 elements constructed with a function for each element of a BigInt
          val x = Array.tabulate(5) { x => BigInt(x) }
          for (x_index <- 0 until 5) {
            x(x_index) = BigInt(x_index * 1234)
          }
          dut.io.round.poke(round.U)
          for (i <- 0 until 5) {
            dut.io.s_in.poke(x(i))
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            dut.io.write.poke(true)
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            dut.io.write.poke(false)
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
          }
          // Technically this expect should be after the first main clock cycle, but permutation should never be so "fast" that it completes in three cycles
          dut.io.done.expect(false)
          var count = 0
          while (dut.io.done.peekBoolean() == false) {
            dut.clock.step(3)
            for (c <- 0 until diff_clock) {
              dut.io.clock_diff.poke(1)
              dut.io.clock_diff.poke(0)
            }
            for (c <- 0 until sub_clock) {
              dut.io.clock_sub.poke(1)
              dut.io.clock_sub.poke(0)
            }
            count = count + 3
            println("Result is: " + (dut.io.s_out.peek()))
          }
          println("Result is: " + (dut.io.s_out.peek()))
          if (round == 0) {
            dut.io.s_out.expect(BigInt("34971066833044448"))
            dut.io.read.poke(true)
            dut.clock.step()
            dut.io.read.poke(false)
            dut.clock.step()
            dut.io.s_out.expect(BigInt("248504187806"))
            dut.io.read.poke(true)
            dut.clock.step()
            dut.io.read.poke(false)
            dut.clock.step()
            dut.io.s_out.expect(BigInt("14411518807585582404"))
            dut.io.read.poke(true)
            dut.clock.step()
            dut.io.read.poke(false)
            dut.clock.step()
            dut.io.s_out.expect(BigInt("2764084271298646204"))
            dut.io.read.poke(true)
            dut.clock.step()
            dut.io.read.poke(false)
            dut.clock.step()
            dut.io.s_out.expect(BigInt("6341068330467596703"))
            dut.io.read.poke(true)
            dut.clock.step()
            dut.io.read.poke(false)
            dut.clock.step()
          }
          println(
            "finished processing first permutations and took " + count + " cycles"
          )
        }
    }
    // Vivado 2022.2: 870 LUT, 879 FF, 4.090ns
  }
  "permutation" should "work" in {
    // let the ratio of main, sub, diff clock be 3,2,1 respectively
    test(new Module {
      val io = IO(new Bundle {
        val clock_sub = Input(Bool())
        val clock_diff = Input(Bool())
        val start = Input(Bool())
        val round_in = Input(UInt(8.W))
        val x_in = Input(Vec(5, UInt(64.W)))
        val x_out = Output(Vec(5, UInt(64.W)))
        val done = Output(Bool())
        // val reg_temp = Output(UInt(4.W))
      })
      val permutation = Module(new permutation_two())
      permutation.io.clock_sub := io.clock_sub.asClock
      permutation.io.clock_diff := io.clock_diff.asClock
      permutation.io.start := io.start
      permutation.io.round_in := io.round_in
      permutation.io.x_in := io.x_in
      io.x_out := permutation.io.x_out
      io.done := permutation.io.done
      // io.reg_temp := permutation.io.reg_temp
    }).withAnnotations(Seq(WriteVcdAnnotation)).withAnnotations(Seq(VerilatorBackendAnnotation)) {
      dut =>
        val diff_clock = 1
        val sub_clock = 2
        dut.io.clock_diff.poke(0)
        dut.io.clock_diff.poke(1)
        dut.io.clock_diff.poke(0)
        dut.io.clock_sub.poke(0)
        dut.io.clock_sub.poke(1)
        dut.io.clock_sub.poke(0)
        dut.clock.step()
        for (round <- 0 until 5) {
          // inputs are: x_in(i) = 10, round_in = 10 for the initial after reset
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
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          // inputs are now x_in(i) = i * 1234, round = 0..5 (not inclusive at end)
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
          for (c <- 0 until sub_clock) {
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
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
            count = count + 3
            // println("Result is: " + (dut.io.x_out.peek()))
          }
          println("Result is: " + (dut.io.x_out.peek()))
          // TODO: add expects for specific inputs and specific round amounts
          if (round == 0) {
            dut.io.x_out(0).expect(BigInt("34971066833044448"))
            dut.io.x_out(1).expect(BigInt("248504187806"))
            dut.io.x_out(2).expect(BigInt("14411518807585582404"))
            dut.io.x_out(3).expect(BigInt("2764084271298646204"))
            dut.io.x_out(4).expect(BigInt("6341068330467596703"))
          }
          else if (round == 1) {
            dut.io.x_out(0).expect(BigInt("34935951180432353"))
            dut.io.x_out(1).expect(BigInt("249074612999"))
            dut.io.x_out(2).expect(BigInt("288230376151706973"))
            dut.io.x_out(3).expect(BigInt("2455728434312122541"))
            dut.io.x_out(4).expect(BigInt("6341068330467596703"))
          }
          else if (round == 2) {
            dut.io.x_out(0).expect(BigInt("33842967902946240"))
            dut.io.x_out(1).expect(BigInt("248437078924"))
            dut.io.x_out(2).expect(BigInt("5764607523034230135"))
            dut.io.x_out(3).expect(BigInt("3372351695970373790"))
            dut.io.x_out(4).expect(BigInt("6341068330467596703"))
          }
          else if (round == 3) {
            dut.io.x_out(0).expect(BigInt("33807852250334145"))
            dut.io.x_out(1).expect(BigInt("249007504149"))
            dut.io.x_out(2).expect(BigInt("10088063165309906286"))
            dut.io.x_out(3).expect(BigInt("3063995858983850127"))
            dut.io.x_out(4).expect(BigInt("6341068330467596703"))
          }
          else if (round == 4) {
            dut.io.x_out(0).expect(BigInt("35112079199306724"))
            dut.io.x_out(1).expect(BigInt("246356703710"))
            dut.io.x_out(2).expect(BigInt("15564440312192429347"))
            dut.io.x_out(3).expect(BigInt("3998633519151583480"))
            dut.io.x_out(4).expect(BigInt("6341068330467596703"))
          }

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
          dut.clock.step(100)

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
