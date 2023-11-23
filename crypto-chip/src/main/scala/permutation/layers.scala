package layers

import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource
import _root_.permutation.posedge
// import chiseltest.formal._
// TODO: all ready signals should be used properly; use like a mutex

// This is a combinational circuit, performing constant xor with 5 bits of the input based on round number.
//  The equation for this operation should be x2(8,0) = x2(8,0) ^ lut(round)
class addition_layer extends Module {
  val io = IO(new Bundle {
    val round_in = Input(UInt(8.W))
    val x2_in = Input(UInt(64.W))
    val x2_out = Output(UInt(64.W))
  })

  // Combinational
  val array = Wire(Vec(12, UInt(64.W)))
  array(0) := "hf0".U
  array(1) := "he1".U
  array(2) := "hd2".U
  array(3) := "hc3".U
  array(4) := "hb4".U
  array(5) := "ha5".U
  array(6) := "h96".U
  array(7) := "h87".U
  array(8) := "h78".U
  array(9) := "h69".U
  array(10) := "h5a".U
  array(11) := "h4b".U

  io.x2_out := io.x2_in ^ array(io.round_in)
}
// Optimization notes: can reduce the fifo depth since it is unlikely to become completely full
  // also possibly remove the delay on the input since the data is already ready at the output of the input fifo
// TODO: check the output_queue valid signal - it might not be set correctly but it might not matter inside the module
class substitution_fifo extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(5.W)))
    val out = Decoupled(UInt(5.W))
  })
  val input_queue = Module(new Queue(UInt(5.W), 64))
  val output_queue = Module(new Queue(UInt(5.W), 64))
  val rom = Module(new substitute_lookup_table())
  // external connections
  input_queue.io.enq <> io.in
  io.out <> output_queue.io.deq

  // io.out.bits := output_queue.io.deq.bits
  // output_queue.io.deq.valid := io.out.valid

  // when (io.out.ready) {
  //   output_queue.io.deq.valid := false.B
  // }
  // .otherwise {
  //   output_queue.io.deq.valid := true.B
  // }
  // internal connections
  rom.io.in := input_queue.io.deq.bits
  output_queue.io.enq.bits := rom.io.out
  rom.io.clk := clock

  val delay = RegInit(false.B)
  output_queue.io.enq.valid := delay
  when(input_queue.io.deq.valid) {
    input_queue.io.deq.ready := true.B
    delay := true.B
  }
    .otherwise {
      input_queue.io.deq.ready := false.B
      delay := false.B
    }
}
// in(0) is MSB, x(4) is LSB
class convert_to_5_bit extends Module {
  val io = IO(new Bundle {
    val counter = Input(UInt(6.W))
    val in = Input(Vec(5, UInt(64.W)))
    val out = Output(UInt(5.W))
  })
  io.out := io.in(0)(io.counter) ## io.in(1)(io.counter) ## io.in(2)(
    io.counter
  ) ## io.in(3)(io.counter) ## io.in(4)(io.counter)
  // for (i <- 0 until 5) {
  //   io.out(i) := io.in(io.counter)(i)
  // }
}
class convert_from_5_bit extends Module {
  val io = IO(new Bundle {
    val write = Input(Bool())
    val in = Input(UInt(5.W))
    val out = Output(Vec(5, UInt(64.W)))
  })
  val temp = RegInit(VecInit(Seq.fill(5)(2.U(64.W))))
  // // split into 5, 1 bit values
  // val temp = Vec(5,UInt(1.W))
  // for (i <- 0 until 5) {
  //   temp(i) := io.in(i)
  // }
  // assign the temp vector to output by shifting one bit
  // Q: Why does the temp assignment need to be switched (instead of temp(0), then temp(1), it starts at temp(4)). A: The x values seem to be switched in which is first and last, which 4 being first and 0 being last. This also applies to the substitution where 0 is MSB, 4 is LSB and the LSB starts first
  when(io.write === true.B) {
    for (i <- 0 until 5) {
      temp(4 - i) := (io.in(i)) ## (temp(4 - i)(63, 1))
      // temp(i) := (temp(i)(62, 0)) ## io.in(i)
      // (io.out(i) << 1.U) | temp(i)
    }
  }
  io.out := temp
}
// optimization notes: try reducing the counter bit sizes by starting the io at cycle 0 or cycle 63
class substitution_layer_compat extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
    val done = Output(Bool())
  })
  val lut = Module(new substitution_fifo())
  val counter_in = RegInit(0.U(6.W))
  val counter_out = RegInit(0.U(6.W))
  val to_5 = Module(new convert_to_5_bit())
  to_5.io.counter := counter_in
  val from_5 = Module(new convert_from_5_bit())
  from_5.io.write := false.B

  to_5.io.in := io.x_in
  lut.io.in.bits := to_5.io.out
  from_5.io.in := lut.io.out.bits
  io.x_out := from_5.io.out

  lut.io.in.valid := false.B
  lut.io.out.ready := false.B
  io.done := false.B
  // make sure not to hold start signal; should be handled by state machine
  when(io.start === true.B) {
    counter_in := 0.U
    counter_out := 0.U
  
    when(lut.io.in.ready) {
      lut.io.in.valid := true.B
    }
    when(lut.io.out.valid) {
      lut.io.out.ready := true.B
      from_5.io.write := true.B
    }
  }
  // might only do 63 bits and not 64; Confirmed and fixed by increasing size of counters
  when(counter_in < 63.U) {
    when(lut.io.in.ready) {
      counter_in := counter_in + 1.U
      lut.io.in.valid := true.B
    }
  }
  when(counter_out < 63.U) {
    io.done := false.B
    when(lut.io.out.valid) {
      counter_out := counter_out + 1.U
      lut.io.out.ready := true.B
      from_5.io.write := true.B
    }
  }
  .otherwise {
    io.done := true.B
  }
}
// just a testing module to setup a rom in chisel; doesn't work to create a rom based on bram, for example
class romTest extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(SInt(32.W))
  })
  val Pi = math.Pi
  def sinTable(amp: Double, n: Int) = {
    val times =
      (0 until n).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi)
    val inits =
      times.map(t => Math.round(amp * math.sin(t)).asSInt(32.W))
    VecInit(inits)
  }
  val r = sinTable(1, 10)
  io.out := r(io.in)
}
// look into RTL_ROM implementation on FPGA
class muxTest extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val in = Input(UInt(5.W))
    val out = Output(UInt(5.W))
  })
  io.out := 0.U
  switch (io.in) {
    is (0.U) {
      io.out := "h4".U
    }
    is (1.U) {
      io.out := "hb".U
    }
    is (2.U) {
      io.out := "h1f".U
    }
    is (3.U) {
      io.out := "h14".U
    }
    is (4.U) {
      io.out := "h1a".U
    }
    is (5.U) {
      io.out := "h15".U
    }
    is (6.U) {
      io.out := "h9".U
    }
    is (7.U) {
      io.out := "h2".U
    }
    is (8.U) {
      io.out := "h1b".U
    }
    is (9.U) {
      io.out := "h5".U
    }
    is (10.U) {
      io.out := "h8".U
    }
    is (11.U) {
      io.out := "h12".U
    }
    is (12.U) {
      io.out := "h1d".U
    }
    is (13.U) {
      io.out := "h3".U
    }
    is (14.U) {
      io.out := "h6".U
    }
    is (15.U) {
      io.out := "h1c".U
    }
    is (16.U) {
      io.out := "h1e".U
    }
    is (17.U) {
      io.out := "h13".U
    }
    is (18.U) {
      io.out := "h7".U
    }
    is (19.U) {
      io.out := "he".U
    }
    is (20.U) {
      io.out := "h0".U
    }
    is (21.U) {
      io.out := "hd".U
    }
    is (22.U) {
      io.out := "h11".U
    }
    is (23.U) {
      io.out := "h18".U
    }
    is (24.U) {
      io.out := "h10".U
    }
    is (25.U) {
      io.out := "hc".U
    }
    is (26.U) {
      io.out := "h1".U
    }
    is (27.U) {
      io.out := "h19".U
    }
    is (28.U) {
      io.out := "h16".U
    }
    is (29.U) {
      io.out := "ha".U
    }
    is (30.U) {
      io.out := "hf".U
    }
    is (31.U) {
      io.out := "h17".U
    }
  }
}

