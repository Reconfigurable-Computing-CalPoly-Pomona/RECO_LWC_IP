package permutationEmit
import chisel3._
import chisel3.util._
import permutation._
import layers._
import ascon._

object permutationMain extends App {
  println("generating verilog")
  emitVerilog(new substitution_fifo(), Array("--target-dir", "generated")) // Vivado 2022.2: 48 LUT, 26 FF, 5.828ns Total Delay
  emitVerilog(new addition_layer(), Array("--target-dir", "generated")) // Vivado 2021.2: 4 LUT, 0 FF, 5.361ns Total Delay
  emitVerilog(new substitution_layer(), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter(6), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_seq(6), Array("--target-dir", "generated"))
  emitVerilog(new rotateRight, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_single, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_fifo(5), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_compat(), Array("--target-dir", "generated")) // Vivado 2021.2: 608 LUT, 623 FF, 4.090ns Total Delay
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated")) // Vivado 2018.1: (SYNTHESIS ONLY) 1137 LUT, 1642 FF, 4.741ns Total Delay
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new single_diff_pipe(), Array("--target-dir", "generated")) // Vivado 2021.2: 262 LUT, 266 FF, 4.691ns Total Delay
  emitVerilog(new barrelShifter_seq_param(6), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_2reg(), Array("--target-dir", "generated")) // Vivado 2021.2: 192 LUT, 128 FF, 4.090ns Total Delay
  emitVerilog(new double_pipe_diff(), Array("--target-dir", "generated"))
  emitVerilog(new ascon(), Array("--target-dir", "generated")) // Original (Vivado 2022.2): 1397 LUT, 1367 FF, 7.775ns Total Delay (5.361ns Message to Cipher)
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated")) // Vivado 2022.2: 169 LUT, 0 FF, 5.361ns Total Delay
  emitVerilog(new substitute_lookup_table(), Array("--target-dir", "generated")) // Vivado 2022.2: 3 LUT, 5.361ns Total Delay   Vivado 2021.2 Verilog ROM: 0.5 BRAM, 5.890ns Total Delay
  emitVerilog(new substitution_fifo(), Array("--target-dir", "generated")) // Vivado 2022.2: 48 LUT, 26 FF, 5.828ns Total Delay   Vivado 2021.2 48 LUT, 26 FF, 4.090ns Total Delay
  emitVerilog(new substitution_layer(), Array("--target-dir", "generated")) 
  emitVerilog(new substitution_layer_compat(), Array("--target-dir", "generated")) // Vivado 2021.2: 147 LUT, 360 FF, 4.090ns Total Delay
}
