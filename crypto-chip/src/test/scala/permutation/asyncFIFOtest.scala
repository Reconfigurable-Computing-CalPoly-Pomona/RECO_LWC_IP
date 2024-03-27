package layers
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import layers._
import scala.math._
import scala.runtime.BoxedUnit

class async_test extends AnyFlatSpec with ChiselScalatestTester {
  "add_reg_domain" should "work" in {
    test(new Module {
      val io = IO(new Bundle {
        val clockA = Input(Bool())
        val in = Input(UInt(4.W))
        val start = Input(Bool())
        val out = Output(UInt(4.W))
      })
      val test = Module(new domain_test_emu())
      test.io.clockA := io.clockA.asClock
      test.io.in := io.in
      test.io.start := io.start
      io.out := test.io.out
    }).withAnnotations(Seq(WriteVcdAnnotation)).withAnnotations(Seq(VerilatorBackendAnnotation)) { dut =>
      println("output is: " + (dut.io.out.peekInt()))
      // dut.reset.poke(true.B)
      dut.io.clockA.poke(1)
      dut.io.clockA.poke(0)
      // dut.reset.poke(false.B)
      dut.io.in.poke(0)
      dut.io.start.poke(1)
      dut.clock.step()
      dut.io.start.poke(0)
      dut.clock.step()
      for (i <- 0 until 20) {
        dut.clock.step()
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
      }
      println("output is: " + (dut.io.out.peekInt()))
      dut.io.start.poke(1)
      dut.clock.step()
      dut.io.start.poke(0)
      dut.clock.step()
      for (i <- 0 until 20) {
        dut.clock.step()
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
        dut.io.clockA.poke(1)
        dut.io.clockA.poke(0)
      }
      println("output is: " + (dut.io.out.peekInt()))

    }
  }
  "initreg multiclock" should "work" in {
    test(new Module {
      val io = IO(new Bundle {
        val clockA = Input(Bool())
        val out = Output(UInt(2.W))
      })
      val rtest = Module(new multiclock())
      rtest.io.clockA := io.clockA.asClock
      io.out := rtest.io.out
    }).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // output should be 16
      dut.io.clockA.poke(1)
      dut.io.clockA.poke(0)
      dut.clock.step()
      dut.io.clockA.poke(1)
      dut.io.clockA.poke(0)
      dut.clock.step()
      println("state is: " + (dut.io.out.peek()))
      // for (i <- 0 until 20) {
      //   dut.io.clockA.poke(1)
      //   dut.io.clockA.poke(0)
      // }
    }
  }
  "n bit" should "work" in {
    test(new Module {
      val io = IO(new Bundle {
        val clockA = Input(Bool())
        val clockB = Input(Bool())
        val in = Flipped(Decoupled(UInt(10.W)))
        val out = Decoupled(UInt(10.W))
      })
      val top = Module(new top(10))
      top.io.clockA := io.clockA.asClock
      top.io.clockB := io.clockB.asClock
      top.io.in <> io.in
      io.out <> top.io.out
    }).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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
    test(new Module {
      val io = IO(new Bundle {
        val clockA = Input(Bool())
        val clockB = Input(Bool())
        val in = Flipped(Decoupled(UInt(1.W)))
        val out = Decoupled(UInt(1.W))
      })
      val top = Module(new top(1))
      top.io.clockA := io.clockA.asClock
      top.io.clockB := io.clockB.asClock
      top.io.in <> io.in
      io.out <> top.io.out
    }).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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