// This performs a substitution, converting the input to the output based on the input.
// The lookup table to convert has an equation, however it is not given in the spec. A diagram is given instead, which is more complicated.
// The lookup table operation looks like this: out = lut(in)
// look into RTL_ROM implementation on FPGA
class substitute_lookup_table extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val in = Input(UInt(5.W))
    val out = Output(UInt(5.W))
  })
  addResource("substitute_lookup_table.v")
}

// This is the original substitution layer, performing all 64 substitutions combinationally with a lookup table
class substitution_layer extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })
  val array = Wire(Vec(32, UInt(5.W)))
  val temp = Wire(Vec(64, UInt(5.W)))
  array(0) := "h4".U
  array(1) := "hb".U
  array(2) := "h1f".U
  array(3) := "h14".U
  array(4) := "h1a".U
  array(5) := "h15".U
  array(6) := "h9".U
  array(7) := "h2".U
  array(8) := "h1b".U
  array(9) := "h5".U
  array(10) := "h8".U
  array(11) := "h12".U
  array(12) := "h1d".U
  array(13) := "h3".U
  array(14) := "h6".U
  array(15) := "h1c".U
  array(16) := "h1e".U
  array(17) := "h13".U
  array(18) := "h7".U
  array(19) := "he".U
  array(20) := "h0".U
  array(21) := "hd".U
  array(22) := "h11".U
  array(23) := "h18".U
  array(24) := "h10".U
  array(25) := "hc".U
  array(26) := "h1".U
  array(27) := "h19".U
  array(28) := "h16".U
  array(29) := "ha".U
  array(30) := "hf".U
  array(31) := "h17".U

  for (i <- 0 until 64) {
    temp(i) := array(
      Cat(
        io.x_in(0)(i),
        io.x_in(1)(i),
        io.x_in(2)(i),
        io.x_in(3)(i),
        io.x_in(4)(i)
      )
    )
  }

  for (j <- 0 until 5) {
    io.x_out(j) := Cat(
      temp(63)(4 - j),
      temp(62)(4 - j),
      temp(61)(4 - j),
      temp(60)(4 - j),
      temp(59)(4 - j),
      temp(58)(4 - j),
      temp(57)(4 - j),
      temp(56)(4 - j),
      temp(55)(4 - j),
      temp(54)(4 - j),
      temp(53)(4 - j),
      temp(52)(4 - j),
      temp(51)(4 - j),
      temp(50)(4 - j),
      temp(49)(4 - j),
      temp(48)(4 - j),
      temp(47)(4 - j),
      temp(46)(4 - j),
      temp(45)(4 - j),
      temp(44)(4 - j),
      temp(43)(4 - j),
      temp(42)(4 - j),
      temp(41)(4 - j),
      temp(40)(4 - j),
      temp(39)(4 - j),
      temp(38)(4 - j),
      temp(37)(4 - j),
      temp(36)(4 - j),
      temp(35)(4 - j),
      temp(34)(4 - j),
      temp(33)(4 - j),
      temp(32)(4 - j),
      temp(31)(4 - j),
      temp(30)(4 - j),
      temp(29)(4 - j),
      temp(28)(4 - j),
      temp(27)(4 - j),
      temp(26)(4 - j),
      temp(25)(4 - j),
      temp(24)(4 - j),
      temp(23)(4 - j),
      temp(22)(4 - j),
      temp(21)(4 - j),
      temp(20)(4 - j),
      temp(19)(4 - j),
      temp(18)(4 - j),
      temp(17)(4 - j),
      temp(16)(4 - j),
      temp(15)(4 - j),
      temp(14)(4 - j),
      temp(13)(4 - j),
      temp(12)(4 - j),
      temp(11)(4 - j),
      temp(10)(4 - j),
      temp(9)(4 - j),
      temp(8)(4 - j),
      temp(7)(4 - j),
      temp(6)(4 - j),
      temp(5)(4 - j),
      temp(4)(4 - j),
      temp(3)(4 - j),
      temp(2)(4 - j),
      temp(1)(4 - j),
      temp(0)(4 - j)
    )
  }
}
class muxRotateLevel(currentLevel: Int, width: Int) extends Module { // not used
  val io = IO(new Bundle {
    val select = Input(UInt(1.W))
    val input = Input(UInt(width.W))
    val output = Output(UInt(width.W))
  })

  val tmp = VecInit(Seq.fill(width)(0.U(1.W)))

  for (i <- 0 until width) {
    tmp(i) := Mux(
      io.select.asBool,
      io.input((i + math.pow(2, currentLevel)).toInt % width),
      io.input(i)
    )
  }
  // val tmp1 = UInt(64.W)
  // for (i <- 0 until width) {
  //   tmp(i + 1) ## tmp(i)
  // }

  io.output := tmp.asUInt
}

