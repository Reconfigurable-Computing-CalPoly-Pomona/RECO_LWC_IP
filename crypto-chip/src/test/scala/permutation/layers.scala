package layers

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._
import scala.math._

// package object diffusion {
//     // rotate a max of 64 bit to left
//     def rotateLeft(amount: Int, input: BigInt) : BigInt = {
//         // mask for lsb
//         val mask = BigDecimal(2).pow(64).toBigInt - 2
//         var result = input
//         for (i <- 0 until amount) {
//             // take lsb and save for later
//             val temp = result >> 63 & 1
//             // mask out top bit to write the temp variable at the msb
//             result = ((result << 1) & mask) | temp
//         }
//         return result
//     }
//     // rotate a max of 64 bit to left
//     def rotateRight(amount: Int, input: BigInt) : BigInt = {
//         // mask for top 64 bit
//         val mask = BigDecimal(2).pow(63).toBigInt - 1
//         var result = input
//         for (i <- 0 until amount) {
//             // take lsb and save for later
//             val temp = result & 1
//             // mask out top bit to write the temp variable at the msb
//             result = ((result >> 1) & mask) | temp << 63
//         }
//         return result
//     }
//     def singleDiffusion(xIn: BigInt, amountFirst: Int, amountSecond: Int) : BigInt = {
//         val x_out = xIn ^ (rotateRight(amountFirst, xIn)) ^ (rotateRight(amountSecond, xIn))
//         return x_out
//     }
// }
// TODO: show numbers and cycles to Dr. Aly. Also ask about verifying the results
trait testFunctions {
  // rotate a max of 64 bit to left
  def rotateLeft(amount: Int, input: BigInt): BigInt = {
    // mask for lsb
    val mask = BigDecimal(2).pow(64).toBigInt - 2
    var result = input
    for (i <- 0 until amount) {
      // take lsb and save for later
      val temp = result >> 63 & 1
      // mask out top bit to write the temp variable at the msb
      result = ((result << 1) & mask) | temp
    }
    return result
  }
  // rotate a max of 64 bit to left
  def rotateRight(amount: Int, input: BigInt): BigInt = {
    // mask for top 64 bit
    val mask = BigDecimal(2).pow(63).toBigInt - 1
    var result = input
    for (i <- 0 until amount) {
      // take lsb and save for later
      val temp = result & 1
      // mask out top bit to write the temp variable at the msb
      result = ((result >> 1) & mask) | temp << 63
    }
    return result
  }
  def singleDiffusion(
      xIn: BigInt,
      amountFirst: Int,
      amountSecond: Int
  ): BigInt = {
    val x_out =
      xIn ^ (rotateRight(amountFirst, xIn)) ^ (rotateRight(amountSecond, xIn))
    return x_out
  }
  class amount(var first: Int, var second: Int)
  def decode_i(i: Int): amount = {
    var amountFirst = 0
    var amountSecond = 0
    if (i == 0) {
      amountFirst = 19
      amountSecond = 28
    } else if (i == 1) {
      amountFirst = 61
      amountSecond = 39
    } else if (i == 2) {
      amountFirst = 1
      amountSecond = 6
    } else if (i == 3) {
      amountFirst = 10
      amountSecond = 17
    } else if (i == 4) {
      amountFirst = 7
      amountSecond = 41
    } else {
      amountFirst = 0
      amountSecond = 0
    }
    return new amount(amountFirst, amountSecond)
  }
  def singleDiffusion_i(xIn: BigInt, i: Int): BigInt = {
    var amountFirst = 0
    var amountSecond = 0
    if (i == 0) {
      amountFirst = 19
      amountSecond = 28
    } else if (i == 1) {
      amountFirst = 61
      amountSecond = 39
    } else if (i == 2) {
      amountFirst = 1
      amountSecond = 6
    } else if (i == 3) {
      amountFirst = 10
      amountSecond = 17
    } else if (i == 4) {
      amountFirst = 7
      amountSecond = 41
    } else {
      amountFirst = 0
      amountSecond = 0
    }
    return singleDiffusion(xIn, amountFirst, amountSecond)
  }

}
class rotateTest
    extends AnyFlatSpec
    with ChiselScalatestTester
    with testFunctions {
  // if the test description is missing, the error None.get() appears
  "rotateTest" should "work" in {
    test(new rotateRight()) { dut =>
      dut.io.input.poke(14.U)
      dut.io.amount.poke(1.U)
      dut.io.output.expect(7)
      dut.io.input.poke(2.U)
      dut.io.amount.poke(1.U)
      dut.io.output.expect(1)
    }
  }
  "rotateTest_loop" should "work" in {
    test(new rotateRight) { dut =>
      var start = BigInt(1)
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          // println("result of start shifted is: " + amountLeftShifted)
          dut.io.amount.poke(amountLeftShifted)
          dut.io.output.expect(start)
          // println(dut.io.output.peek())
        }
        start = start + BigInt(1)
      }
    }
  }
