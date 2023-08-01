package layers


import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._

class rotateTest extends AnyFlatSpec with ChiselScalatestTester {
  test(new rotateRight()) { dut =>
    dut.io.input.poke(14.U)
    dut.io.amount.poke(1.U)
    dut.io.output.expect(7)
    dut.io.input.poke(2.U)
    dut.io.amount.poke(1.U)
    dut.io.output.expect(1)
  }
}