class barrelShifter_seq_param(amountOfLayers: Int) extends Module { // not used
  val muxWidth = math.pow(2, amountOfLayers).toInt
  val io = IO(new Bundle {
    val input = Input(UInt(muxWidth.W))
    val amount = Input(UInt(amountOfLayers.W))
    val output = Output(UInt(muxWidth.W))
  })
  class single_layer_io extends Bundle {
    val input = UInt(muxWidth.W)
    val output = UInt(muxWidth.W)
  }
  val layer_IO = Wire(Vec(amountOfLayers, new single_layer_io()))
  val tempReg = RegInit(VecInit(Seq.fill(2)(0.U(muxWidth.W))))

  for (currentLayer <- 0 until amountOfLayers) {
    // Vec(amountOfLayers,Module(new muxRotateLevel(currentLayer, muxWidth)).io)
    val level = Module(new muxRotateLevel(currentLayer, muxWidth)).io
    level.input := layer_IO(currentLayer).input
    layer_IO(currentLayer).output := level.output
    level.select := io.amount(currentLayer)
  }
  layer_IO(0).input := io.input
  for (currentLayer <- 0 until amountOfLayers - 1) {
    // figure out assignments here:
    // assuming 2 registers: input to 2 layers, then register, 2 layers, then register, 2 layers, then output
    // 1.output/2.input, 3.output/4.input
    if (currentLayer % 2 == (2 - 1)) {
      tempReg(currentLayer / 2) := layer_IO(currentLayer).output
      layer_IO(currentLayer + 1).input := tempReg(currentLayer / 2)
    } else {
      // if currentLayer is 5, 6 is invalid
      layer_IO(currentLayer + 1).input := layer_IO(currentLayer).output
    }
  }
  // assign the 5th output to io.output (assuming 6 layers)
  io.output := layer_IO(amountOfLayers - 1).output

}
class barrelShifter(amountOfLayers: Int) extends Module { // not used
  val io = IO(new Bundle {
    val input = Input(UInt(math.pow(2, amountOfLayers).toInt.W))
    val amount = Input(UInt(amountOfLayers.W))
    val output = Output(UInt(math.pow(2, amountOfLayers).toInt.W))
  })

  // val muxOut0 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut1 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut2 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut3 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut4 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut5 = VecInit(Seq.fill(64)(0.U(1.W)))
  // val muxOut0 = Wire(Vec(64,UInt(1.W)))
  // val muxOut1 = Wire(Vec(64,UInt(1.W)))
  // val muxOut2 = Wire(Vec(64,UInt(1.W)))
  // val muxOut3 = Wire(Vec(64,UInt(1.W)))
  // val muxOut4 = Wire(Vec(64,UInt(1.W)))
  // val muxOut5 = Wire(Vec(64,UInt(1.W)))

  val muxOut = VecInit(
    Seq.fill(amountOfLayers)(
      VecInit(Seq.fill(math.pow(2, amountOfLayers).toInt)(0.U(1.W)))
    )
  )

  for (level <- 0 until amountOfLayers) {
    if (level != 0) {
      // Shifted bits
      for (i <- 0 until math.pow(2, amountOfLayers).toInt) {
        // println("current mux is: " + i)
        // println("shift location is: " + (i+(math.pow(2,level).toInt))%(math.pow(2,amountOfLayers).toInt))
        // println("level is: " + level)
        muxOut(level)(i) := Mux(
          io.amount(level),
          muxOut(level - 1)(
            (i + (math.pow(2, level).toInt)) % (math
              .pow(2, amountOfLayers)
              .toInt)
          ),
          muxOut(level - 1)(i)
        )
      }
    } else {
      // Bits that are rotated to the front
      muxOut(0)(math.pow(2, amountOfLayers).toInt - 1) := Mux(
        io.amount(0),
        io.input(0),
        io.input(math.pow(2, amountOfLayers).toInt - 1)
      )
      // Shifted bits
      for (i <- 0 until math.pow(2, amountOfLayers).toInt - 1) {
        muxOut(0)(i) := Mux(io.amount(0), io.input(i + 1), io.input(i))
      }
    }
  }
  io.output := muxOut(amountOfLayers - 1).asUInt

  // // Level 0
  // // can combine loops together with a "when" statement
  // for(i <- 0 until 1) //until pow(2,level)
  // {
  //   // for 63's shift to right, need to update 0
  //   muxOut0(63-i) := Mux(io.amount(0),io.input(i),io.input(63-i))
  // }
  // for (i <- 0 until 64-1) {
  //   muxOut0(i) := Mux(io.amount(0),io.input(i+1),io.input(i))
  // }

  // // Level 1
  // for(i <- 0 until 2) //until pow(2,level)
  // {
  //   muxOut1(63-i) := Mux(io.amount(1),muxOut0(2-i),muxOut0(63-i))
  // }
  // for (i <- 0 until 64-2) {
  //   muxOut1(i) := Mux(io.amount(1),muxOut0(i+2),muxOut0(i))
  // }

  // // Level 2
  // for(i <- 0 until 4) //until pow(2,level)
  // {
  //   muxOut2(63-i) := Mux(io.amount(2),muxOut1(4-i),muxOut1(63-i))
  // }
  // for (i <- 0 until 64-4) {
  //   muxOut2(i) := Mux(io.amount(2),muxOut1(i+4),muxOut1(i))
  // }
  // // Level 3
  // for(i <- 0 until 8) //until pow(2,level)
  // {
  //   muxOut3(63-i) := Mux(io.amount(3),muxOut2(8-i),muxOut2(63-i))
  // }
  // for (i <- 0 until 64-8) {
  //   muxOut3(i) := Mux(io.amount(3),muxOut2(i+8),muxOut2(i))
  // }
  // // Level 4
  // for(i <- 0 until 16) //until pow(2,level)
  // {
  //   muxOut4(63-i) := Mux(io.amount(4),muxOut3(16-i),muxOut3(63-i))
  // }
  // for (i <- 0 until 64-16) {
  //   muxOut4(i) := Mux(io.amount(4),muxOut3(i+16),muxOut3(i))
  // }
  // // Level 5
  // for(i <- 0 until 32) //until pow(2,level)
  // {
  //   muxOut5(63-i) := Mux(io.amount(5),muxOut4(32-i),muxOut4(63-i))
  // }
  // for (i <- 0 until 64-32) {
  //   muxOut5(i) := Mux(io.amount(5),muxOut4(i+32),muxOut4(i))
  // }
  // io.output := muxOut5.asUInt

  // for (j <- 0 until log_2(64)) {
  //   for (i <- 0 until j) {
  //     //Mux(io.amount(0),io.input(63),io.input(0), , )
  //   }
  //   for (i <- 1 until 64) {
  //     //Mux(io.amount(0),io.input(i),io.input(i+1), , )
  //   }
  // }

}

// This is a barrel shifter that rotates up to 63 bits to the right.
// The operation looks like this: output = input >>> amount
// also note that this takes two cycles to finish, first for the 3 layers, then another for the last 3 layers
// optimization: can increase register amount, but requires changing pipeline and register/FF usage
  // shortcut barrel shifter by stopping at less layers than required
