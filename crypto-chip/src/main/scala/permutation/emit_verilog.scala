package permutationEmit
import chisel3._
import chisel3.util._
import permutation._
import layers._

object permutationMain extends App {
  println("generating verilog")
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated"))
  emitVerilog(new addition_layer(), Array("--target-dir", "generated"))
  emitVerilog(new substitution_layer(), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter(), Array("--target-dir", "generated"))
}
