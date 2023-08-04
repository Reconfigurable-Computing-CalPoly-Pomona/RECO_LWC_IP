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
trait testFunctions {
    // rotate a max of 64 bit to left
    def rotateLeft(amount: Int, input: BigInt) : BigInt = {
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
    def rotateRight(amount: Int, input: BigInt) : BigInt = {
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
    def singleDiffusion(xIn: BigInt, amountFirst: Int, amountSecond: Int) : BigInt = {
        val x_out = xIn ^ (rotateRight(amountFirst, xIn)) ^ (rotateRight(amountSecond, xIn))
    return x_out
    }
}
class rotateTest extends AnyFlatSpec with ChiselScalatestTester with testFunctions {
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
        while (start < BigDecimal(2).pow(6).toBigInt - 1) {
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
    }    }
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
            while (start < BigDecimal(2).pow(6).toBigInt - 1) {
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
    }
    
}
// def singleDiffusion extends diffusion(xIn: BigInt, amountFirst: Int, amountSecond: Int) : BigInt = {
//     val x_out = xIn ^ (rotateRight(amountFirst, xIn)) ^ (rotateRight(amountSecond, xIn))
//     return x_out
// }
class diffusionTest extends AnyFlatSpec with ChiselScalatestTester with testFunctions {
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
            for (i <- 0 until 10) {
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
            //dut.io.x_out.expect(xIn)
            dut.io.done.expect(true)
            dut.io.start.poke(true)
            for (i <- 0 until 10) {
                println("x_out value is: " + dut.io.x_out.peekInt())
                println("done is: " + dut.io.done.peekBoolean())
                dut.clock.step()
            }
            if (dut.io.done.peekBoolean()) {
                dut.io.x_out.expect(result_expected)
            }
        }
    }
}