class barrelShifter_2reg() extends Module {
  val io = IO(new Bundle {
    val input = Input(UInt(64.W))
    val amount = Input(UInt(6.W))
    val output = Output(UInt(64.W))
  })
  val muxOut = VecInit(Seq.fill(6)(VecInit(Seq.fill(64)(0.U(1.W)))))

  val reg0 = RegInit(0.U(64.W))
  val reg1 = RegInit(0.U(64.W))

  // First three layers (0,1,2)
  for (level <- 0 until 3) {
    if (level != 0) {
      for (i <- 0 until 64) {
        muxOut(level)(i) := Mux(
          io.amount(level),
          muxOut(level - 1)((i + (math.pow(2, level).toInt)) % 64),
          muxOut(level - 1)(i)
        )
      }
    } else {
      muxOut(0)(63) := Mux(io.amount(0), io.input(0), io.input(63))
      for (i <- 0 until 63) {
        muxOut(0)(i) := Mux(io.amount(0), io.input(i + 1), io.input(i))
      }
    }
  }

  // First Register
  reg0 := muxOut(2).asUInt

  // Next three layers (3,4,5)
  for (level <- 3 until 6) {
    if (level != 3) {
      for (i <- 0 until 64) {
        muxOut(level)(i) := Mux(
          io.amount(level),
          muxOut(level - 1)((i + (math.pow(2, level).toInt)) % 64),
          muxOut(level - 1)(i)
        )
      }
    } else {
      for (i <- 0 until 64) {
        muxOut(3)(i) := Mux(
          io.amount(3),
          reg0((i + (math.pow(2, 3).toInt)) % 64),
          reg0(i)
        )
      }
    }
  }

  // Second Register
  reg1 := muxOut(5).asUInt

  // Output
  io.output := reg1
}
// when i is provided, the output is immediately set to the current amount value
// inputs should only happen on the first cycle, not the second cycle: (i % 2) cycles
class amount_decoder extends Module {
  val io = IO(new Bundle {
    val i = Input(UInt(3.W))
    val count = Input(UInt(1.W))
    val amount = Output(UInt(6.W))
  })
  val temp = RegInit(0.U(4.W))
  val amountFirst = Wire(UInt(6.W))
  val amountSecond = Wire(UInt(6.W))
  val count = RegInit(0.U(1.W))

  when(io.i === 0.U) {
    amountFirst := 19.U
    amountSecond := 28.U
  }
    .elsewhen(io.i === 1.U) {
      amountFirst := 61.U
      amountSecond := 39.U
    }
    .elsewhen(io.i === 2.U) {
      amountFirst := 1.U
      amountSecond := 6.U
    }
    .elsewhen(io.i === 3.U) {
      amountFirst := 10.U
      amountSecond := 17.U
    }
    .elsewhen(io.i === 4.U) {
      amountFirst := 7.U
      amountSecond := 41.U
    }
    .otherwise {
      amountFirst := 0.U
      amountSecond := 0.U
    }
  // count := count + 1.U

  when(io.count === 0.U) {
    temp := amountSecond(5, 3)
    io.amount := temp ## amountFirst(2, 0)
  }
  .otherwise {
    io.amount := amountFirst(5, 3) ## amountSecond(2, 0)
  }
}
// This pipelined diffusion is based on the diffusion layer.draw.io diagram page 9
// The equation is:
// x0 = x0 ^ (x0 >>> 19) ^ (x0 >>> 28)
// x1 = x1 ^ (x1 >>> 61) ^ (x1 >>> 39)
// x2 = x2 ^ (x2 >>> 1) ^ (x2 >>> 6)
// x3 = x3 ^ (x3 >>> 10) ^ (x3 >>> 17)
// x4 = x4 ^ (x4 >>> 7) ^ (x4 >>> 41)
// Note that this takes in only one 64 bit value, the diffusion_fifo takes all values, but it takes a few cycles for each input (should be total of 5 cycles)
// The i value input is a lookup table index to what the first and second rotation value should be. For example when i=0, the operation is the first equation, i=2 is the second equation, and so on.
// the equations are also defined in the ascon spec pdf
// optimization: changing barrel shifter requires changes here
class single_diff_pipe() extends Module {
  val io = IO(new Bundle {
    val x_in = Input(UInt(64.W))
    val i = Input(UInt(3.W))
    val x_out = Output(UInt(64.W))
  })
  val temp0 = RegInit(0.U(64.W))
  val temp1 = RegInit(0.U(64.W))
  val amountTempBuffer = RegInit(0.U(6.W))
  val count = RegInit(0.U(1.W))
  count := count + 1.U

  val amount_dec = Module(new amount_decoder).io
  amount_dec.i := io.i
  amount_dec.count := count

  val barrelShift = Module(new barrelShifter_2reg).io
  barrelShift.input := temp0
  // delay by one cycle to allow starting cycle at 0
  amountTempBuffer := amount_dec.amount
  barrelShift.amount := amountTempBuffer

  when(count === 0.U) {
    temp1 := temp0
    temp0 := io.x_in
  }.otherwise {
    temp1 := temp1 ^ barrelShift.output
  }
  io.x_out := temp1 ^ barrelShift.output
}
class barrelShifter_seq(amountOfLayers: Int) extends Module { // not used
  val muxAmount = math.pow(2, amountOfLayers).toInt.W
  val io = IO(new Bundle {
    val start = Input(Bool())
    val input = Input(UInt(muxAmount))
    val amount = Input(UInt(amountOfLayers.W))
    val output = Output(UInt(muxAmount))
    val done = Output(Bool())
  })
  val edge = Module(new posedge())
  edge.io.in := io.start

  val shifting :: processing :: done :: Nil = Enum(3)
  val currentState = RegInit(done)
  val shiftedNum = RegInit(io.input)
  val currentLevel = RegInit(
    0.U((math.log(amountOfLayers) / math.log(2)).ceil.toInt.W)
  )
  val mux_in_1 = RegInit(0.U(muxAmount))
  val mux_select = RegInit(0.U(1.W))
  // val mux_out = VecInit(Seq.fill(math.pow(2,amountOfLayers).toInt)(0.U(1.W)))
  val mux_out = Wire(UInt(64.W))
  // mux_out(0) := Mux(mux_select.asBool,mux_in_1(0),shiftedNum(0))
  // mux_out(1) := Mux(mux_select.asBool,mux_in_1(1),shiftedNum(1))
  // for (i <- 0 until math.pow(2,amountOfLayers).toInt) {
  //   mux_out(i) := Mux(mux_select.asBool,mux_in_1(i),shiftedNum(i))
  // }
  mux_out := Mux(mux_select.asBool, mux_in_1, shiftedNum)

