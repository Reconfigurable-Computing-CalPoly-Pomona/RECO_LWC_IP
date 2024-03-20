package ascon

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import ascon._
import permutation._
import layers._

// class encryptBehavior(dut:ascon, pcycle:Int) extends AnyFlatSpec with ChiselScalatestTester {
//   // "encryption" should "work" in {
//   //   test(new ascon()) { dut =>
//       dut.io.key.poke(BigInt("000102030405060708090A0B0C0D0E0F", 16))
//       // poke(dut.io.key, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.nounce, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.tagin, "h00000000000000000000000000000000".U)

//       poke(dut.io.start, true.B)
//       poke(dut.io.empty, false.B)
//       poke(dut.io.full,false.B)
//       poke(dut.io.mode, 1.U)
//       step(1)
//       poke(dut.io.start, false.B)
//       for (j <- 0 until pcycle*20) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))
//         //println("State: " + peek(dut.io.state).toString(16) + " Warning: " + peek(dut.io.warning).toString(16))
//       }
//       step(1)
//       poke(dut.io.empty, true.B)
//       poke(dut.io.message, "h80000000000000000000000000000000".U)
//       println("Push: " + peek(dut.io.push).toString
//       (16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))

//       for (j <- 0 until pcycle*8) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))
//       }
//       step(1)
//       poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//       println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))

//       for (j <- 0 until pcycle*8) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))
//       }
//       step(1)
//       poke(dut.io.full, true.B)
//       poke(dut.io.message, "h80000000000000000000000000000000".U)
//       println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))

//       for (j <- 0 until 80) {
//         step(1)
//         poke(dut.io.message, "h00000000000000000000000000000000".U)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))
//       }
//     // }
//   // }

// }

// class decryptBehavior(dut:ascon, pcycle:Int) extends PeekPokeTester(dut) {
//   poke(dut.io.key, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.nounce, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.tagin, "h316d7ab17724ba67a85ecd3c0457c459".U)
//   //poke(dut.io.data, "h8000000000000000".U)
//   poke(dut.io.start, true.B)
//   poke(dut.io.empty, false.B)
//   poke(dut.io.full, false.B)
//   poke(dut.io.mode, 3.U)
//   step(1)
//   poke(dut.io.start, false.B)
//   for (j <- 0 until pcycle*20) {
//     step(1)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))
//     //println("State: " + peek(dut.io.state).toString(16) + " Warning: " + peek(dut.io.warning).toString(16))
//   }
//   step(1)
//   poke(dut.io.empty, true.B)
//   poke(dut.io.message, "h80000000000000000000000000000000".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))

//   for (j <- 0 until pcycle*8) {
//     step(1)
//     poke(dut.io.message, "h00000000000000000000000000000000".U)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))
//   }
//   step(1)
//   poke(dut.io.message, "h52499ac9c84323a4ae24eaeccf45c137".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))

//   for (j <- 0 until pcycle*8) {
//     step(1)
//     poke(dut.io.message, "h00000000000000000000000000000000".U)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))
//   }
//   step(1)
//   poke(dut.io.full, true.B)
//   poke(dut.io.message, "h0000000000000000000000000000000".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))

//   for (j <- 0 until 80) {
//     step(1)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))
//   }
// }

