/*
 * Dummy tester to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package empty

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class AddTester extends AnyFlatSpec with ChiselScalatestTester {

  "Add" should "work" in {
    test(new Add) { dut =>
      for (a <- 0 to 2) {
        for (b <- 0 to 3) {
          val result = a + b
          dut.io.a.poke(a.U)
          dut.io.b.poke(b.U)
          dut.clock.step(1)
          dut.io.c.expect(result.U)
        }
      }
    }
  }

  val key = BigInt("0F0E0D0C0B0A09080706050403020100", 16)
  val nonce = BigInt("0B0A09080706050403020100", 16)
  println("key is: ")
  println(key)

 "FSR_640" should "work" in {
    test(new FSR_128_N(640)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F0", 16)
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("b505cbd12f65bbf2db809a68c8f4465d", 16))

    }
  }
  "FSR_640_1" should "work" in {
    test(new FSR_128_N(5)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("f8000000000000000000000000000000", 16))
    }
  }
  "FSR_640_2" should "work" in {
    test(new FSR_128_N(1)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("80000000000000000000000000000000", 16))
    }
  }
  "FSR_640_3" should "work" in {
    test(new FSR_128_N(3)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("e0000000000000000000000000000000", 16))
    }
  }
  "FSR_640_128" should "not fail" in {
    test(new FSR_128_N(128)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("8b375e6940ef826b8b46251bfcfdfeff", 16))
    }
  }
  "FSR_640_640" should "not fail" in {
    test(new FSR_128_N(640)) { dut =>
      // val key = BigInt("00102030405060708090A0B0C0D0E0F", 16)
      dut.io.key.poke(key)
      dut.io.state.poke(0)
      dut.io.state_out.expect(BigInt("b505cbd12f65bbf2db809a68c8f4465d", 16))
    }
  }
}