  switch(currentState) {
    is(shifting) {
      mux_select := io.amount(currentLevel)
      when(currentLevel === 0.U) {
        mux_in_1 := Cat(shiftedNum(0), shiftedNum(63, 1))
      }
        .elsewhen(currentLevel === 1.U) {
          mux_in_1 := Cat(shiftedNum(1, 0), shiftedNum(63, 2))
        }
        .elsewhen(currentLevel === 2.U) {
          mux_in_1 := Cat(shiftedNum(3, 0), shiftedNum(63, 4))
        }
        .elsewhen(currentLevel === 3.U) {
          mux_in_1 := Cat(shiftedNum(7, 0), shiftedNum(63, 8))
        }
        .elsewhen(currentLevel === 4.U) {
          mux_in_1 := Cat(shiftedNum(15, 0), shiftedNum(63, 16))
        }
        .elsewhen(currentLevel === 5.U) {
          mux_in_1 := Cat(shiftedNum(31, 0), shiftedNum(63, 32))
        }
      // .otherwise{
      //   mux_in_1 := Cat(shiftedNum(currentLevel.litValue.pow(2)-1,0),shiftedNum(63,currentLevel.litValue.pow(2)))
      // }
      currentLevel := currentLevel + 1.U
      // shiftedNum := mux_out
      // shiftedNum := Cat(
      //   mux_out(0),mux_out(1),mux_out(2),mux_out(3),mux_out(4),mux_out(5),mux_out(6),mux_out(7),
      //   mux_out(8),mux_out(9),mux_out(10),mux_out(11),mux_out(12),mux_out(13),mux_out(14),mux_out(15),
      //   mux_out(16),mux_out(17),mux_out(18),mux_out(19),mux_out(20),mux_out(21),mux_out(22),mux_out(23),
      //   mux_out(24),mux_out(25),mux_out(26),mux_out(27),mux_out(28),mux_out(29),mux_out(30),mux_out(31),
      //   mux_out(32),mux_out(33),mux_out(34),mux_out(35),mux_out(36),mux_out(37),mux_out(38),mux_out(39),
      //   mux_out(40),mux_out(41),mux_out(42),mux_out(43),mux_out(44),mux_out(45),mux_out(46),mux_out(47),
      //   mux_out(48),mux_out(49),mux_out(50),mux_out(51),mux_out(52),mux_out(53),mux_out(54),mux_out(55),
      //   mux_out(56),mux_out(57),mux_out(58),mux_out(59),mux_out(60),mux_out(61),mux_out(62),mux_out(63)
      // )
      currentState := processing
    }
    is(processing) {
      shiftedNum := mux_out
      // shiftedNum := Cat(
      //   mux_out(0),mux_out(1),mux_out(2),mux_out(3),mux_out(4),mux_out(5),mux_out(6),mux_out(7),
      //   mux_out(8),mux_out(9),mux_out(10),mux_out(11),mux_out(12),mux_out(13),mux_out(14),mux_out(15),
      //   mux_out(16),mux_out(17),mux_out(18),mux_out(19),mux_out(20),mux_out(21),mux_out(22),mux_out(23),
      //   mux_out(24),mux_out(25),mux_out(26),mux_out(27),mux_out(28),mux_out(29),mux_out(30),mux_out(31),
      //   mux_out(32),mux_out(33),mux_out(34),mux_out(35),mux_out(36),mux_out(37),mux_out(38),mux_out(39),
      //   mux_out(40),mux_out(41),mux_out(42),mux_out(43),mux_out(44),mux_out(45),mux_out(46),mux_out(47),
      //   mux_out(48),mux_out(49),mux_out(50),mux_out(51),mux_out(52),mux_out(53),mux_out(54),mux_out(55),
      //   mux_out(56),mux_out(57),mux_out(58),mux_out(59),mux_out(60),mux_out(61),mux_out(62),mux_out(63)
      // )
      when(currentLevel < amountOfLayers.U) {
        currentState := shifting
      }.otherwise {
        currentState := done
      }
    }
    is(done) {
      when(edge.io.out) {
        shiftedNum := io.input
        currentState := shifting
        currentLevel := 0.U
      }.otherwise {
        currentState := done
      }
    }
  }

  when(currentState === done) {
    io.done := true.B
  }.otherwise {
    io.done := false.B
  }

  // io.output := Mux(io.done,shiftedNum,io.input)
  io.output := shiftedNum
}

class decode_and_assign_amount_segments_every_cycle extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val i = Input(UInt(3.W))
    val amount = Output(UInt(6.W))
  })
  val temp = RegInit(0.U(4.W))
  val count = RegInit(0.U(1.W))
  val amountFirst = Wire(UInt(6.W))
  val amountSecond = Wire(UInt(6.W))
  count := count + 1.U

  when(io.i === 0.U) {
    amountFirst := 19.U
    amountSecond := 28.U
  }
    .elsewhen(io.i === 1.U) {
      amountFirst := 61.U
      amountSecond := 39.U
    }
    .elsewhen(io.i === 2.U) {
      amountFirst := 1.U
      amountSecond := 6.U
    }
    .elsewhen(io.i === 3.U) {
      amountFirst := 10.U
      amountSecond := 17.U
    }
    .elsewhen(io.i === 4.U) {
      amountFirst := 7.U
      amountSecond := 41.U
    }
    .otherwise {
      amountFirst := 0.U
      amountSecond := 0.U
    }
  when(count === 0.U) {
    temp := amountSecond(5, 2)
    io.amount := temp ## amountFirst(1, 0)
  }
    .otherwise {
      io.amount := amountFirst(5, 2) ## amountSecond(1, 0)
    }
}

