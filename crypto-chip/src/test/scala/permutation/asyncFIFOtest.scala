package layers
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._
import scala.math._

class async_test extends AnyFlatSpec with ChiselScalatestTester {
  "n bit" should "work" in {
    test(new top(10)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        for (i <- 10 until (pow(2, 10).intValue - 1)) {
          dut.io.in.bits.poke(i)
          dut.io.in.valid.poke(1)
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)
          dut.io.in.valid.poke(0)
          // step the clock of A 2 times for every one clock B 20 times
          for (i <- 0 until 20) {
            dut.io.clockA.poke(1)
            dut.io.clockA.poke(0)
            dut.io.clockA.poke(1)
            dut.io.clockA.poke(0)
            
            dut.io.clockB.poke(1)
            dut.io.clockB.poke(0)
          }
          dut.io.out.valid.expect(true)
          dut.io.out.ready.poke(true)
          dut.io.out.bits.expect(i)
          
          // dequeue from output
          dut.io.out.ready.poke(true)
          dut.io.clockB.poke(1)
          dut.io.clockB.poke(0)
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)
          dut.io.out.ready.poke(false)
        }
    }
  }

  "one bit" should "work" in {
    test(new top(1))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        // put in a 0 for the data
        dut.io.in.bits.poke(0)
        dut.io.in.valid.poke(1)
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
        dut.io.in.valid.poke(0)
        // dut.io.in.bits.poke(1)
        // step the clock of A 2 times for every one clock B 20 times
        for (i <- 0 until 20) {
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)

          dut.io.clockB.poke(1)
          dut.io.clockB.poke(0)
        }
        dut.io.out.valid.expect(true)
        dut.io.out.ready.poke(true)
        dut.io.out.bits.expect(0)

        // dequeue from output
        dut.io.out.ready.poke(true)
        dut.io.clockB.poke(1)
        dut.io.clockB.poke(0)
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
        dut.io.out.ready.poke(false)
        
        // at this point, things can be run again
        // put in a 1 for the data
        dut.io.in.bits.poke(1)
        dut.io.in.valid.poke(1)
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
        dut.io.in.valid.poke(0)
        // dut.io.in.bits.poke(1)
        // step the clock of A 2 times for every one clock B 20 times
        for (i <- 0 until 20) {
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)
          dut.io.clockA.poke(1)
          dut.io.clockA.poke(0)

          dut.io.clockB.poke(1)
          dut.io.clockB.poke(0)
        }
        dut.io.out.valid.expect(true)
        dut.io.out.ready.poke(true)
        dut.io.out.bits.expect(1)
      }
  }
}
