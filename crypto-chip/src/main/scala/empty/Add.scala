/*
 * Dummy file to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package empty

import chisel3._
import chisel3.util._

class Add extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val c = Output(UInt(8.W))
  })

  val reg = RegInit(0.U(8.W))
  reg := io.a + io.b

  io.c := reg
}
class addition_layer() extends Module {
//   val io = IO(new Bundle {
//     val 
//   }
}
class FSR_128_N(ROUNDS: Int) extends Module {
  val io = IO(new Bundle {
    val state = Input(UInt(128.W))
    val key = Input(UInt(128.W))
    val state_out = Output(UInt(128.W))
  })
  val state_temp = Wire(Vec(ROUNDS + 1, UInt((128).W)))
  state_temp(0) := io.state
  for (i <- 1 until ROUNDS + 1) {
    val once = Module(new FSR_once())
    once.io.key := io.key((i - 1) % 128)
    once.io.state := state_temp(i - 1)
    state_temp(i) := once.io.state_out
  }
  io.state_out := state_temp(ROUNDS)
}
class FSR_once extends Module {
  val io = IO(new Bundle {
    val state = Input(UInt(128.W))
    val key = Input(UInt(1.W))
    val state_out = Output(UInt(128.W))
  })
  io.state_out := ((io.state(91) ^ (~(io.state(85) & io.state(70))) ^ io.state(
    47
  ) ^ io.state(0) ^ io.key) ## io.state(127, 1))
}
object AddMain extends App {
  println("Generating the adder hardware")
  emitVerilog(new Add(), Array("--target-dir", "generated"))
}