class double_pipe_diff extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val x_in = Input(new x_val())
    val x_out = Output(UInt(64.W))
    val ready = Output(Bool())
  })

  val barrel = Module(new barrelShifter_seq_param(6))

  // count the number of cycles for ready signal
  val count = RegInit(0.U(1.W))
  count := count + 1.U
  val temp = RegInit(0.U(64.W))
  val temp1 = RegInit(0.U(64.W))
  val temp_i = RegInit(0.U(3.W))
  temp := io.x_in.data
  temp_i := io.x_in.i

  // temp(0) := io.x_in.data
  // temp(1) := io.x_in.data
  // temp := io.x_in.data

  barrel.io.input := temp

  // every 2 cycles do the steps below: store first temp value somewhere to continue xor
  when(count === 1.U) {
    temp1 := temp
    io.ready := false.B
  }
    .otherwise {
      io.ready := true.B
    }
  // should become off by one after temp assignment; fixed with temp_i register
  val decodeAmount = Module(new decode_and_assign_amount_segments_every_cycle())
  barrel.io.amount := decodeAmount.io.amount
  decodeAmount.io.i := io.x_in.data
  // this assignment prevents starting at count=0
  temp1 := barrel.io.output ^ temp1
  io.x_out := barrel.io.output ^ temp1

  /*
  Things to Keep in Mind
  when count = 0

  when count = 1
    Top = prevSecond(5,2), Bot = amountFirst(1,0)
  when count = 2
    ready is true
    Top := amountFirst(5,2), Bot := amountSecond(1,0) (current amountFirst not needed anymore)
    prevSecond = amountSecond
    amountFirst and amountSecond is updated in respects to i (amountFirst and amountSecond are new now)
  when count = 3
    Top = prevSecond(5,2), Bot = amountFirst(1,0)
   */

}
// only used for original comparisons
class diffusion_layer extends Module {
  val io = IO(new Bundle {
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

  io.x_out(0) := io.x_in(0) ^ Cat(io.x_in(0)(18, 0), io.x_in(0)(63, 19)) ^ Cat(
    io.x_in(0)(27, 0),
    io.x_in(0)(63, 28)
  )
  io.x_out(1) := io.x_in(1) ^ Cat(io.x_in(1)(60, 0), io.x_in(1)(63, 61)) ^ Cat(
    io.x_in(1)(38, 0),
    io.x_in(1)(63, 39)
  )
  io.x_out(2) := io.x_in(2) ^ Cat(io.x_in(2)(0, 0), io.x_in(2)(63, 1)) ^ Cat(
    io.x_in(2)(5, 0),
    io.x_in(2)(63, 6)
  )
  io.x_out(3) := io.x_in(3) ^ Cat(io.x_in(3)(9, 0), io.x_in(3)(63, 10)) ^ Cat(
    io.x_in(3)(16, 0),
    io.x_in(3)(63, 17)
  )
  io.x_out(4) := io.x_in(4) ^ Cat(io.x_in(4)(6, 0), io.x_in(4)(63, 7)) ^ Cat(
    io.x_in(4)(40, 0),
    io.x_in(4)(63, 41)
  )
}
class reg_reset_test extends Module { // not used
  val io = IO(new Bundle {
    val x_out = Output(Vec(5, UInt(64.W)))
  })
  // val reg = VecInit(Seq.fill(2)(RegInit(10.U(64.W))))
  // val reg = Vec(5,RegInit(0.U(64.W)))
  val reg = RegInit(VecInit(Seq.fill(5)(10.U(64.W))))
  // val reg0 = RegInit(10.U(64.W))
  // val reg1 = RegInit(10.U(64.W))
  // val reg2 = RegInit(10.U(64.W))
  // val reg3 = RegInit(10.U(64.W))
  // val reg4 = RegInit(10.U(64.W))
  val counter = RegInit(0.U(3.W))
  reg(counter) := counter
  when(counter < 5.U) {
    counter := counter + 1.U
    // when(counter === 0.U)
    // {
    //   reg0 := counter
    // }.elsewhen(counter === 1.U){
    //   reg1 := counter
    // }.elsewhen(counter === 2.U){
    //   reg2 := counter
    // }.elsewhen(counter === 3.U){
    //   reg3 := counter
    // }.elsewhen(counter === 4.U){
    //   reg4 := counter
    // }
  }
  // io.x_out(0) := reg0
  // io.x_out(1) := reg1
  // io.x_out(2) := reg2
  // io.x_out(3) := reg3
  // io.x_out(4) := reg4
  // for (i <- 0 until 5) {
  //   io.x_out(i) := reg(i)
  // }
  io.x_out := reg
}

class diffusion_layer_compat extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
    val done = Output(Bool())
  })

  val diffusion = Module(new diffusion_fifo(5))

  val counterIn = RegInit(0.U(3.W))
  val counterOut = RegInit(0.U(3.W))
  val transferring :: done :: Nil = Enum(2)
  val currentState = RegInit(done)
  // default assignment for when it's not set
  diffusion.io.startInsert := false.B
  diffusion.io.startOutput := false.B
  // val x_out_reg = VecInit(Seq.fill(5)(RegInit(10.U(64.W))))
  val x_out_reg = RegInit(VecInit(Seq.fill(5)(10.U(64.W))))

  diffusion.io.x_in.data := io.x_in(counterIn)
  diffusion.io.x_in.i := counterIn
  io.x_out := x_out_reg

  when(currentState === done) {
    io.done := true.B
  }.otherwise {
    io.done := false.B
  }
  switch(currentState) {
    // this state allows reading and writing from the diffusion_fifo at the same time
    is(transferring) {
      // handle writing 5 values to diffusion
      when(diffusion.io.full === false.B && counterIn < 5.U) {
        // diffusion.io.x_in.data := io.x_in(counterIn)
        diffusion.io.startInsert := true.B
        counterIn := counterIn + 1.U
      }
      // handle reading 5 values from diffusion
      when(diffusion.io.empty === false.B && counterOut < 5.U) {
        x_out_reg(counterOut) := diffusion.io.x_out.data
        diffusion.io.startOutput := true.B
        counterOut := counterOut + 1.U
      }

      when(counterOut === 5.U) {
        currentState := done
      }
      .otherwise {
        currentState := transferring
      }

    }
    is(done) {
      when(io.start) {
        counterIn := 0.U
        counterOut := 0.U
        currentState := transferring
      }
        .otherwise {
          currentState := done
        }
    }
  }
}
class queue_test extends Module { // not used
  val io = IO(new Bundle {
    // val in = Decoupled(UInt(8.W))
    val start_in = Input(Bool())
    val in = Input(UInt(8.W))
    val start_out = Input(Bool())
    val out = Output(UInt(8.W))
    val empty = Output(Bool())
    val full = Output(Bool())
  })
  val queue = Module(new Queue(UInt(8.W), 8))
  // flags for reading/writing
  io.full := ~queue.io.enq.ready
  io.empty := ~queue.io.deq.valid
  // bits in and out
  queue.io.enq.bits := io.in
  queue.io.enq.valid := io.start_in
  io.out := queue.io.deq.bits
  queue.io.deq.ready := io.start_out
}
class x_val extends Bundle {
  val data = UInt(64.W)
  val i = UInt(3.W)
}

// read from x_in and continually insert into fifo
// also read from input fifo and write to output fifo
// Note: Make sure that the input doesn't make the output full or data will be lost
// This will depend on the size of the fifos and how many stages the pipeline has
// pull data out of the output fifo before the stages are complete (before the 4th cycle in this case)
// optimization: maybe reduce the fifo_size since it will usually be empty on output for example
  // can also make a state machine, but is less maintainable when the number of stages changes
