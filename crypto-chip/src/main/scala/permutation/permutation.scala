package permutation

import chisel3._
import chisel3.util._
import layers._

class permutation_one extends Module {
  val io = IO(new Bundle {
    val round_in = Input(UInt(8.W))
    val x_in = Input(Vec(5, UInt(64.W)))
    val round_out = Output(UInt(8.W))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

  val addition = Module(new addition_layer())
  val substitution = Module(new substitution_layer())
  val diffusion = Module(new diffusion_layer())

  addition.io.round_in := io.round_in
  addition.io.x2_in := io.x_in(2)
  io.round_out := io.round_in + 1.U

  substitution.io.x_in(0) := io.x_in(0)
  substitution.io.x_in(1) := io.x_in(1)
  substitution.io.x_in(2) := addition.io.x2_out
  substitution.io.x_in(3) := io.x_in(3)
  substitution.io.x_in(4) := io.x_in(4)

  diffusion.io.x_in(0) := substitution.io.x_out(0)
  diffusion.io.x_in(1) := substitution.io.x_out(1)
  diffusion.io.x_in(2) := substitution.io.x_out(2)
  diffusion.io.x_in(3) := substitution.io.x_out(3)
  diffusion.io.x_in(4) := substitution.io.x_out(4)

  io.x_out(0) := diffusion.io.x_out(0)
  io.x_out(1) := diffusion.io.x_out(1)
  io.x_out(2) := diffusion.io.x_out(2)
  io.x_out(3) := diffusion.io.x_out(3)
  io.x_out(4) := diffusion.io.x_out(4)
}

class permutation_one_wrapper extends Module {
  val io = IO(new Bundle {
    val s_in = Input(UInt(320.W))
    val round = Input(UInt(4.W))
    val start = Input(Bool())
    val done = Output(Bool())
    val s_out = Output(UInt(320.W))
  })
  val x0_Reg = RegInit(0.U(64.W))
  val x1_Reg = RegInit(0.U(64.W))
  val x2_Reg = RegInit(0.U(64.W))
  val x3_Reg = RegInit(0.U(64.W))
  val x4_Reg = RegInit(0.U(64.W))
  val current_round = RegInit(0.U(8.W))
  val single_round = Module(new permutation_one())
  val run = RegInit(0.U(1.W))

  when(run === 0.U) {
    x0_Reg := io.s_in(319, 256)
    x1_Reg := io.s_in(255, 192)
    x2_Reg := io.s_in(191, 128)
    x3_Reg := io.s_in(127, 64)
    x4_Reg := io.s_in(63, 0)
    current_round := 12.U - io.round
    run := io.start
  }
    .elsewhen(run === 1.U) {
      x0_Reg := single_round.io.x_out(0)
      x1_Reg := single_round.io.x_out(1)
      x2_Reg := single_round.io.x_out(2)
      x3_Reg := single_round.io.x_out(3)
      x4_Reg := single_round.io.x_out(4)
      run := Mux(current_round === 10.U, 0.U, 1.U)
      current_round := single_round.io.round_out
    }

  single_round.io.round_in := current_round
  single_round.io.x_in(0) := x0_Reg
  single_round.io.x_in(1) := x1_Reg
  single_round.io.x_in(2) := x2_Reg
  single_round.io.x_in(3) := x3_Reg
  single_round.io.x_in(4) := x4_Reg

  io.s_out := Cat(
    single_round.io.x_out(0),
    single_round.io.x_out(1),
    single_round.io.x_out(2),
    single_round.io.x_out(3),
    single_round.io.x_out(4)
  )
  when(current_round === 11.U) {
    io.done := true.B
  }
    .otherwise {
      io.done := false.B
    }

}

class posedge() extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val out = Output(Bool())
  })
  // val temp_reg = Reg(UInt(1.W))
  val temp_reg = RegInit(0.U(1.W))
  temp_reg := io.in
  io.out := io.in & ~temp_reg
}
// edge detector shall be removed here to maintain compatibility with wrapper
// TODO: add multiple clock instantiation
class permutation_two extends Module {
  val io = IO(new Bundle {
    val clock_sub = Input(Clock())
    val clock_diff = Input(Clock())
    val start = Input(Bool())
    val round_in = Input(UInt(8.W))
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
    val done = Output(Bool())
    // val reg_temp = Output(UInt(4.W))
    // val reg_init = Output(UInt(25.W))
    // val clk = Input(Clock()) //CT
    // val rst = Input(Bool()) //CT
  })
  // val reg_temp = RegInit(2340956.U)
  // reg_temp := reg_temp + 1.U
  // io.reg_init := reg_temp
  val int_reset = Wire(Bool())
  val reset_init_state = RegInit(1.U)
  when(reset_init_state === 1.U) {
    int_reset := true.B
    reset_init_state := 0.U
  }
    .otherwise {
      int_reset := false.B
    }

