package permutation

import chisel3._
import chisel3.util._
import layers._


class permutation_one extends Module {
  val io = IO(new Bundle {
    val round_in        = Input(UInt(8.W))
    val x_in        = Input(Vec(5, UInt(64.W)))
    val round_out = Output(UInt(8.W))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

    val addition = Module(new addition_layer())
    val substitution = Module(new substitution_layer())
    val diffusion= Module(new diffusion_layer())

    addition.io.round_in := io.round_in
    addition.io.x2_in := io.x_in(2)
    io.round_out :=  io.round_in + 1.U

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
    val s_in        = Input(UInt(320.W))
    val round        = Input(UInt(4.W))
    val start        = Input(Bool())
    val done        = Output(Bool())
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


    when (run === 0.U) {
      x0_Reg := io.s_in(319,256)
      x1_Reg := io.s_in(255,192)
      x2_Reg := io.s_in(191,128)
      x3_Reg := io.s_in(127,64)
      x4_Reg := io.s_in(63,0)
      current_round := 12.U - io.round
      run := io.start
    }
    .elsewhen (run === 1.U) {
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


    io.s_out := Cat(single_round.io.x_out(0), single_round.io.x_out(1), single_round.io.x_out(2), single_round.io.x_out(3), single_round.io.x_out(4))
    when (current_round === 11.U) {
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
class permutation_two extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val round_in        = Input(UInt(8.W))
    val x_in        = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
    val done = Output(Bool())
    // val clk = Input(Clock()) //CT
    // val rst = Input(Bool()) //CT
  })

    val addition = Module(new addition_layer())
    val substitution = Module(new substitution_layer_compat())
    val diffusion= Module(new diffusion_layer_compat())
    // val posedge = Module(new posedge())
    // posedge.io.in := io.start
    val start::add::sub::diff::done::Nil = Enum(5)
    val current = RegInit(done)
    // val state = VecInit(Seq.fill(5)(RegInit(0.U(64.W))))
    // val state = Wire(Vec(5, UInt (64.W)))
    val state = RegInit(VecInit(Seq.fill(5)(10.U(64.W))))
    addition.io.x2_in := io.x_in(2)
    addition.io.round_in := io.round_in
    substitution.io.x_in(0) := io.x_in(0)
    substitution.io.x_in(1) := io.x_in(1)
    // Q: for some reason, making the addition combinational to the substitution fixes the problem of the first round being incorrect
      // This is a small problem since it extends the critical path to include the substition and addition layers. The compat layer converts things to registers anyways, so it might have little impact
      // This might suggest that starting at the done state works weirdly; the state(2) assignment is not happening before the substitution layer starts as was previously assumed
    substitution.io.x_in(2) := addition.io.x2_out
    substitution.io.x_in(3) := io.x_in(3)
    substitution.io.x_in(4) := io.x_in(4)
    diffusion.io.x_in(0) := state(0) 
    diffusion.io.x_in(1) := state(1) 
    diffusion.io.x_in(2) := state(2) 
    diffusion.io.x_in(3) := state(3) 
    diffusion.io.x_in(4) := state(4) 
    
    diffusion.io.start := false.B
    substitution.io.start := false.B
  
    switch (current){
      // start the state machine
      // is(start){
      //   //io.done := false.B
      //   current := add
      // }
      // is(add){
        
      //   current := sub
      // }
      is(sub){
        when (substitution.io.done) {
          diffusion.io.start := true.B
          state := substitution.io.x_out
          // current := tempdiff
          current := diff
        }
        .otherwise {
          current := sub
        }
        // state := (substitution.io.x_out)
        // sub_state := state
        
        
      }
      // is(tempdiff) {
      //   diffusion.io.start := true.B
      //   current := diff
      // }
      is(diff){
        when (diffusion.io.done) {
          // state := diffusion.io.x_out
          current := done
        }.otherwise {
          current := diff
        }
      }
      is(done){
        when (io.start) {
          // state(2) := addition.io.x2_out
          substitution.io.start := true.B
          current := sub
        }.otherwise {
          current := done
        }
      }
    }
    
    when (current === done) {
      io.done := true.B
    } .otherwise {
      io.done := false.B
    }
    
    io.x_out := diffusion.io.x_out
    // io.x_out := state
}

// TODO: fifo wrapper for permutation with pynq
class permutation_two_fifo_wrapper extends Module {
  val io = IO(new Bundle {
    val s_in = Flipped(DecoupledIO(UInt(32.W)))
    val start        = Input(Bool())
    val round        = Input(UInt(4.W))
    val done        = Output(Bool())
    val s_out = (DecoupledIO(UInt(32.W)))
  })
}

// permutation wrapper
// maybe remove the compat layers for hashing with python
// TODO: maybe reduce number of states 
class permutation_two_wrapper extends Module {
  val io = IO(new Bundle {
    val s_in        = Input(UInt(320.W))
    val start        = Input(Bool())
    val round        = Input(UInt(4.W)) // total number of rounds to run
    val done        = Output(Bool())
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
  single_round.io.x_in(0) := x0_Reg
  single_round.io.x_in(1) := x1_Reg
  single_round.io.x_in(2) := x2_Reg
  single_round.io.x_in(3) := x3_Reg
  single_round.io.x_in(4) := x4_Reg

  single_round.io.round_in := current_round
  single_round.io.start := false.B
  io.s_out := Cat(single_round.io.x_out(0), single_round.io.x_out(1), single_round.io.x_out(2), single_round.io.x_out(3), single_round.io.x_out(4))
  
  val checkSingleDone::checkRound::startSingle::done::Nil = Enum(4)
  val currentState = RegInit(done)
  switch (currentState) {
    // start the permutation after a single cycle
    is (startSingle) {
      single_round.io.start := true.B
      currentState := checkSingleDone
    }
    // put the output back in the input, increment current number of rounds, go to checking rounds  
    is (checkSingleDone) {
      when (single_round.io.done) {
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
    is (checkRound) {
      when (current_round < 12.U) {
        single_round.io.start := true.B
        currentState := checkSingleDone
      }
      .otherwise {
        currentState := done
      }
    }
    is (done) {
      // put in data, setup number of rounds to 12 - (max rounds). 12-12=0, 12-8=4, etc
      when (io.start) {
        current_round := 12.U - io.round
        // only init once here; other times will input from xn_reg
        x0_Reg := io.s_in(319,256)
        x1_Reg := io.s_in(255,192)
        x2_Reg := io.s_in(191,128)
        x3_Reg := io.s_in(127,64)
        x4_Reg := io.s_in(63,0)
        currentState := startSingle
      }
      .otherwise {
        currentState := done
      }
    }
  }
  
  when (currentState === done) {
    io.done := true.B
  }
  .otherwise {
    io.done := false.B
  }
  // //Initialize
  // when (run === 0.U) {
  //   x0_Reg := io.s_in(319,256)
  //   x1_Reg := io.s_in(255,192)
  //   x2_Reg := io.s_in(191,128)
  //   x3_Reg := io.s_in(127,64)
  //   x4_Reg := io.s_in(63,0)
  //   current_round := 12.U - io.round
  //   run := io.start
  // }//Starts; turns off run when current_round is 11
  // .elsewhen (run === 1.U) {
  //   run := Mux(current_round === 11.U, 0.U, 1.U)
  // }
  // // might hold invalid data at start
  // when (single_round.io.done) {
  //   x0_Reg := single_round.io.x_out(0)
  //   x1_Reg := single_round.io.x_out(1)
  //   x2_Reg := single_round.io.x_out(2)
  //   x3_Reg := single_round.io.x_out(3)
  //   x4_Reg := single_round.io.x_out(4)
  // } 
  // single_round.io.start := run.asBool
  // single_round.io.round_in := current_round


  // io.s_out := Cat(single_round.io.x_out(0), single_round.io.x_out(1), single_round.io.x_out(2), single_round.io.x_out(3), single_round.io.x_out(4))

  // when (run === 1.U && single_round.io.done === true.B) {
  //   current_round := current_round + 1.U
  // }


  // when (io.maxRound === 0.U) {
  //   maxRound := 6.U
  // }
  // .elsewhen (io.maxRound === 1.U) {
  //   maxRound := 8.U
  // }
  // .elsewhen (io.maxRound === 2.U) {
  //   maxRound := 12.U
  // }
  // .otherwise {
  //   // set unique round number to indicate invalid maxRound
  //   maxRound := 0.U
  // }
}

class permutation_three extends Module {
  val io = IO(new Bundle {
    val round_in        = Input(UInt(8.W))
    val x_in        = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

    val addition = Module(new addition_layer())
    val substitution = Module(new substitution_layer())
    val diffusion= Module(new diffusion_layer())
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
    val s_in        = Input(UInt(320.W))
    val start        = Input(Bool())
    val round        = Input(UInt(4.W))
    val done        = Output(Bool())
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

    when (run === 0.U) {
      x0_Reg := io.s_in(319,256)
      x1_Reg := io.s_in(255,192)
      x2_Reg := io.s_in(191,128)
      x3_Reg := io.s_in(127,64)
      x4_Reg := io.s_in(63,0)
      current_round := 12.U - io.round
      run := io.start
    }
    .elsewhen (run === 1.U) {
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


    when (run === 1.U) {
        when (counter === 2.U) {
          current_round := current_round + 1.U
          counter := 0.U
        }
        .otherwise{
          counter := counter + 1.U
        }
    }


    when (current_round === 11.U && counter === 2.U) {
      counter := 0.U
      io.done := true.B
      io.s_out := Cat(single_round.io.x_out(0), single_round.io.x_out(1), single_round.io.x_out(2), single_round.io.x_out(3), single_round.io.x_out(4))
    }
    .otherwise {
      io.done := false.B;
      io.s_out := Cat(single_round.io.x_out(0), single_round.io.x_out(1), single_round.io.x_out(2), single_round.io.x_out(3), single_round.io.x_out(4))
    }
  
}
