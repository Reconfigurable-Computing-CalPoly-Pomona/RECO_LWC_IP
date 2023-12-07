package layers
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._
import scala.math._


class async_test extends AnyFlatSpec with ChiselScalatestTester {
    "one bit" should "work" in {
        test(new top()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            
            dut.io.in.bits.poke(0)
            dut.io.in.valid.poke(1)
            dut.io.clockA.step()
            dut.io.in.valid.poke(0)
            // dut.io.in.bits.poke(1)
            dut.io.clockA.step(20)
            dut.io.clockB.step(10)

            dut.io.out.valid.expect(true)
            dut.io.out.ready.poke(true)
            dut.io.out.bits.expect(0)
        }
    }
}