  val addition = withClockAndReset(io.clock_sub, int_reset.asAsyncReset) {
    Module(new addition_layer())
  }
  // modules below are for async passing of data from input to output, going through substitution, then diffusion
  // after using these modules, this current module should be mostly combinational, like the asyncFIFOtest top module
  val async_out = Module(new async_io_out_vec_round(5, 64))
  val async_sub_in = withClockAndReset(io.clock_sub, int_reset.asAsyncReset) {
    Module(new async_io_in_vec(5, 64))
  }
  val async_sub_out = withClockAndReset(io.clock_sub, int_reset.asAsyncReset) {
    Module(new async_io_out_vec(5, 64))
  }
  val async_diff_in = withClockAndReset(io.clock_diff, int_reset.asAsyncReset) {
    Module(new async_io_in_vec(5, 64))
  }
  val async_diff_out =
    withClockAndReset(io.clock_diff, int_reset.asAsyncReset) {
      Module(new async_io_out_vec(5, 64))
    }
  val async_in = Module(new async_io_in_vec(5, 64))
  val substitution = withClockAndReset(io.clock_sub, int_reset.asAsyncReset) {
    Module(new substitution_layer_compat())
  }
  // io.reg_temp := substitution.io.reg_temp
  // setup control signals for substitution layer
  // valid should only be held for one cycle; this should be the case in the async module:
  // WARN: There's a chance that a new substitution layer will start before transferring through the async module - hence why decoupled io should be preferred. For now, the one using the module must check this properly
  substitution.io.start := async_sub_in.io.out.valid
  // unsure of line below but ready needs to be set
  // val sub_done = Module(new posedge())
  // sub_done.io.in := substitution.io.done

  async_sub_in.io.out.ready := true.B
  async_sub_out.io.in.valid := substitution.io.done

  // setup control signals for diffusion layer
  val diffusion = withClockAndReset(io.clock_diff, int_reset.asAsyncReset) {
    Module(new diffusion_layer_compat())
  }
  diffusion.io.start := async_diff_in.io.out.valid
  // unsure of line below but ready needs to be set
  // There's a big problem here also since the done signal is held true causing multiple async IO operations when there should only be one.
  // val diff_done = Module(new posedge())
  // diff_done.io.in := diffusion.io.done

  async_diff_in.io.out.ready := true.B
  async_diff_out.io.in.valid := diffusion.io.done

  // setup data transfer between layers
  // this is data going into the async
  async_out.io.in.bits(0) := io.x_in(0)
  async_out.io.in.bits(1) := io.x_in(1)
  async_out.io.in.bits(2) := io.x_in(2)
  async_out.io.in.bits(3) := io.x_in(3)
  async_out.io.in.bits(4) := io.x_in(4)
  // also add the round information
  // ideally round_in should be 4 bits since it wil only ever go up to 12. For now, put 0s at the top. If this is wrong, the max round will be 15, 7, 3, etc
  async_out.io.in_round := io.round_in(3,0)
  // connect to the substitution async module
  async_sub_in.io.in <> async_out.io.out