class hashBehavior extends AnyFlatSpec with ChiselScalatestTester {
  // let the ratio of main, sub, diff clock be 3,2,1 respectively
  "hash" should "work" in {
    test(new Module {
      val io = IO(new Bundle {
        val clock_sub = Input(Bool())
        val clock_diff = Input(Bool())
        val key = Input(UInt(128.W))
        val nounce = Input(UInt(128.W))
        val tagin = Input(UInt(128.W))

        val message = Input(UInt(128.W))
        val start = Input(Bool())
        // is there a message
        val empty = Input(Bool())
        // is the fifo full, then pause?
        val full = Input(Bool())
        val mode = Input(
          UInt(3.W)
        ) // 0 encryption ascon, 1 encryption ascona, 2 decryption ascon, 3 decryption ascona, 4 hash, 5 hasha,

        val push = Output(Bool())

        val pull = Output(Bool())
        val cipher = Output(UInt(128.W))
        val tagout = Output(UInt(128.W))
        val done = Output(Bool())
        val warning = Output(Bool())
        val valid = Output(Bool())
        // val state  = Output(UInt(320.W))
      })
      val ascon = Module(new ascon())
      ascon.io.clock_sub := io.clock_sub.asClock
      ascon.io.clock_diff := io.clock_diff.asClock
      ascon.io.key := io.key
      ascon.io.nounce := io.nounce
      ascon.io.tagin := io.tagin
      ascon.io.message := io.message
      ascon.io.start := io.start
      ascon.io.empty := io.empty
      ascon.io.full := io.full
      ascon.io.mode := io.mode
      io.push := ascon.io.push
      io.pull := ascon.io.pull
      io.cipher := ascon.io.cipher
      io.tagout := ascon.io.tagout
      io.done := ascon.io.done
      io.warning := ascon.io.warning
      io.valid := ascon.io.valid
    }).withAnnotations(Seq(WriteVcdAnnotation))
      .withAnnotations(Seq(VerilatorBackendAnnotation)) { dut =>
        val diff_clock = 1
        val sub_clock = 2
        dut.io.clock_diff.poke(1)
        dut.io.clock_diff.poke(0)
        dut.io.clock_sub.poke(1)
        dut.io.clock_sub.poke(0)
        val pcycle = 2
        dut.io.key.poke("h00000000000000000000000000000000".U)
        dut.io.nounce.poke("h00000000000000000000000000000000".U)
        dut.io.tagin.poke("h00000000000000000000000000000000".U)
        dut.io.message.poke("h00010203040506070000000000000000".U)
        // poke(dut.io.key, "h00000000000000000000000000000000".U)
        // poke(dut.io.nounce, "h00000000000000000000000000000000".U)
        // poke(dut.io.tagin, "h00000000000000000000000000000000".U)
        // poke(dut.io.message, "h00010203040506070000000000000000".U)
        // poke(dut.io.message, "h8000000000000000".U)
        dut.io.start.poke(true.B)
        dut.io.empty.poke(false.B)
        dut.io.full.poke(false.B)
        dut.io.mode.poke(5.U)
        // poke(dut.io.start, true.B)
        // poke(dut.io.empty, false.B)
        // poke(dut.io.full, false.B)
        // poke(dut.io.mode, 5.U)
        dut.clock.step(1)
        for (c <- 0 until diff_clock) {
          dut.io.clock_diff.poke(1)
          dut.io.clock_diff.poke(0)
        }
        for (c <- 0 until sub_clock) {
          dut.io.clock_sub.poke(1)
          dut.io.clock_sub.poke(0)
        }

        dut.io.start.poke(false.B)
        // step(1)
        // poke(dut.io.start, false.B)
        for (j <- 0 until pcycle * 2000) {
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }

          // step(1)
          println(
            j + "Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull
              .peek() + " Done: " + dut.io.done
              .peek() + " Result: " + dut.io.cipher.peek()
          )
        }
        dut.clock.step(1)
        for (c <- 0 until diff_clock) {
          dut.io.clock_diff.poke(1)
          dut.io.clock_diff.poke(0)
        }
        for (c <- 0 until sub_clock) {
          dut.io.clock_sub.poke(1)
          dut.io.clock_sub.poke(0)
        }

        // step(1)
        dut.io.message.poke("h08800000000000000000000000000000".U)
        // poke(dut.io.message, "h08800000000000000000000000000000".U)
        // poke(dut.io.message, "h0000000000000000".U)
        // poke(dut.io.empty, true.B)
        dut.io.empty.poke(true.B)
        println(
          "*Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull
            .peek() + " Done: " + dut.io.done
            .peek() + " Result: " + dut.io.cipher.peek()
        )

        for (j <- 0 until 8000) {
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }

          // step(1)
          dut.io.message.poke("h00000000000000000000000000000000".U)
          // poke(dut.io.message, "h00000000000000000000000000000000".U)
          println(
            "Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull
              .peek() + " Done: " + dut.io.done
              .peek() + " Result: " + dut.io.cipher.peek()
          )
        }
      }
  }
}

