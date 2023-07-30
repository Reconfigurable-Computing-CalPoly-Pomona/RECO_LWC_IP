package permutationEmit
import chisel3._
import chisel3.util._
import permutation._

object permutationMain extends App {
  println("generating verilog")
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated"))
}