  // Q: for some reason, making the addition combinational to the substitution fixes the problem of the first round being incorrect
  // This is a small problem since it extends the critical path to include the substition and addition layers. The compat layer converts things to registers anyways, so it might have little impact
  // This might suggest that starting at the done state works weirdly; the state(2) assignment is not happening before the substitution layer starts as was previously assumed
  // Connect the addition data (bits(2) + round)
  addition.io.x2_in := async_out.io.out.bits(2)
  addition.io.round_in := async_out.io.out_round
  // Connect the substitution inputs
  substitution.io.x_in(0) := async_sub_in.io.out.bits(0)
  substitution.io.x_in(1) := async_sub_in.io.out.bits(1)
  substitution.io.x_in(2) := addition.io.x2_out
  substitution.io.x_in(3) := async_sub_in.io.out.bits(3)
  substitution.io.x_in(4) := async_sub_in.io.out.bits(4)
  // connect the output of substitution layer to the async module for output
  async_sub_out.io.in.bits := substitution.io.x_out
  // connect to the async diffusion layer module
  async_diff_in.io.in <> async_sub_out.io.out
  // connect the bits from substitution layer to diffusion
  diffusion.io.x_in := async_diff_in.io.out.bits
  // connect the output of diffusion to the async output module
  async_diff_out.io.in.bits := diffusion.io.x_out
  // connect the async diffusion output to the main async module
  async_in.io.in <> async_diff_out.io.out
  // connect the data from the main async module to output, along with done signal tied to valid (valid == done)
  io.x_out := async_in.io.out.bits
  io.done := async_in.io.out.valid

  // default assignment just in case
  async_out.io.in.valid := false.B
  async_in.io.out.ready := true.B

  // Note: when start is set to true, this assumes the output (x_out) has been read from so no valid signal on the decoupled output is checked and the ready signal is sent for one cycle to "dequeue" the async_in's output.

  when(io.start) {
    // remove data from output async, signal a valid input in the input async
    // WARN: might cause problems if there's no data to be read (but testing so far shows no problem reading when empty)
    async_out.io.in.valid := true.B
    async_in.io.out.ready := false.B
  }
    .otherwise {
      async_out.io.in.valid := false.B
      async_in.io.out.ready := true.B
    }
}

// TODO: fifo wrapper for permutation with pynq
class permutation_two_fifo_wrapper extends Module {
  val io = IO(new Bundle {
    val s_in = Flipped(DecoupledIO(UInt(32.W)))
    val start = Input(Bool())
    val round = Input(UInt(4.W))
    val done = Output(Bool())
    val s_out = (DecoupledIO(UInt(32.W)))
  })
}

// permutation wrapper
// maybe remove the compat layers for hashing with python
// TODO: maybe reduce number of states
class permutation_two_wrapper extends Module {
  val io = IO(new Bundle {
    val clock_sub = Input(Clock())
    val clock_diff = Input(Clock())
    val s_in = Input(UInt(320.W))
    val start = Input(Bool())
    val round = Input(UInt(4.W)) // total number of rounds to run
    val done = Output(Bool())
    val s_out = Output(UInt(320.W))
  })

  val x0_Reg = RegInit(10.U(64.W))
  val x1_Reg = RegInit(10.U(64.W))
  val x2_Reg = RegInit(10.U(64.W))
  val x3_Reg = RegInit(10.U(64.W))
  val x4_Reg = RegInit(10.U(64.W))
  val current_round = RegInit(10.U(8.W))

  val single_round = Module(new permutation_two())

  // default assignments here:
  single_round.io.clock_diff := io.clock_diff
  single_round.io.clock_sub := io.clock_sub
  single_round.io.x_in(0) := x0_Reg
  single_round.io.x_in(1) := x1_Reg
  single_round.io.x_in(2) := x2_Reg
  single_round.io.x_in(3) := x3_Reg
  single_round.io.x_in(4) := x4_Reg

  single_round.io.round_in := current_round
  single_round.io.start := false.B
  io.s_out := Cat(
    single_round.io.x_out(0),
    single_round.io.x_out(1),
    single_round.io.x_out(2),
    single_round.io.x_out(3),
    single_round.io.x_out(4)
  )

  val checkSingleDone :: checkRound :: startSingle :: done :: Nil = Enum(4)
  val currentState = RegInit(done)
  switch(currentState) {
    // start the permutation after a single cycle
    is(startSingle) {
      single_round.io.start := true.B
      currentState := checkSingleDone
    }
    // put the output back in the input, increment current number of rounds, go to checking rounds
    is(checkSingleDone) {
      when(single_round.io.done) {
        x0_Reg := single_round.io.x_out(0)
        x1_Reg := single_round.io.x_out(1)
        x2_Reg := single_round.io.x_out(2)
        x3_Reg := single_round.io.x_out(3)
        x4_Reg := single_round.io.x_out(4)
        current_round := current_round + 1.U
        currentState := checkRound
      }
        .otherwise {
          currentState := checkSingleDone
        }
    }
    // check if the current round has reached 11
    is(checkRound) {
      when(current_round < 12.U) {
        single_round.io.start := true.B
        currentState := checkSingleDone
      }
        .otherwise {
          currentState := done
        }
    }
    is(done) {
      // put in data, setup number of rounds to 12 - (max rounds). 12-12=0, 12-8=4, etc
      when(io.start) {
        current_round := 12.U - io.round
        // only init once here; other times will input from xn_reg
        x0_Reg := io.s_in(319, 256)
        x1_Reg := io.s_in(255, 192)
        x2_Reg := io.s_in(191, 128)
        x3_Reg := io.s_in(127, 64)
        x4_Reg := io.s_in(63, 0)
        currentState := startSingle
      }
        .otherwise {
          currentState := done
        }
    }
  }

