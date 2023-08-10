package layers

import chisel3._
import chisel3.util._
import scala.math._
import _root_.permutation.posedge


class addition_layer extends Module {
  val io = IO(new Bundle {
    val round_in        = Input(UInt(8.W))
    val x2_in        = Input(UInt(64.W))
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


class substitution_layer extends Module {
  val io = IO(new Bundle {
    val x_in        = Input(Vec(5, UInt(64.W)))
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
    temp(i) := array(Cat(io.x_in(0)(i),io.x_in(1)(i),io.x_in(2)(i),io.x_in(3)(i),io.x_in(4)(i)))
  }

  for (j <- 0 until 5) {
    io.x_out(j) := Cat(temp(63)(4-j), temp(62)(4-j), temp(61)(4-j), temp(60)(4-j), temp(59)(4-j), temp(58)(4-j), temp(57)(4-j), temp(56)(4-j), temp(55)(4-j), temp(54)(4-j), temp(53)(4-j), temp(52)(4-j), temp(51)(4-j), temp(50)(4-j), temp(49)(4-j), temp(48)(4-j), temp(47)(4-j), temp(46)(4-j), temp(45)(4-j), temp(44)(4-j), temp(43)(4-j), temp(42)(4-j), temp(41)(4-j), temp(40)(4-j), temp(39)(4-j), temp(38)(4-j), temp(37)(4-j), temp(36)(4-j), temp(35)(4-j), temp(34)(4-j), temp(33)(4-j), temp(32)(4-j), temp(31)(4-j), temp(30)(4-j), temp(29)(4-j), temp(28)(4-j), temp(27)(4-j), temp(26)(4-j), temp(25)(4-j), temp(24)(4-j), temp(23)(4-j), temp(22)(4-j), temp(21)(4-j), temp(20)(4-j), temp(19)(4-j), temp(18)(4-j), temp(17)(4-j), temp(16)(4-j), temp(15)(4-j), temp(14)(4-j), temp(13)(4-j), temp(12)(4-j), temp(11)(4-j), temp(10)(4-j), temp(9)(4-j), temp(8)(4-j), temp(7)(4-j), temp(6)(4-j), temp(5)(4-j), temp(4)(4-j), temp(3)(4-j), temp(2)(4-j), temp(1)(4-j), temp(0)(4-j))
  }
}

class barrelShifter(amountOfLayers: Int) extends Module {
  val io = IO(new Bundle {
    val input = Input(UInt(math.pow(2,amountOfLayers).toInt.W))
    val amount = Input(UInt(amountOfLayers.W))
    val output = Output(UInt(math.pow(2,amountOfLayers).toInt.W))
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

  val muxOut = VecInit(Seq.fill(amountOfLayers)(VecInit(Seq.fill(math.pow(2,amountOfLayers).toInt)(0.U(1.W)))))
  
  for(level <- 0 until amountOfLayers)
  {
    if(level != 0)
    {
      //Shifted bits
      for (i <- 0 until math.pow(2,amountOfLayers).toInt) {
        // println("current mux is: " + i)
        // println("shift location is: " + (i+(math.pow(2,level).toInt))%(math.pow(2,amountOfLayers).toInt))
        // println("level is: " + level)
        muxOut(level)(i) := Mux(io.amount(level),muxOut(level-1)((i+(math.pow(2,level).toInt))%(math.pow(2,amountOfLayers).toInt)),muxOut(level-1)(i))
      }
    } 
    else
    {
      //Bits that are rotated to the front
      muxOut(0)(math.pow(2,amountOfLayers).toInt - 1) := Mux(io.amount(0),io.input(0),io.input(math.pow(2,amountOfLayers).toInt - 1))
      //Shifted bits
      for (i <- 0 until math.pow(2,amountOfLayers).toInt-1) {
        muxOut(0)(i) := Mux(io.amount(0),io.input(i+1),io.input(i))
      }
    }
  }
  io.output := muxOut(amountOfLayers-1).asUInt
  

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


class diffusion_layer extends Module {
  val io = IO(new Bundle {
    val x_in        = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })
    
    io.x_out(0) := io.x_in(0) ^ Cat(io.x_in(0)(18,0),io.x_in(0)(63,19)) ^ Cat(io.x_in(0)(27,0),io.x_in(0)(63,28))
    io.x_out(1) := io.x_in(1) ^ Cat(io.x_in(1)(60,0),io.x_in(1)(63,61)) ^ Cat(io.x_in(1)(38,0),io.x_in(1)(63,39))
    io.x_out(2) := io.x_in(2) ^ Cat(io.x_in(2)(0,0),io.x_in(2)(63,1)) ^ Cat(io.x_in(2)(5,0),io.x_in(2)(63,6))
    io.x_out(3) := io.x_in(3) ^ Cat(io.x_in(3)(9,0),io.x_in(3)(63,10)) ^ Cat(io.x_in(3)(16,0),io.x_in(3)(63,17))
    io.x_out(4) := io.x_in(4) ^ Cat(io.x_in(4)(6,0),io.x_in(4)(63,7)) ^ Cat(io.x_in(4)(40,0),io.x_in(4)(63,41))
}

class diffusion_layer_barrel extends Module {
  val io = IO(new Bundle {
    val x_in        = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })
    
}
// 
class regAssign extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val x_out = Output(UInt(5.W))
    val done = Output(Bool())
  })
  val first::second::third::fourth::done::Nil = Enum(5)

  val temp = RegInit(0.U(5.W))
  val current = RegInit(done)
  // wires can't hold values!!! (except for default values)
  // val mode_test = WireDefault(2.U(3.W))
  val mode_test = RegInit(2.U(3.W))
  val wire_out = Wire(UInt(5.W))
  // choose
  when (mode_test === 0.U) {
    wire_out := 2.U
  }
  .elsewhen (mode_test === 1.U) {
    wire_out := 4.U
  }
  .elsewhen (mode_test === 2.U) {
    wire_out := 6.U
  }
  .elsewhen (mode_test === 3.U) {
    wire_out := 8.U
  } .otherwise {
    wire_out := 10.U
  }
  // save x_in with value that changes (simulate wire)
    switch (current){
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
        when (io.start) {
          mode_test := 1.U
          current := first
        } .otherwise {
          current := done
        }
      }
    }
    // expecting 4
  when (current === done) {
    io.done := true.B
  } .otherwise {
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

class diffusion_layer_single extends Module {
  val io = IO(new Bundle {
    val x_in        = Input(UInt(64.W))
    val start = Input(Bool())
    val amountFirst = Input(UInt(6.W))
    val amountSecond = Input(UInt(6.W))
    val x_out = Output(UInt(64.W))
    val done = Output(Bool())
  })
  val edge = Module(new posedge())
  edge.io.in := io.start
  val temp = RegInit(0.U(64.W))
  val barrel = Module(new barrelShifter(6))
  val reg_amount = RegInit(0.U(6.W))
  //val start::first::second::done::Nil = Enum(4)
  val first::second::done::Nil = Enum(3)
  val current = RegInit(done)
  barrel.io.input := io.x_in
  barrel.io.amount := reg_amount
  switch (current){
    is(first){
      // store first rotate
      temp := temp ^ barrel.io.output
      // start second rotate
      reg_amount := io.amountSecond
      current := second
    }
    is(second) {
      // store second rotate
      temp := temp ^ barrel.io.output
      current := done
    }
    is(done){
      when (edge.io.out) {
        // store the io.input value, start first rotate
        temp := io.x_in
        reg_amount := io.amountFirst
        current := first
      } .otherwise {
        current := done
      }
    }
  }

  when (current === done) {
    io.done := true.B
  } .otherwise {
    io.done := false.B
  }
  io.x_out := temp
}



class rotateRight extends Module {
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

// single round permutation
class permutation extends Module {
  val io = IO(new Bundle {
    val round_in        = Input(UInt(8.W))
    val x_in        = Input(Vec(5, UInt(64.W)))
    val x_out = Output(Vec(5, UInt(64.W)))
  })

    val addition = Module(new addition_layer())
    val substitution = Module(new substitution_layer())
    val diffusion= Module(new diffusion_layer())
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