package permutationEmit
import chisel3._
import chisel3.util._
import permutation._
import layers._
import ascon._

object permutationMain extends App {
  println("generating verilog")
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated"))
  emitVerilog(new addition_layer(), Array("--target-dir", "generated"))
  emitVerilog(new substitution_layer(), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter(6), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_seq(6), Array("--target-dir", "generated"))
  emitVerilog(new rotateRight, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_single, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_fifo(5), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_compat(), Array("--target-dir", "generated"))
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new single_diff_pipe(), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_seq_param(6), Array("--target-dir", "generated"))
  emitVerilog(new double_pipe_diff(), Array("--target-dir", "generated"))
  emitVerilog(new ascon(), Array("--target-dir", "generated"))
  // emitVerilog(new xor_test, Array("--target-dir", "generated"))
  
}
