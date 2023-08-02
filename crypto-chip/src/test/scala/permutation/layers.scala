package layers


import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._
import scala.math._


class rotateTest extends AnyFlatSpec with ChiselScalatestTester {
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
}