  when(currentState === done) {
    io.done := true.B
  }
    .otherwise {
      io.done := false.B
    }
}

class permutation_two_wrapper_reduced_io extends Module {
  val io = IO(new Bundle {
    val clock_sub = Input(Clock())
    val clock_diff = Input(Clock())
    val round = Input(UInt(4.W)) // total number of rounds to run
    val s_in = Input(UInt(64.W))
    val write = Input(Bool())
    val done = Output(Bool())
    val read = Input(Bool())
    val s_out = Output(UInt(64.W))
  })
  // val reset_int = Wire(false.B)
  val permutation_w = Module(new permutation_two_wrapper())
  permutation_w.io.clock_diff := io.clock_diff
  permutation_w.io.clock_sub := io.clock_sub

  // start is set automatically once all 5 64 bit values are written
  // permutation_w.io.start := io.start
  io.done := permutation_w.io.done
  permutation_w.io.round := io.round
  permutation_w.io.start := false.B
  val write_counter = RegInit(0.U(3.W))
  val read_counter = RegInit(0.U(3.W))
  // feels like a waste of registers when the permutation's input when starting will be registered anyways
  val tempin = RegInit(VecInit(Seq.fill(5)(10.U(64.W))))
  // not sure if this conversion from vec to wire will work
  permutation_w.io.s_in := tempin.asUInt
  // assumes output will not change when done; saves 320 registers
  val tempout = VecInit(Seq.fill(5)(10.U(64.W)))
  for (t <- 0 until 5) {
    tempout(t) := permutation_w.io.s_out(((t + 1) * 64) - 1, t * 64)
  }
  val edge_read = Module(new posedge())
  edge_read.io.in := io.read
  val edge_write = Module(new posedge())
  edge_write.io.in := io.write
  val start_reg = RegInit(false.B)
  permutation_w.io.start := start_reg
  // tempout := permutation_w.io.s_out(0) ## permutation_w.io.s_out(1) ## permutation_w.io.s_out(2) ## permutation_w.io.s_out(3) ## permutation_w.io.s_out(4)
  // read and write should only be used once data has been fully registered to "dequeue" and get the next output/input. The values are available even before the write/read signals
  // in short, to write, give data first, then give signal; to read, get data first, then give signal
  // the module outside should check if the permutation is done before writing or data will be written and will restart the process when the number of writes = 6
  // optimization: can make write work on both edges to reduce IO operations
  // additional note: write should only be held for one cycle, so either add an edge detector in here or outside
  // An edge detector was added to both read and write to solve this problem
  // permutation_w.io.start := start_reg
  when(edge_write.io.out) {
    tempin(4.U - write_counter) := io.s_in
    when(write_counter > 3.U) {
      write_counter := 0.U
      tempin(write_counter + 1.U) := io.s_in
      start_reg := true.B
      // permutation_w.io.start := true.B
    }
      .otherwise {
        write_counter := write_counter + 1.U
      }
  }
    .otherwise {
      start_reg := false.B
    }

  // when (write_counter > 4.U) {
  //   start_reg := true.B
  // }
  // .otherwise {
  //   start_reg := false.B
  // }
  when(edge_read.io.out) {
    when(read_counter >= 4.U) {
      read_counter := 0.U
    }
      .otherwise {
        read_counter := read_counter + 1.U
      }
  }
  io.s_out := tempout((4.U - read_counter))
  // // simple reset init
  // val init_state = RegInit(1.U)
  // when(init_state === 1.U) {
  //   init_state := 0.U
  //   reset_int := true.B
  // }
}