class diffusion_fifo(fifo_size: Int) extends Module {
  val io = IO(new Bundle {
    val x_in = Input(new x_val())
    val startInsert = Input(Bool())
    val x_out = Output(new x_val())
    val startOutput = Input(Bool())
    val full = Output(Bool())
    val empty = Output(Bool())
  })
  val in = Module(new Queue(new x_val(), fifo_size))
  val out = Module(new Queue(new x_val(), fifo_size))
  val single_diffusion = Module(new single_diff_pipe())

  val readMarker = RegInit(VecInit(Seq.fill(6)(false.B)))
  val deqMarker = RegInit(VecInit(Seq.fill(6)(false.B)))
  val read_i = RegInit(VecInit(Seq.fill(6)(7.U(3.W))))

  // connect x_in to input fifo and connect x_out to output fifo
  in.io.enq.bits := io.x_in
  io.x_out := out.io.deq.bits
  // pass through input queue full to outside and output queue empty to outside, inverting it so it makes sense
  io.full := ~in.io.enq.ready
  io.empty := ~out.io.deq.valid

  
  // input fifo: runs on its own in theory based on start signal
  // might need an edge detector to only make this happen once
  // alternatively, the module outside should use an edge detector and not here since this can be considered "cycle accurate". This is the current implementation
  // important to check if the queue is full outside before the startInsert is used
  
  // noticing that the two when statements below are basically like in.io.enq.valid := io.startInsert
  in.io.enq.valid := io.startInsert
  // when (io.startInsert === true.B) {
  //   in.io.enq.valid := true.B
  // } .otherwise {
  //   in.io.enq.valid := false.B
  // }

  // also do the output fifo: runs on its own in theory
  out.io.deq.ready := io.startOutput
  // when (io.startOutput === true.B) {
  //   out.io.deq.ready := true.B
  // } .otherwise {
  //   out.io.deq.ready := false.B
  // }

  // The next section below handles the "inner" fifo connections (in.io.deq, out.io.enq, single_diffusion.io)

  // testing default wire connection for inserting, reading flags; not sure if this works properly. The behavior works, however it may not be best practice to have a "default" value to rely on
  in.io.deq.ready := false.B
  out.io.enq.valid := false.B

  // keep input fifo's output to single_diffusion
  single_diffusion.io.x_in := in.io.deq.bits.data
  
  // keep diffusion's output going to the output fifo
  single_diffusion.io.i := in.io.deq.bits.i
  out.io.enq.bits.data := single_diffusion.io.x_out
  // Note confirmed: increasing counter in case of overflow when adding 4
  // also solves problem with unbalanced read and writes
  val counter = RegInit(0.U(4.W))
  when(counter === 5.U) {
    counter := 0.U
  }
    .otherwise {
      counter := counter + 1.U
    }
  out.io.enq.bits.i := read_i(counter)
  // writing; every 2 cycles write for 2 cycle deq, save i and save read marker
  // Trying to see if setting the deq marker at +1 will work because it takes one cycle to "register" changes
  // Note confirmed: this works; looks like there was an extra delay when deq happens that causes i and data to be off by one
  // specifically, i is wired directly so it must be held for 2 cycles while data is registered inside single_diffusion, so it needs 1 extra cycle
  // at cycle 2, there is data ready; i is already connected, but needs to be held for an extra cycle: cycle 3. the deq didn't happen until cycle 3 which changes i too soon. Meanwhile, data is input at cycle 3. This means i is one cycle earlier than data.
  // The resulting goal is to get new data at cycle 4, which means applying a deq signal at cycle 3 for the next data and i value
  // cycle two is too early and would change i before it was done; the data is also changed, but should still be valid because of the register being used
  // cycle 4 is too late because the next data is not there yet and the rest of the pipeline will use the wrong data that's old by 2 cycles

  when(in.io.deq.valid && (counter % 2.U === 0.U)) {
    // in.io.deq.ready := true.B
    deqMarker((counter + 1.U) % 6.U) := true.B
    read_i((counter + 4.U) % 6.U) := in.io.deq.bits.i
    readMarker((counter + 4.U) % 6.U) := true.B
  }
  // for now check every cycle; can be checked at counter % 2 === 1.U
  // Note that this is incompatible with a clock divider unfortunately
  when(deqMarker(counter)) {
    in.io.deq.ready := true.B
    // when (in.io.deq.valid === false.B) {
    deqMarker(counter) := false.B
    // }
  }
  // reading; when reaching a read marker, enq data and reset read marker
  when(readMarker(counter) && out.io.enq.ready) {
    readMarker(counter) := false.B
    out.io.enq.valid := true.B
  }
}

class diffusion_layer_wrapper extends Module { //***NOT IN USE***
  val io = IO(new Bundle {
    val start = Input(Bool())
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
    val done = Output(Bool())
  })

  // these two lines are to temporarily replace the actual FIFO
  // More wires will be needed to control the push/pull & start/done flags
  val fifo_in = VecInit(Seq.fill(5)(RegInit(0.U(64.W))))
  val fifo_out = VecInit(Seq.fill(5)(RegInit(0.U(64.W))))

  // Keep track of what section of the S-box is used
  val current_x = RegInit(0.U(3.W))
  val current_in = RegInit(0.U(64.W))
  val current_out = RegInit(0.U(64.W))
  val current_amountFirst = RegInit(0.U(6.W))
  val current_amountSecond = RegInit(0.U(6.W))
  val single_start = Bool()
  val single_done = Bool()

  // Instantiate diffusion_layer_single
  val single_diff = Module(new diffusion_layer_single())
  single_diff.io.x_in := current_in
  single_diff.io.start := single_start_edge
  single_diff.io.amountFirst := current_amountFirst
  single_diff.io.amountSecond := current_amountSecond
  current_out := single_diff.io.x_out
  single_done := single_diff.io.done

  // Edge Detectors
  val edge0 = Module(new posedge())
  edge0.io.in := io.start
  val start_edge = Bool()
  start_edge := edge0.io.out

  val edge1 = Module(new posedge())
  edge1.io.in := single_start
  val single_start_edge = Bool()
  single_start_edge := edge1.io.out

  val edge2 = Module(new posedge())
  edge2.io.in := single_done
  val single_done_edge = Bool()
  single_done_edge := edge2.io.out

  // Assign Amount First and Amount Second
  when(current_x === 0.U) {
    current_amountFirst := 19.U
    current_amountSecond := 28.U
  }
    .elsewhen(current_x === 1.U) {
      current_amountFirst := 61.U
      current_amountSecond := 39.U
    }
    .elsewhen(current_x === 2.U) {
      current_amountFirst := 1.U
      current_amountSecond := 6.U
    }
    .elsewhen(current_x === 3.U) {
      current_amountFirst := 10.U
      current_amountSecond := 17.U
    }
    .elsewhen(current_x === 4.U) {
      current_amountFirst := 7.U
      current_amountSecond := 41.U
    }
    .otherwise {
      current_amountFirst := 0.U
      current_amountSecond := 0.U
    }