// public static BigInt rotateLeft(BigInt value, int shift, int bitSize)
// {
//     // Note: shift must be positive, if necessary add checks.

//     BigInt topBits = value.shiftRight(bitSize - shift);
//     BigInt mask = BigInt.ONE.shiftLeft(bitSize).subtract(BigInteger.ONE);
//     return value.shiftLeft(shift).or(topBits).and(mask);
// }

  // // rotate a max of 64 bit to left
  // def rotateLeft(amount: Int, input: BigInt) : BigInt = {
  //     // mask for lsb
  //     val mask = BigDecimal(2).pow(64).toBigInt - 2
  //     var result = input
  //     for (i <- 0 until amount) {
  //         // take lsb and save for later
  //         val temp = result >> 63 & 1
  //         // mask out top bit to write the temp variable at the msb
  //         result = ((result << 1) & mask) | temp
  //     }
  //     return result
  // }
  // // rotate a max of 64 bit to left
  // def rotateRight(amount: Int, input: BigInt) : BigInt = {
  //     // mask for top 64 bit
  //     val mask = BigDecimal(2).pow(63).toBigInt - 1
  //     var result = input
  //     for (i <- 0 until amount) {
  //         // take lsb and save for later
  //         val temp = result & 1
  //         // mask out top bit to write the temp variable at the msb
  //         result = ((result >> 1) & mask) | temp << 63
  //     }
  //     return result
  // }
  "rotateTestBarrel_loop" should "work" in {
    test(new barrelShifter(6)) { dut =>
      var start = BigInt(1)
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          // println("result of start shifted is: " + amountLeftShifted)
          dut.io.amount.poke(amountLeftShifted)
          dut.io.output.expect(start)
          // println(dut.io.output.peek())
        }
        start = start + BigInt(1)
      }
    }
  }
  "testbarrelclocks" should "work" in {
    test(new barrelShifter(6)) { dut =>
      var start = BigInt(1)
      for (amountLeftShifted <- 0 until 64) {
        // println("start is: " + start)
        // println("amount left shifted is: " + amountLeftShifted)
        dut.io.input.poke(rotateLeft(amountLeftShifted, start))
        // println("result of start shifted is: " + amountLeftShifted)
        dut.io.amount.poke(amountLeftShifted)
        dut.io.output.expect(start)
        dut.clock.step(10)
        dut.io.output.expect(start)
        // println(dut.io.output.peek())
      }
    }
    // Vivado 2022.2: 192 LUT, 7.095ns
  }
  "sequential barrel shifter" should "work looped" in {
    test(new barrelShifter_seq(6)) { dut =>
      var start = BigInt(1)
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          dut.io.done.expect(true)
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          dut.io.start.poke(1)
          dut.clock.step()
          dut.io.start.poke(0)
          // println("result of start shifted is: " + amountLeftShifted)
          for (i <- 0 until 20) {
            // println("output is: " + dut.io.output.peek() + " at clock cycle: " + i)
            dut.clock.step()
          }
          dut.io.output.expect(start)
        }
        start = start + BigInt(1)
      }
    }
    // Vivado 2022.2: 204 LUT, 136 FF, 4.090ns Total Delay
    // 4.090ns/1cycle*1765 cycles; 1765*4.090ns total time vs 11cycles*(6.501ns)=total time
    // Vivado 2018.1: 206 LUT, 136 FF, 4.090ns Total Delay
  }
  "param sequential barrel shifter" should "work" in {
    test(new barrelShifter_seq_param(6)) { dut =>
      var start = BigInt(1)
      // while (start < BigDecimal(2).pow(7).toBigInt - 1) {
      // for (amountLeftShifted <- 0 until 64) {
      // println("start is: " + start)
      // println("amount left shifted is: " + amountLeftShifted)
      dut.io.input.poke(rotateLeft(0, start))
      dut.io.amount.poke(0)
      println("result of start shifted is: " + rotateLeft(0, start))
      for (i <- 0 until 2) {
        println("output is: " + dut.io.output.peek() + " at clock cycle: " + i)
        dut.clock.step()
      }
      println("output is: " + dut.io.output.peek())
      dut.io.output.expect(start)
      // }
      // start = start + BigInt(1)
      // }
    }
  }
  "param sequential barrel shifter" should "work looped" in {
    test(new barrelShifter_seq_param(6)) { dut =>
      var start = BigInt(1)
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          println("start is: " + start)
          println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          println(
            "result of start shifted is: " + rotateLeft(
              amountLeftShifted,
              start
            )
          )
          // wait two cycles
          for (i <- 0 until 2) {
            println(
              "output is: " + dut.io.output.peek() + " at clock cycle: " + i
            )
            dut.clock.step()
          }
          println("output is: " + dut.io.output.peek())
          dut.io.output.expect(start)
        }
        start = start + BigInt(1)
      }
    }
    // Vivado 2022.2: 192 LUT, 128 FF, 5.199 Total Delay
    // Vivado 2018.1: 192 LUT, 128 FF, 5.335 Total Delay
  }
  "param sequential barrel shifter" should "work looped and pipelined" in {
    test(new barrelShifter_seq_param(6)) { dut =>
      var start = BigInt(1)
      var amountLeftShifted = 0
      // while (start < BigDecimal(2).pow(3).toBigInt - 1) {
      //     for (amountLeftShifted <- 0 until 64) {
      println("start is: " + start)
      println("amount left shifted is: " + amountLeftShifted)
      dut.io.input.poke(rotateLeft(amountLeftShifted, start))
      dut.io.amount.poke(amountLeftShifted)
      println(
        "result of start shifted is: " + rotateLeft(amountLeftShifted, start)
      )
      dut.clock.step()
      amountLeftShifted = 1
      println("start is: " + start)
      println("amount left shifted is: " + amountLeftShifted)
      dut.io.input.poke(rotateLeft(amountLeftShifted, start))
      dut.io.amount.poke(amountLeftShifted)
      println(
        "result of start shifted is: " + rotateLeft(amountLeftShifted, start)
      )
      println("output is: " + dut.io.output.peek())
      dut.clock.step()
      amountLeftShifted = 2
      println("start is: " + start)
      println("amount left shifted is: " + amountLeftShifted)
      dut.io.input.poke(rotateLeft(amountLeftShifted, start))
      dut.io.amount.poke(amountLeftShifted)
      println(
        "result of start shifted is: " + rotateLeft(amountLeftShifted, start)
      )
      println("output is: " + dut.io.output.peek())
      dut.io.output.expect(start)
      dut.clock.step()
      println("output is: " + dut.io.output.peek())
      dut.io.output.expect(start)
    }
  }
  "sequential barrel shifter pipe test" should "work pipelined" in {
    test(new barrelShifter_seq_param(6)) { dut =>
      var start = BigInt(1)
      var amountLeftShifted = 19
      var amountLeftShifted1 = 28
      var amountLeftShifted2 = 17
      var maskoutbot4 = 48
      var maskouttop2 = 15
      var maskouttop4 = 3
      var maskoutbot2 = 60
      // rotate to right, then rotate left to find original
      // rotate with bits 3..0
      dut.io.input.poke(start)
      println("out at start is: " + dut.io.output.peekInt())
      // Learned: put in 2 lower bits first before inserting, then next cycle will include the next 4 bits
      dut.io.amount.poke(amountLeftShifted & maskouttop4)
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.amount.poke(
        (amountLeftShifted1 & maskouttop4) | (amountLeftShifted & maskoutbot2)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      // output should be valid
      println("now valid out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted, start))
      dut.io.amount.poke(
        (amountLeftShifted2 & maskouttop4) | (amountLeftShifted1 & maskoutbot2)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted1, start))
      dut.io.amount.poke(
        (amountLeftShifted2 & maskouttop4) | (amountLeftShifted2 & maskoutbot2)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted2, start))
    }
  }
  "barrel shifter with 2 register" should "work" in {
    test(new barrelShifter_2reg()) { dut =>
      var start = BigInt(1)
      // while (start < BigDecimal(2).pow(7).toBigInt - 1) {
      // for (amountLeftShifted <- 0 until 64) {
      // println("start is: " + start)
      // println("amount left shifted is: " + amountLeftShifted)
      dut.io.input.poke(rotateLeft(0, start))
      dut.io.amount.poke(0)
      println("result of start shifted is: " + rotateLeft(0, start))
      for (i <- 0 until 2) {
        println("output is: " + dut.io.output.peek() + " at clock cycle: " + i)
        dut.clock.step()
      }
      println("output is: " + dut.io.output.peek())
      dut.io.output.expect(start)
      // }
      // start = start + BigInt(1)
      // }
    }
  }
  "barrel shifter with 2 register" should "work looped" in {
    test(new barrelShifter_2reg()) { dut =>
      var start = BigInt(1)
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          println("start is: " + start)
          println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          println(
            "result of start shifted is: " + rotateLeft(
              amountLeftShifted,
              start
            )
          )
          // wait two cycles
          for (i <- 0 until 2) {
            println(
              "output is: " + dut.io.output.peek() + " at clock cycle: " + i
            )
            dut.clock.step()
          }
          println("output is: " + dut.io.output.peek())
          dut.io.output.expect(start)
        }
        start = start + BigInt(1)
      }
    }
    // Resources Undetermined
  }
  "barrel shifter with 2 register" should "work looped and pipelined" in {
    test(new barrelShifter_2reg()) { dut =>
      var start = BigInt(1)
      var amountLeftShifted = 0
      while (start < BigDecimal(2).pow(3).toBigInt - 1) {
        for (amountLeftShifted <- 0 until 64) {
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          // println(
          //   "result of start shifted is: " + rotateLeft(
          //     amountLeftShifted,
          //     start
          //   )
          // )
          dut.clock.step()
          // amountLeftShifted = 1
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          // println(
          //   "result of start shifted is: " + rotateLeft(
          //     amountLeftShifted,
          //     start
          //   )
          // )
          // println("output is: " + dut.io.output.peek())
          dut.clock.step()
          // amountLeftShifted = 2
          // println("start is: " + start)
          // println("amount left shifted is: " + amountLeftShifted)
          dut.io.input.poke(rotateLeft(amountLeftShifted, start))
          dut.io.amount.poke(amountLeftShifted)
          // println(
          //   "result of start shifted is: " + rotateLeft(
          //     amountLeftShifted,
          //     start
          //   )
          // )
          // println("output is: " + dut.io.output.peek())
          dut.io.output.expect(start)
          dut.clock.step()
          // println("output is: " + dut.io.output.peek())
          dut.io.output.expect(start)
          start = start + 1
        }
      }
    }
  }
  "barrel shifter with 2 register" should "work pipelined" in {
    test(new barrelShifter_2reg()) { dut =>
      var start = BigInt(1)
      var amountLeftShifted = 19
      var amountLeftShifted1 = 28
      var amountLeftShifted2 = 17
      // Retain Least Significant 3 bits
      var maskouttop = 7
      // Retain Most Significant 3 bits
      var maskoutbot = 56
      // rotate to right, then rotate left to find original
      dut.io.input.poke(start)
      println("out at start is: " + dut.io.output.peekInt())
      dut.io.amount.poke(amountLeftShifted & maskouttop)
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.amount.poke(
        (amountLeftShifted1 & maskouttop) | (amountLeftShifted & maskoutbot)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      // output should be valid
      println("now valid out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted, start))
      dut.io.amount.poke(
        (amountLeftShifted2 & maskouttop) | (amountLeftShifted1 & maskoutbot)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted1, start))
      dut.io.amount.poke(
        (amountLeftShifted2 & maskouttop) | (amountLeftShifted2 & maskoutbot)
      )
      println("out after poking amount is: " + dut.io.output.peekInt())
      dut.clock.step()
      println("out after clock is: " + dut.io.output.peekInt())
      dut.io.output.expect(rotateRight(amountLeftShifted2, start))
    }
  }
  // Vivado 2022.2: 192 LUT, 128 FF, 4.090ns Total Delay
}
// def singleDiffusion extends diffusion(xIn: BigInt, amountFirst: Int, amountSecond: Int) : BigInt = {
//     val x_out = xIn ^ (rotateRight(amountFirst, xIn)) ^ (rotateRight(amountSecond, xIn))
//     return x_out
// }
class diffusionPipeTest
    extends AnyFlatSpec
    with ChiselScalatestTester
    with testFunctions {
  "single diffusion pipeline" should "work" in {
    test(new single_diff_pipe()) { dut =>
      var start = BigInt(1)
      var index = 1
      dut.io.i.poke(index)
      dut.io.x_in.poke(start)
      for (i <- 0 until 5) {
        // dut.io.count.poke(i % 2)
        println("i is: " + i)
        println("x_out value is: " + dut.io.x_out.peekInt())
        if (i == 4) {
          dut.io.x_out.expect(singleDiffusion_i(start, index))
        }
        dut.clock.step()
      }
    }
  }
  "single diffusion pipeline" should "work looped" in {
    test(new single_diff_pipe()) { dut =>
      var start = BigInt(2)
      var index = 1
      dut.io.i.poke(index)
      while (start < BigDecimal(2).pow(1).toBigInt - 1) {
        dut.io.x_in.poke(start)
        for (i <- 0 until 5) {
          // dut.io.count.poke(i % 2)
          // println("i is: " + i)
          // println("x_out value is: " + dut.io.x_out.peekInt())
          if (i == 4) {
            // println("x_out value is: " + dut.io.x_out.peekInt())
            dut.io.x_out.expect(singleDiffusion_i(start, index))
          } else {
            dut.clock.step()
          }
        }
        start = start + BigInt(1)
      }
    }
  }
  "single diffusion pipeline with 2 val" should "work" in {
    test(new single_diff_pipe()).withAnnotations(Seq(WriteVcdAnnotation)) {
      dut =>
        var start = BigInt(2)
        var index = 0
        var oldIndex = 0
        // give a single start value to work with
        dut.io.x_in.poke(start)
        for (i <- 0 until 12) {
          // poke count to start; should be offset by one when starting
          // dut.io.count.poke(i % 2)
          println("i is: " + i)
          println("x_out value is: " + dut.io.x_out.peekInt())
          // every two cycles, poke index value
          if (i % 2 == 0) {
            println("poking index with: " + index)
            dut.io.i.poke(index)
            // offset the result by the number of cycles (4) to finish one value
            if (i >= 4) {
              // println("x_out value is: " + dut.io.x_out.peekInt())
              println(
                "x_out should be: " + singleDiffusion_i(
                  start,
                  oldIndex
                ) + " based on index: " + oldIndex
              )
              dut.io.x_out.expect(singleDiffusion_i(start, oldIndex))
              oldIndex = oldIndex + 1
            }
            index = index + 1
          }
          dut.clock.step()
        }
    }
    // Vivado 2022.2: 326 LUT, 259 FF, 4.691ns Total Delay
    // Vivado 2022.2 (pipelined): 262 LUT, 266 FF, 4.691ns Total Delay
  }
}
class diffusionTest
    extends AnyFlatSpec
    with ChiselScalatestTester
    with testFunctions {

  "testAssign" should "work" in {
    test(new regAssign) { dut =>
      // val xIn = 0
      // val expected = xIn

      dut.io.start.poke(false)
      // dut.io.x_in.poke(xIn)
      dut.io.x_out.expect(0)
      dut.io.done.expect(true)
      dut.io.start.poke(true)
      dut.clock.step()
      dut.io.start.poke(false)
      for (i <- 0 until 15) {
        println("x_out value is: " + dut.io.x_out.peekInt())
        println("done is: " + dut.io.done.peekBoolean())
        dut.clock.step()
      }

      dut.io.done.expect(true)
      dut.io.x_out.expect(4)
    }
  }
  "testSingleDiffusion" should "work" in {
    test(new diffusion_layer_single) { dut =>
      val xIn = 0
      val first = 19
      val second = 28
      val result_expected = singleDiffusion(xIn, first, second)
      dut.io.amountFirst.poke(first)
      dut.io.amountSecond.poke(second)
      dut.io.x_in.poke(xIn)
      dut.io.start.poke(false)
      dut.io.done.expect(true)
      dut.io.start.poke(true)
      dut.clock.step(3)
      if (dut.io.done.peekBoolean()) {
        dut.io.x_out.expect(result_expected)
      }
    }
  }
  "testSingleDiffusion with 1" should "work" in {
    test(new diffusion_layer_single) { dut =>
      val xIn = 1
      val first = 19
      val second = 28
      val result_expected = singleDiffusion(xIn, first, second)
      dut.io.amountFirst.poke(first)
      dut.io.amountSecond.poke(second)
      dut.io.x_in.poke(xIn)
      dut.io.start.poke(false)
      // dut.io.x_out.expect(xIn)
      dut.io.done.expect(true)
      dut.io.start.poke(true)
      for (i <- 0 until 10) {
        // println("x_out value is: " + dut.io.x_out.peekInt())
        // println("done is: " + dut.io.done.peekBoolean())
        dut.clock.step()
      }
      if (dut.io.done.peekBoolean()) {
        dut.io.x_out.expect(result_expected)
      }
    }
  }
  "testSingleDiffusion with loop for first, second" should "work" in {
    test(new diffusion_layer_single) { dut =>
      for (x_in <- 0 until 3) {
        for (amountfirst <- 0 until 6) {
          for (amountsecond <- 0 until 2) {
            dut.io.start.poke(false)
            dut.io.done.expect(true)
            dut.io.amountFirst.poke(amountfirst)
            dut.io.amountSecond.poke(amountsecond)
            dut.io.x_in.poke(x_in)
            dut.io.start.poke(true)
            dut.clock.step()
            dut.io.start.poke(false)

            println("waiting to finish processing ")
            // not sure how many clocks
            var count = 0
            while (dut.io.done.peekBoolean() == false) {
              // println("x_out value is: " + dut.io.x_out.peekInt())
              // println("done is: " + dut.io.done.peekBoolean())
              count = count + 1
              dut.clock.step()
            }
            println("took " + count + " clocks")
            dut.io.x_out.expect(
              singleDiffusion(x_in, amountfirst, amountsecond)
            )
          }
        }
      }
    }
    // 26 cycles
    // Vivado 2018.1: 279 LUT, 209 FF, Total Delay 4.773ns
    // Vivado 2022.2: 276 LUT, 209 FF, Total Delay 4.773ns
  }
  "amount_pipelined" should "work" in {
    test(new amount_decoder) { dut =>
      // var maskoutbot4 = 48
      // var maskouttop2 = 15
      var maskouttop3 = 7
      var maskoutbot3 = 56
      var count = 0
      for (i <- 0 until 6) {
        println("i is: " + i)
        dut.io.i.poke(i)
        dut.io.count.poke(count & 1)
        var first_first = dut.io.amount.peekInt() & maskouttop3
        println(
          "outBot before clock is: " + (dut.io.amount.peekInt() & maskouttop3)
        )
        println(
          "outTop before clock is: " + (dut.io.amount.peekInt() & maskoutbot3)
        )
        dut.clock.step()
        count = ~count
        dut.io.count.poke(count & 1)
        var first_second = dut.io.amount.peekInt() & maskoutbot3
        println(
          "outBot after clock is: " + (dut.io.amount.peekInt() & maskouttop3)
        )
        println(
          "outTop after clock is: " + (dut.io.amount.peekInt() & maskoutbot3)
        )
        println("result is: " + (first_first + first_second))
        assert(decode_i(i).first == (first_first + first_second))

        first_first = dut.io.amount.peekInt() & maskouttop3
        println(
          "outBot before clock is: " + (dut.io.amount.peekInt() & maskouttop3)
        )
        println(
          "outTop before clock is: " + (dut.io.amount.peekInt() & maskoutbot3)
        )
        // println("amount should be: " + decode_i(i))
        dut.clock.step()
        count = ~count
        dut.io.count.poke(count & 1)
        first_second = dut.io.amount.peekInt() & maskoutbot3
        println(
          "outBot after clock is: " + (dut.io.amount.peekInt() & maskouttop3)
        )
        println(
          "outTop after clock is: " + (dut.io.amount.peekInt() & maskoutbot3)
        )
        println("result is: " + (first_first + first_second))
        assert(decode_i(i).second == (first_first + first_second))
      }
    }
  }
  "diffusion pipelined" should "work" in {
    test(new double_pipe_diff) { dut =>
      for (x_in <- 0 until 3) {
        for (i <- 1 until 6) {
          println("i is: " + i + ", x_in is: " + x_in)
          dut.io.ready.expect(true)
          dut.io.x_in.data.poke(x_in)
          dut.io.x_in.i.poke(i)
          for (j <- 0 until 2) {
            dut.clock.step()
            println("out is: " + dut.io.x_out.peekInt())
          }
          println(
            "done processing, previous result should be: " + singleDiffusion_i(
              x_in,
              i
            )
          )
          println(
            "done processing, current result is: " + dut.io.x_out.peekInt()
          )
          // dut.io.x_out.expect(singleDiffusion_i(x_in, i))
        }
      }
    }
    // 26 cycles
    // Vivado 2018.1: 279 LUT, 209 FF, Total Delay 4.773ns
    // Vivado 2022.2: 276 LUT, 209 FF, Total Delay 4.773ns
  }
  "diffusion_fifo with one val" should "work" in {
    test(new diffusion_fifo(5)) { dut =>
      println("inserting x")
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
      // perform diffusion with x_0 = 0, i=0
      // perform full check here (with an if/when statement)
      dut.io.full.expect(false)
      dut.io.empty.expect(true)
      val x_in = 0
      val i = 0
      dut.io.x_in.data.poke(x_in)
      dut.io.x_in.i.poke(i)
      dut.io.startInsert.poke(1)
      dut.clock.step()
      dut.io.startInsert.poke(0)
      dut.clock.step()
      // not sure how many clocks
      dut.clock.step(40)
      // calculate result in scala
      val result = singleDiffusion_i(x_in, i)
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
      println("reading x")
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
      // perform empty check here (with an if/when statement)
      dut.io.empty.expect(false)
      dut.io.startOutput.poke(1)
      dut.clock.step()
      dut.io.x_out.data.expect(result)
      dut.io.x_out.i.expect(i)
      dut.io.startOutput.poke(0)
      dut.clock.step()
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
    }
  }
  "diffusion_fifo with 5 val" should "work" in {
    test(new diffusion_fifo(5)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // println("inserting x")
      // println("empty is: " + dut.io.empty.peek())
      // println("full is: " + dut.io.full.peek())
      // perform diffusion with x_0 = 0, i=0
      // perform full check here (with an if/when statement)
      var count = 0
      dut.io.full.expect(false)
      println("full is: " + dut.io.full.peek())
      println("empty is: " + dut.io.empty.peek())
      // inserting 5 values
      var i = 0
      while (i < 5) {
        // check if input fifo is full
        if (dut.io.full.peekBoolean() == false) {
          println("Writing at cycle: " + count)
          // change to i + 1 to see if it starts at 0 or 1
          dut.io.x_in.data.poke(i + 1)
          dut.io.x_in.i.poke(i)
          dut.io.startInsert.poke(1)
          dut.clock.step()
          count = count + 1
          i = i + 1
        }
        else {
          dut.io.startInsert.poke(0)
          dut.clock.step()
          count = count + 1
        }
        println("full is: " + dut.io.full.peek())
        println("empty is: " + dut.io.empty.peek())
      }
      dut.io.startInsert.poke(0)

      i = 0
      while (i < 5) {
        if (dut.io.empty.peekBoolean() == false) {
          println("Reading at cycle: " + count)
          // calculate result in scala
          println("data is: " + dut.io.x_out.data.peek())
          // change to i + 1 to see if it starts at 0 or 1
          println("data should be: " + singleDiffusion_i(i + 1, i))
          println("i is: " + dut.io.x_out.i.peek())
          println("i should be: " + i)
          dut.io.x_out.data.expect(singleDiffusion_i(i + 1, i))
          dut.io.startOutput.poke(1)
          dut.clock.step()
          count = count + 1
          i = i + 1
        }
        else {
          dut.io.startOutput.poke(0)
          dut.clock.step()
          count = count + 1
        }
      }
      println("took " + count + " cycles to finish")
      // println("waiting to finish processing ")
      // println("full is: " + dut.io.full.peek())
      // println("empty is: " + dut.io.empty.peek())
      // // not sure how many clocks
      // var count = 0
      // while (dut.io.full.peekBoolean() == false) {
      //   count = count + 1
      //   dut.clock.step()
      // }

      // // for (i <- 0 until 20) {
      // //     dut.clock.step()
      // //     // dut.io.full.expect(false)
      // //     println("empty is: " + dut.io.empty.peek())
      // //     println("full is: " + dut.io.full.peek())
      // // }
      // for (i <- 0 until 10) {
      //   if (dut.io.empty.peekBoolean() == false) {
      //     // calculate result in scala
      //     println("data is: " + dut.io.x_out.data.peek())
      //     println("data should be: " + singleDiffusion_i(i, i))
      //     println("i is: " + dut.io.x_out.i.peek())
      //     println("i should be: " + i)
      //     dut.io.x_out.data.expect(singleDiffusion_i(i, i))
      //     dut.io.startOutput.poke(1)
      //     dut.clock.step()

      //     dut.io.startOutput.poke(0)
      //     dut.clock.step()
      //   }
      // }
      // // println("empty is: " + dut.io.empty.peek())
      // // println("full is: " + dut.io.full.peek())
    }
    // Vivado 2018.1: 448 LUT, 224 FF, Total Delay 5.876ns
    // Vivado 2022.2: 519 LUT, 224 FF, Total Delay 5.872ns
    // Vivado 2022.2 (pipelined): 462 LUT, 298 FF, Total Delay 5.879ns
  }

  "diffusion_fifo with 5 together" should "work" in {
    test(new diffusion_layer_compat) { dut =>
      println("done is: " + dut.io.done.peek())
      println("x_out is: " + dut.io.x_out.peek())
      dut.io.done.expect(true)
      for (i <- 0 until 5) {
        dut.io.x_in(i).poke(i)
      }
      dut.io.start.poke(1)
      dut.clock.step()
      dut.io.start.poke(0)
      dut.clock.step()
      println("done is: " + dut.io.done.peek())
      dut.io.done.expect(false)
      println("waiting to finish processing ")
      // not sure how many clocks
      var count = 0
      while (dut.io.done.peekBoolean() == false) {
        count = count + 1
        dut.clock.step()
      }
      println("took " + count + " clocks")
      for (i <- 0 until 5) {
        dut.io.done.expect(true)
        // println("x_out at " + i + " is: " + dut.io.x_out(i))
        println("x_out at " + i + " is: " + dut.io.x_out(i).peek())
        dut.io.x_out(i).expect(singleDiffusion_i(i, i))
      }
      // Takes 142 cycles until complete
      // Vivado 2022.2: 665 LUT, 556 FF, 4.090ns Total Delay
      // Vivado 2018.1: 591 LUT, 551 FF, 4.217ns Total Delay
    }
  }
  "diffusion_fifo with 5 together at 0" should "work" in {
    test(new diffusion_layer_compat) { dut =>
      println("done is: " + dut.io.done.peek())
      println("x_out is: " + dut.io.x_out.peek())
      dut.io.done.expect(true)
      for (i <- 0 until 4) {
        dut.io.x_in(i).poke(0)
      }
      dut.io.x_in(4).poke(4)
      dut.io.start.poke(1)
      dut.clock.step()
      dut.io.start.poke(0)
      dut.clock.step()
      println("done is: " + dut.io.done.peek())
      dut.io.done.expect(false)
      println("waiting to finish processing ")
      // not sure how many clocks
      var count = 0
      while (dut.io.done.peekBoolean() == false) {
        count = count + 1
        dut.clock.step()
      }
      println("took " + count + " clocks")
      for (i <- 0 until 4) {
        dut.io.done.expect(true)
        // println("x_out at " + i + " is: " + dut.io.x_out(i))
        println("x_out at " + i + " is: " + dut.io.x_out(i).peek())
        dut.io.x_out(i).expect(singleDiffusion_i(0, i))
      }
      println("x_out at " + 4 + " is: " + dut.io.x_out(4).peek())
      dut.io.x_out(4).expect(singleDiffusion_i(4, 4))
      // Takes 142 cycles until complete
      // Vivado 2022.2: 665 LUT, 556 FF, 4.090ns Total Delay
      // Vivado 2018.1: 591 LUT, 551 FF, 4.217ns Total Delay
    }
  }

}