class permutation_three extends Module {
  val io = IO(new Bundle {
    val round_in = Input(UInt(8.W))
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

  val addition = Module(new addition_layer())
  val substitution = Module(new substitution_layer())
  val diffusion = Module(new diffusion_layer())
  val addition_reg = Reg(Vec(5, UInt(64.W)))
  val substitution_reg = Reg(Vec(5, UInt(64.W)))

  addition.io.round_in := io.round_in
  addition.io.x2_in := io.x_in(2)

  addition_reg(0) := io.x_in(0)
  addition_reg(1) := io.x_in(1)
  addition_reg(2) := addition.io.x2_out
  addition_reg(3) := io.x_in(3)
  addition_reg(4) := io.x_in(4)

  substitution.io.x_in(0) := addition_reg(0)
  substitution.io.x_in(1) := addition_reg(1)
  substitution.io.x_in(2) := addition_reg(2)
  substitution.io.x_in(3) := addition_reg(3)
  substitution.io.x_in(4) := addition_reg(4)

  substitution_reg(0) := substitution.io.x_out(0)
  substitution_reg(1) := substitution.io.x_out(1)
  substitution_reg(2) := substitution.io.x_out(2)
  substitution_reg(3) := substitution.io.x_out(3)
  substitution_reg(4) := substitution.io.x_out(4)

  diffusion.io.x_in(0) := substitution_reg(0)
  diffusion.io.x_in(1) := substitution_reg(1)
  diffusion.io.x_in(2) := substitution_reg(2)
  diffusion.io.x_in(3) := substitution_reg(3)
  diffusion.io.x_in(4) := substitution_reg(4)

  io.x_out(0) := diffusion.io.x_out(0)
  io.x_out(1) := diffusion.io.x_out(1)
  io.x_out(2) := diffusion.io.x_out(2)
  io.x_out(3) := diffusion.io.x_out(3)
  io.x_out(4) := diffusion.io.x_out(4)
}

class permutation_three_wrapper extends Module {
  val io = IO(new Bundle {
    val s_in = Input(UInt(320.W))
    val start = Input(Bool())
    val round = Input(UInt(4.W))
    val done = Output(Bool())
    val s_out = Output(UInt(320.W))
  })
  val x0_Reg = RegInit(0.U(64.W))
  val x1_Reg = RegInit(0.U(64.W))
  val x2_Reg = RegInit(0.U(64.W))
  val x3_Reg = RegInit(0.U(64.W))
  val x4_Reg = RegInit(0.U(64.W))
  val current_round = RegInit(0.U(8.W))
  val single_round = Module(new permutation_three())
  val run = RegInit(0.U(1.W))
  val counter = RegInit(0.U(2.W))

  when(run === 0.U) {
    x0_Reg := io.s_in(319, 256)
    x1_Reg := io.s_in(255, 192)
    x2_Reg := io.s_in(191, 128)
    x3_Reg := io.s_in(127, 64)
    x4_Reg := io.s_in(63, 0)
    current_round := 12.U - io.round
    run := io.start
  }
    .elsewhen(run === 1.U) {
      x0_Reg := single_round.io.x_out(0)
      x1_Reg := single_round.io.x_out(1)
      x2_Reg := single_round.io.x_out(2)
      x3_Reg := single_round.io.x_out(3)
      x4_Reg := single_round.io.x_out(4)
      run := Mux(current_round === 11.U && counter === 1.U, 0.U, 1.U)
    }

  single_round.io.round_in := current_round
  single_round.io.x_in(0) := x0_Reg
  single_round.io.x_in(1) := x1_Reg
  single_round.io.x_in(2) := x2_Reg
  single_round.io.x_in(3) := x3_Reg
  single_round.io.x_in(4) := x4_Reg

  when(run === 1.U) {
    when(counter === 2.U) {
      current_round := current_round + 1.U
      counter := 0.U
    }
      .otherwise {
        counter := counter + 1.U
      }
  }

  when(current_round === 11.U && counter === 2.U) {
    counter := 0.U
    io.done := true.B
    io.s_out := Cat(
      single_round.io.x_out(0),
      single_round.io.x_out(1),
      single_round.io.x_out(2),
      single_round.io.x_out(3),
      single_round.io.x_out(4)
    )
  }
    .otherwise {
      io.done := false.B;
      io.s_out := Cat(
        single_round.io.x_out(0),
        single_round.io.x_out(1),
        single_round.io.x_out(2),
        single_round.io.x_out(3),
        single_round.io.x_out(4)
      )
    }

}