  // On start, current_x will be reset to 0
  when(start_edge) {
    current_x := 0.U
  }

  // When single_start is toggled on, contents of fifo_in(current_x) are stored in current_in
  when(single_start_edge) {
    current_in := fifo_in(current_x)
  }

  // When single_done is turned on, single_start will turn off and
  // fifo_out(current_x) will store current_out and incrememnt current_x
  when(single_done_edge) {
    single_start := false.B
    fifo_out(current_x) := current_out
    current_x := current_x + 1.U
  }

  // As long as current_x <= 4, done is false, single_start will be on, and x_out is 0
  // Otherwise, done is true and x_out is updated with fifo_out
  when(current_x <= 4.U) {
    io.done := false.B
    single_start := true.B
    io.x_out := 0.U
  }
    .otherwise {
      io.done := true.B
      io.x_out := fifo_out
    }
}

class regAssign extends Module { // not used; only for testing
  val io = IO(new Bundle {
    val start = Input(Bool())
    val x_out = Output(UInt(5.W))
    val done = Output(Bool())
  })
  val first :: second :: third :: fourth :: done :: Nil = Enum(5)

  val temp = RegInit(0.U(5.W))
  val current = RegInit(done)
  // wires can't hold values!!! (except for default values)
  // val mode_test = WireDefault(2.U(3.W))
  val mode_test = RegInit(2.U(3.W))
  val wire_out = Wire(UInt(5.W))
  // choose
  when(mode_test === 0.U) {
    wire_out := 2.U
  }
    .elsewhen(mode_test === 1.U) {
      wire_out := 4.U
    }
    .elsewhen(mode_test === 2.U) {
      wire_out := 6.U
    }
    .elsewhen(mode_test === 3.U) {
      wire_out := 8.U
    }
    .otherwise {
      wire_out := 10.U
    }
  // save x_in with value that changes (simulate wire)
  switch(current) {
    is(first) {
      // set to 4
      // IMPORTANT FINDINGS: the mode_test register assignment takes a clock cycle to apply; the register assignments are "to be assigned" and are basically nonblocking assignments
      // shouldn't affect temp; maybe result in 8
      mode_test := 3.U
      temp := wire_out
      current := fourth
    }
    // is(second) {
    //   // shouldn't affect temp; maybe result in 6
    //   // mode_test := 2.U
    //   current := third
    // }
    // is(third) {
    //   // shouldn't result in 2
    //   // mode_test := 2.U
    //   // should save 4
    //   // simulating multiple cycles to output
    //   // IMPORTANT FINDINGS: in this switch statement, a mode_test wire gets set to default if not assigned

    //   current := fourth
    // }
    is(fourth) {
      current := done
    }
    is(done) {
      when(io.start) {
        mode_test := 1.U
        current := first
      }.otherwise {
        current := done
      }
    }
  }
  // expecting 4
  when(current === done) {
    io.done := true.B
  }.otherwise {
    io.done := false.B
  }
  io.x_out := temp
}

// class xor_test extends Module{
//   val io = IO(new Bundle {
//     val x_in        = Input(UInt(1.W))
//     val x_in1        = Input(UInt(1.W))
//     val x_out = Output(UInt(2.W))
//     val x_out1 = Output(UInt(2.W))
//   })
//   val muxWire = WireDefault(0.U(2.W))
//   muxWire := Mux(io.x_in.asBool, 1.U, 3.U)
//   io.x_out := muxWire
//   io.x_out1 := muxWire
// }

class diffusion_layer_single extends Module { // not used
  val io = IO(new Bundle {
    val x_in = Input(UInt(64.W))
    val start = Input(Bool())
    val amountFirst = Input(UInt(6.W))
    val amountSecond = Input(UInt(6.W))
    val x_out = Output(UInt(64.W))
    val done = Output(Bool())
  })
  val edge = Module(new posedge())
  edge.io.in := io.start
  val temp = RegInit(0.U(64.W))
  val barrel = Module(new barrelShifter_seq(6))
  val reg_amount = RegInit(0.U(6.W))
  // val start::first::second::done::Nil = Enum(4)
  val first :: second :: done :: Nil = Enum(3)
  val current = RegInit(done)
  barrel.io.input := io.x_in
  barrel.io.amount := reg_amount
  barrel.io.start := false.B
  val xor_temp = WireDefault(0.U(64.W))
  xor_temp := temp ^ barrel.io.output
  switch(current) {
    is(first) {
      when(barrel.io.done) {
        // store first rotate
        temp := xor_temp
        // start second rotate
        reg_amount := io.amountSecond
        barrel.io.start := true.B
        current := second
      }
        .otherwise {
          current := first
        }
    }
    is(second) {
      when(barrel.io.done) {
        current := done
      }
        .otherwise {
          current := second
        }
    }
    is(done) {
      when(edge.io.out) {
        // store the io.input value, start first rotate
        temp := io.x_in
        reg_amount := io.amountFirst
        barrel.io.start := true.B
        current := first
      }.otherwise {
        current := done
      }
    }
  }

  when(current === done) {
    io.done := true.B
  }.otherwise {
    io.done := false.B
  }
  io.x_out := xor_temp
}

class rotateRight extends Module { // not used
  val io = IO(new Bundle {
    val input = Input(UInt(64.W))
    val amount = Input(UInt(6.W))
    val output = Output(UInt(64.W))
  })
  io.output := io.input.rotateRight(io.amount)
}

// class rotateLeft extends Module {
//   val io = IO(new Bundle {
//     val input = Input(UInt(64.W))
//     val amount = Input(UInt(6.W))
//     val output = Output(UInt(64.W))
//   })
//   io.output := io.input.rotateLeft(io.amount)
// }

// single round permutation; original version with single cycle
class permutation extends Module {
  val io = IO(new Bundle {
    val round_in = Input(UInt(8.W))
    val x_in = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

  val addition = Module(new addition_layer())
  val substitution = Module(new substitution_layer())
  val diffusion = Module(new diffusion_layer())
  val substitution_reg = Reg(Vec(5, UInt(64.W)))

  addition.io.round_in := io.round_in
  addition.io.x2_in := io.x_in(2)

  substitution.io.x_in(0) := io.x_in(0)
  substitution.io.x_in(1) := io.x_in(1)
  substitution.io.x_in(2) := addition.io.x2_out
  substitution.io.x_in(3) := io.x_in(3)
  substitution.io.x_in(4) := io.x_in(4)

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