class queueTest extends AnyFlatSpec with ChiselScalatestTester {
  "queue" should "work" in {
    test(new queue_test) { dut =>
      println("inserting data")
      for (i <- 0 until 8) {
        println("empty is: " + dut.io.empty.peek())
        println("full is: " + dut.io.full.peek())
        dut.io.in.poke(i)
        dut.io.start_in.poke(1)
        dut.clock.step()
        dut.io.start_in.poke(0)
        dut.clock.step()
      }
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
      println("reading data")
      // Note that the output is indeed valid even before start_out is set high. This means the fifo continually outputs data and gets the next value after start_out
      for (i <- 0 until 8) {
        println("empty is: " + dut.io.empty.peek())
        println("full is: " + dut.io.full.peek())
        println("data is: " + dut.io.out.peek())
        dut.io.start_out.poke(1)
        dut.io.out.expect(i)
        dut.clock.step()
        dut.io.start_out.poke(0)
        dut.clock.step()
      }
      println("empty is: " + dut.io.empty.peek())
      println("full is: " + dut.io.full.peek())
    }
  }
}
class regTest extends AnyFlatSpec with ChiselScalatestTester {
  "queue" should "work" in {
    test(new reg_reset_test) { dut =>
      for (i <- 0 until 6) {
        println("Value in output is: " + dut.io.x_out.peek())
        dut.clock.step()
      }
    }
  }
}