class wrappertest extends AnyFlatSpec with ChiselScalatestTester {
  "reduced wrapper" should "work" in {
    // let the ratio of main, sub, diff clock be 3,2,1 respectively
    test(new Module {
      val io = IO(new Bundle {
        val clock_sub = Input(Bool())
        val reset_sub = Input(Bool())
        val clock_diff = Input(Bool())
        val reset_diff = Input(Bool())
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
    }).withAnnotations(Seq(VerilatorBackendAnnotation))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        // val dut1 = Module(new permutation_one_wrapper)
        // test(new permutation_one_wrapper) { dut1 =>
        // var pcycle = 13
        // poke(dut.io.s_in, "hfe9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140".U)
        dut.io.reset_diff.poke(1)
        dut.io.clock_diff.poke(1)
        dut.io.reset_diff.poke(0)
        dut.io.reset_sub.poke(1)
        dut.io.clock_sub.poke(1)
        dut.io.reset_sub.poke(0)
        val diff_clock = 1
        val sub_clock = 2
        dut.clock.setTimeout(2000)
        // dut.io.s_in.poke("h00400c0000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000".U)
        val x = Array.tabulate(5) { x => BigInt(x) }
        x(0) = BigInt("00400c0000000000", 16)
        x(1) = BigInt("0000000000000000", 16)
        x(2) = BigInt("0000000000000000", 16)
        x(3) = BigInt("0000000000000000", 16)
        x(4) = BigInt("0000000000000000", 16)
        dut.io.round.poke(12)
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
        dut.clock.step(3)
        for (c <- 0 until diff_clock) {
          dut.io.clock_diff.poke(1)
          dut.io.clock_diff.poke(0)
        }
        for (c <- 0 until sub_clock) {
          dut.io.clock_sub.poke(1)
          dut.io.clock_sub.poke(0)
        }
        val correct_result = BigInt(
          "1514321243387696847890303753730219876781446195237874551750669573144945654557269770228830393635766"
        )
        var count = 0
        while (dut.io.done.peekBoolean() == false) {
          println("Result is: " + (dut.io.s_out.peek()))
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          count = count + 1
        }
        // println("Final result is: " + (dut.io.s_out.peek()))
        var tempResult = BigInt(2 ^ 320 - 1)
        tempResult = dut.io.s_out.peekInt() << (320) - (1 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("34971066833044448"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (2 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("248504187806"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (3 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("14411518807585582404"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (4 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("2764084271298646204"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (5 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("6341068330467596703"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        println("Full result is: " + (tempResult))
        assert(tempResult === correct_result)

        println(
          "finished processing first permutations and took " + count + " cycles"
        )
        // second run; TODO: change to for loop
        dut.io.round.poke(12)
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
        dut.clock.step(3)
        for (c <- 0 until diff_clock) {
          dut.io.clock_diff.poke(1)
          dut.io.clock_diff.poke(0)
        }
        for (c <- 0 until sub_clock) {
          dut.io.clock_sub.poke(1)
          dut.io.clock_sub.poke(0)
        }
        count = 0
        while (dut.io.done.peekBoolean() == false) {
          println("Result is: " + (dut.io.s_out.peek()))
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          count = count + 1
        }
        // println("Final result is: " + (dut.io.s_out.peek()))
        tempResult = BigInt(2 ^ 320 - 1)
        tempResult = dut.io.s_out.peekInt() << (320) - (1 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("34971066833044448"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (2 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("248504187806"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (3 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("14411518807585582404"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (4 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("2764084271298646204"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        tempResult = (tempResult) | dut.io.s_out.peekInt() << (320) - (5 * 64)
        println("Partial result is: " + (dut.io.s_out.peek()))
        // dut.io.s_out.expect(BigInt("6341068330467596703"))
        dut.io.read.poke(true)
        dut.clock.step()
        dut.io.read.poke(false)
        dut.clock.step()
        println("Full result is: " + (tempResult))
        assert(tempResult === correct_result)

        println(
          "finished processing second permutations and took " + count + " cycles"
        )
      }
    // let the ratio of main, sub, diff clock be 3,2,1 respectively
    test(new Module {
      val io = IO(new Bundle {
        val clock_sub = Input(Bool())
        val clock_diff = Input(Bool())
        val s_in = Input(UInt(320.W))
        val start = Input(Bool())
        val round = Input(UInt(4.W)) // total number of rounds to run
        val done = Output(Bool())
        val s_out = Output(UInt(320.W))
      })
      val wrapper = Module(new permutation_two_wrapper)
      wrapper.io.clock_sub := io.clock_sub.asClock
      wrapper.io.clock_diff := io.clock_diff.asClock
      wrapper.io.s_in := io.s_in
      wrapper.io.start := io.start
      wrapper.io.round := io.round
      io.done := wrapper.io.done
      io.s_out := wrapper.io.s_out
    }).withAnnotations(Seq(VerilatorBackendAnnotation))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        // val dut1 = Module(new permutation_one_wrapper)
        // test(new permutation_one_wrapper) { dut1 =>
        // var pcycle = 13
        // poke(dut.io.s_in, "hfe9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140".U)
        dut.io.clock_diff.poke(1)
        dut.io.clock_sub.poke(1)
        val diff_clock = 1
        val sub_clock = 2
        dut.clock.setTimeout(2000)
        dut.io.s_in.poke(
          "h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U
        )
        dut.io.round.poke(12)
        dut.io.start.poke(true)
        dut.clock.step(3)
        for (c <- 0 until diff_clock) {
          dut.io.clock_diff.poke(1)
          dut.io.clock_diff.poke(0)
        }
        for (c <- 0 until sub_clock) {
          dut.io.clock_sub.poke(1)
          dut.io.clock_sub.poke(0)
        }
        dut.io.start.poke(false)
        // dut1:
        // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        // dut1.io.round.poke(12.U)
        // dut1.io.start.poke(true.B)
        // dut1.clock.step()
        // dut1.io.start.poke(false.B)
        var count = 0
        while (dut.io.done.peekBoolean() == false) {
          println("Result is: " + (dut.io.s_out.peek()))
          dut.clock.step(3)
          for (c <- 0 until diff_clock) {
            dut.io.clock_diff.poke(1)
            dut.io.clock_diff.poke(0)
          }
          for (c <- 0 until sub_clock) {
            dut.io.clock_sub.poke(1)
            dut.io.clock_sub.poke(0)
          }
          count = count + 1
        }
        println("Final result is: " + (dut.io.s_out.peek()))
        // println("Result from dut1 is: " + (dut1.io.s_out.peek()))

        println(
          "finished processing first permutations and took " + count + " cycles"
        )
        // Vivado 2022.2: 1048 LUT, 1209 FF, 4.762ns
        // took 241 cycles

        //   dut.clock.step()

        //   dut.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        //   dut.io.start.poke(true.B)
        //   dut.clock.step()
        //   dut.io.start.poke(false.B)
        //   // dut1:
        //   // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        //   // dut1.io.start.poke(true.B)
        //   // dut1.clock.step()
        //   // dut1.io.start.poke(false.B)

        //   count = 0
        //   while (dut.io.done.peekBoolean() == false) {
        //     dut.clock.step()
        //     count = count + 1
        //     println("Result is: " + (dut.io.s_out.peek()))
        //   }
        //   // println("Result from dut1 is: " + (dut1.io.s_out.peek()))
        //   println("finished processing first permutations and took " + count + " cycles")
        // // }
      }

  }
  "onewrapper" should "work" in {
    test(new permutation_one_wrapper)
      .withAnnotations(Seq(VerilatorBackendAnnotation)) { dut =>
        // val dut1 = Module(new permutation_one_wrapper)
        // test(new permutation_one_wrapper) { dut1 =>
        // var pcycle = 13
        // poke(dut.io.s_in, "hfe9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140".U)
        dut.io.s_in.poke(
          "h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U
        )
        dut.io.round.poke(12.U)
        dut.io.start.poke(true.B)
        dut.clock.step()
        dut.io.start.poke(false.B)
        // dut1:
        // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        // dut1.io.round.poke(12.U)
        // dut1.io.start.poke(true.B)
        // dut1.clock.step()
        // dut1.io.start.poke(false.B)
        var count = 0
        while (dut.io.done.peekBoolean() == false) {
          println("Result is: " + (dut.io.s_out.peek()))
          dut.clock.step()
          count = count + 1
        }
        // println("Result from dut1 is: " + (dut1.io.s_out.peek()))
        println("Final result is: " + (dut.io.s_out.peek()))
        println(
          "finished processing first permutations and took " + count + " cycles"
        )
        //   dut.clock.step()

        //   dut.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        //   dut.io.start.poke(true.B)
        //   dut.clock.step()
        //   dut.io.start.poke(false.B)
        //   // dut1:
        //   // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
        //   // dut1.io.start.poke(true.B)
        //   // dut1.clock.step()
        //   // dut1.io.start.poke(false.B)

        //   count = 0
        //   while (dut.io.done.peekBoolean() == false) {
        //     dut.clock.step()
        //     count = count + 1
        //     println("Result is: " + (dut.io.s_out.peek()))
        //   }
        //   // println("Result from dut1 is: " + (dut1.io.s_out.peek()))
        //   println("finished processing first permutations and took " + count + " cycles")
        // // }
      }

  }
  "threewrapper" should "work" in {
    test(new permutation_three_wrapper) { dut =>
      // val dut1 = Module(new permutation_one_wrapper)
      // test(new permutation_one_wrapper) { dut1 =>
      // var pcycle = 13
      // poke(dut.io.s_in, "hfe9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140".U)
      dut.io.s_in.poke(
        "h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U
      )
      dut.io.round.poke(12.U)
      dut.io.start.poke(true.B)
      dut.clock.step()
      dut.io.start.poke(false.B)
      // dut1:
      // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
      // dut1.io.round.poke(12.U)
      // dut1.io.start.poke(true.B)
      // dut1.clock.step()
      // dut1.io.start.poke(false.B)
      var count = 0
      while (dut.io.done.peekBoolean() == false) {
        println("Result is: " + (dut.io.s_out.peek()))
        dut.clock.step()
        count = count + 1
      }
      println("Final result is: " + (dut.io.s_out.peek()))
      // println("Result from dut1 is: " + (dut1.io.s_out.peek()))

      println(
        "finished processing first permutations and took " + count + " cycles"
      )
      //   dut.clock.step()

      //   dut.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
      //   dut.io.start.poke(true.B)
      //   dut.clock.step()
      //   dut.io.start.poke(false.B)
      //   // dut1:
      //   // dut1.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
      //   // dut1.io.start.poke(true.B)
      //   // dut1.clock.step()
      //   // dut1.io.start.poke(false.B)

      //   count = 0
      //   while (dut.io.done.peekBoolean() == false) {
      //     dut.clock.step()
      //     count = count + 1
      //     println("Result is: " + (dut.io.s_out.peek()))
      //   }
      //   // println("Result from dut1 is: " + (dut1.io.s_out.peek()))
      //   println("finished processing first permutations and took " + count + " cycles")
      // // }
    }

  }
}

// object decryptBehavior extends App {
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  decryptBehavior(c, 2)
//   }
// }

// object encryptBehavior extends App {
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  encryptBehavior(c, 2)
//   }
// }

// object hashBehavior extends App {
//   ""
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  hashBehavior(c, 2)
//   }
// }

// object newBehavior extends App {
//   chisel3.iotesters.Driver(() => new permutation_one_wrapper()) { c =>
//     new newBehavior(c, 2)
//   }
// }
