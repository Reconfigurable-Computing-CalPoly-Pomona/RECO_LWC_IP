package permutationMain
import chisel3._
import chisel3.util._
import permutation._

object permutationEmit extends App {
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated"))
}