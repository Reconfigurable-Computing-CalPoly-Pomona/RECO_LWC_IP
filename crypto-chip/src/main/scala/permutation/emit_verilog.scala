package permutationEmit
import chisel3._
import chisel3.util._
import permutation._
import layers._
import ascon._

object permutationMain extends App {
  println("generating verilog")
  emitVerilog(new romTest(), Array("--target-dir", "generated")) // Vivado 2022.2: 48 LUT, 26 FF, 5.828ns Total Delay
  emitVerilog(new addition_layer(), Array("--target-dir", "generated")) // Vivado 2021.2: 4 LUT, 0 FF, 5.361ns Total Delay
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter(6), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_seq(6), Array("--target-dir", "generated"))
  emitVerilog(new rotateRight, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_single, Array("--target-dir", "generated"))
  emitVerilog(new diffusion_fifo(5), Array("--target-dir", "generated"))
  emitVerilog(new diffusion_layer_compat(), Array("--target-dir", "generated")) // Vivado 2021.2: 608 LUT, 623 FF, 4.090ns Total Delay
  emitVerilog(new permutation_two_wrapper(), Array("--target-dir", "generated")) // Vivado 2022.2: 963 LUT, 108 LUTRAM, 1636 FF, .5 BRAM, 4.749ns Total Delay
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated"))
  emitVerilog(new single_diff_pipe(), Array("--target-dir", "generated")) // Vivado 2021.2: 262 LUT, 266 FF, 4.691ns Total Delay
  emitVerilog(new barrelShifter_seq_param(6), Array("--target-dir", "generated"))
  emitVerilog(new barrelShifter_2reg(), Array("--target-dir", "generated")) // Vivado 2021.2: 192 LUT, 128 FF, 4.090ns Total Delay
  emitVerilog(new double_pipe_diff(), Array("--target-dir", "generated"))
  emitVerilog(new ascon(), Array("--target-dir", "generated")) // Vivado 2022.2: 1853 LUT, 108 LUTRAM, 2350 FF, .5 BRAM, 7.775ns Total Delay
  emitVerilog(new diffusion_layer(), Array("--target-dir", "generated")) // Vivado 2022.2: 169 LUT, 0 FF, 5.361ns Total Delay
  // emitVerilog(new substitute_lookup_table(), Array("--target-dir", "generated")) // Vivado 2021.2 Verilog ROM: 0.5 BRAM, 5.890ns Total Delay
  emitVerilog(new substitution_fifo(), Array("--target-dir", "generated")) // Vivado 2022.2: 43 LUT, 16 LUTRAM, 26 FF, .5 BRAM, 5.828ns Total Delay
  emitVerilog(new substitution_layer(), Array("--target-dir", "generated")) // Vivado 2022.2: 192 LUT, 0 FF, 5.361ns Total Delay
  emitVerilog(new substitution_layer_compat(), Array("--target-dir", "generated")) // Vivado 2022.2: 142 LUT, 16 LUTRAM, 360 FF, .5 BRAM, 4.090ns Total Delay
  emitVerilog(new muxTest(), Array("--target-dir", "generated")) // Vivado 2022.2: 142 LUT, 16 LUTRAM, 360 FF, .5 BRAM, 4.090ns Total Delay
  emitVerilog(new fifo_one(1), Array("--target-dir", "generated"))
  emitVerilog(new fifo_two(1), Array("--target-dir", "generated"))
  emitVerilog(new top(1), Array("--target-dir", "generated"))
  emitVerilog(new async_io_in(1), Array("--target-dir", "generated"))
  emitVerilog(new async_io_out(1), Array("--target-dir", "generated"))


}
