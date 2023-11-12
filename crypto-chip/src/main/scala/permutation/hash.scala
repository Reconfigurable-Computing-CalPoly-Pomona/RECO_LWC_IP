package hash

import chisel3._
import chisel3.util._
import ascon._
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource


class hash(numberOfHashModules: Int = 2) extends Module {
    val inputSize = 128
    val io = IO(new Bundle {
        val choice = Input(UInt((numberOfHashModules - 1).W))
        val plaintext = Input(UInt(inputSize.W))
        val insert_text = Input(Bool())
        val output = Output(UInt(512.W))
        val output_ready = Output(Bool())
    })
    val sha3 = Module(new keccak)
    val ascon = Module(new ascon)
    val default_io = 0
    val default_bool = false.B
    // default assignments for the other unused switch cases
    // inputs here
    sha3.io.in_ready := default_bool
    ascon.io.push := default_bool
    sha3.io.in := default_io.U
    ascon.io.message := default_io.U

    // outputs here
    io.output := default_io.U
    io.output_ready := default_bool


    // default connections required to work
    sha3.io.clk := Clock()
    sha3.io.reset := Reset()

    // probably need to provide default values to the modules

    // assign input based on choice; should look like a mux for various signals
        // not sure if it's more efficient to try assigning both to one input
            // possibly less switching to other modules is beneficial to gate
    switch (io.choice) {
        is (0.U) {
            sha3.io.in := io.plaintext(31,0)
            sha3.io.in_ready := io.insert_text
            io.output := sha3.io.out
        }
        is (1.U) {
            ascon.io.message := io.plaintext(127,0)
            ascon.io.push := io.insert_text
            io.output := io.output(511, 128) ## ascon.io.cipher
        }
    }
}
// out_ready is a reg, but not sure if that's possible
class keccak extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
        val clk = Input(Clock())
        val reset = Input(Reset())
        val in = Input(UInt(32.W))
        val in_ready = Input(Bool())
        val is_last = Input(Bool())
        val byte_num = Input(UInt(2.W))
        val buffer_full = Output(Bool())
        val out = Output(UInt(512.W))
        val out_ready = Output(Reg(Bool()))
    })
    // also include f_permutation.v, keccak.v, padder.v, padder1.v, rconst.v, round.v after generating
    addResource("keccak.v")
}