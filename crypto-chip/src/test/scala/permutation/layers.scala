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
        test(new rotateRight()) { dut =>
            val start = 51
            for (amountLeftShifted <- 0 until 30) {
                // start * pow(2, amountLeftShifted)
                print(amountLeftShifted + ".leftShifted value is: ")
                //val leftShifted = BigDecimal(start * math.pow(2,amountLeftShifted)).toBigInt
                //val leftShifted = start * math.pow(2,amountLeftShifted).toLong
                val leftShifted = start * BigDecimal(2).pow(amountLeftShifted).toBigInt
                print(leftShifted)
                println()
                dut.io.input.poke(leftShifted)
                dut.io.amount.poke(amountLeftShifted)
                dut.io.output.expect(start)
                println(dut.io.output.peek())
            }
        }
    }
    "rotateTestBarrel_loop" should "work" in {
        test(new barrelShifter(6)) { dut =>
            val start = 51
            for (amountLeftShifted <- 0 until 30) {
                // start * pow(2, amountLeftShifted)
                print(amountLeftShifted + ".leftShifted value is: ")
                //val leftShifted = BigDecimal(start * math.pow(2,amountLeftShifted)).toBigInt
                //val leftShifted = start * math.pow(2,amountLeftShifted).toLong
                val leftShifted = start * BigDecimal(2).pow(amountLeftShifted).toBigInt
                print(leftShifted)
                println()
                dut.io.input.poke(leftShifted)
                dut.io.amount.poke(amountLeftShifted)
                dut.io.output.expect(start)
                println(dut.io.output.peek())
            }
        }
    }
}
