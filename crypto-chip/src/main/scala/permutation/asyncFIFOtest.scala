package layers
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource

// This is an output async interface based on a decoupled IO. the output will be handshaked, while the input will be a standard decoupled io. It will continuously attempt to send data out as long as there's data. If not, it will continuously check/wait.

class async_io_out(numberOfBits: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(numberOfBits.W)))
    val out = Decoupled(UInt(numberOfBits.W))
  })

  // connect the queue data and output data
  io.out.bits := io.in.bits

  // val regReady = RegInit(false.B)
  // val regvalid = RegInit(false.B)

  // set deq's ready to false by default to prevent multiple reads
  io.in.ready := false.B

  // set valid to false by default since that there's no data by default
  // io.out.valid := false.B

  val sending :: checkReady :: Nil = Enum(2)
  val currentState = RegInit(checkReady)
  switch(currentState) {
    is(sending) {
      // This state is in charge of checking for a ready signal that's false. This means the output has acknowledged and read in data and the "transaction" can be finished.
      // The next response is to set valid to false to start the completion of the "transaction"
      when(!io.out.ready) {
        currentState := checkReady
        // since this is the last action with the async on the outside, this should only happen for one cycle
        io.in.ready := true.B
      }
        .otherwise {
          currentState := sending
        }
    }
    is(checkReady) {
      // This state is in charge of checking if the ready signal of the fifo to write to is true and also that the queue to read from is not empty (valid is true).
      when(io.out.ready & io.in.valid) {
        currentState := sending
        // when sending, the valid signal must be set true as soon as possible, so here?
      }
        .otherwise {
          currentState := checkReady
        }
    }
  }
  when(currentState === checkReady) {
    io.out.valid := false.B
  }
    .elsewhen(currentState === sending) {
      io.out.valid := true.B
    }
    .otherwise {
      io.out.valid := false.B
    }
}
// Ideally, this should be using a generic Chisel type to allow any data type to be used, from Vec to UInt
// an example of a generic data type can possibly found in the Input() declaration for Chisel IO
class async_io_out_vec(width: Int, depth: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(Vec(width, UInt(depth.W))))
    val out = Decoupled(Vec(width, UInt(depth.W)))
  })

  // connect the queue data and output data
  io.out.bits := io.in.bits

  // val regReady = RegInit(false.B)
  // val regvalid = RegInit(false.B)

  // set deq's ready to false by default to prevent multiple reads
  io.in.ready := false.B

  // set valid to false by default since that there's no data by default
  // io.out.valid := false.B

  val sending :: checkReady :: Nil = Enum(2)
  val currentState = RegInit(checkReady)
  switch(currentState) {
    is(sending) {
      // This state is in charge of checking for a ready signal that's false. This means the output has acknowledged and read in data and the "transaction" can be finished.
      // The next response is to set valid to false to start the completion of the "transaction"
      when(!io.out.ready) {
        currentState := checkReady
        // since this is the last action with the async on the outside, this should only happen for one cycle
        io.in.ready := true.B
      }
        .otherwise {
          currentState := sending
        }
    }
    is(checkReady) {
      // This state is in charge of checking if the ready signal of the fifo to write to is true and also that the queue is not empty (valid is true).
      when(io.out.ready && io.in.valid) {
        currentState := sending
        // when sending, the valid signal must be set true as soon as possible, so here?
      }
        .otherwise {
          currentState := checkReady
        }
    }
  }
  when(currentState === checkReady) {
    io.out.valid := false.B
  }
    .elsewhen(currentState === sending) {
      io.out.valid := true.B
    }
    .otherwise {
      io.out.valid := false.B
    }
}
class async_io_out_vec_round(width: Int, depth: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(Vec(width, UInt(depth.W))))
    val in_round = Input(UInt(4.W))
    val out = Decoupled(Vec(width, UInt(depth.W)))
    val out_round = Output(UInt(4.W))
  })

  // connect the queue data and output data
  io.out.bits := io.in.bits
  io.out_round := io.in_round

  // val regReady = RegInit(false.B)
  // val regvalid = RegInit(false.B)

  // set deq's ready to false by default to prevent multiple reads
  io.in.ready := false.B

  // set valid to false by default since that there's no data by default
  // io.out.valid := false.B

  val sending :: checkReady :: Nil = Enum(2)
  val currentState = RegInit(checkReady)
  switch(currentState) {
    is(sending) {
      // This state is in charge of checking for a ready signal that's false. This means the output has acknowledged and read in data and the "transaction" can be finished.
      // The next response is to set valid to false to start the completion of the "transaction"
      when(!io.out.ready) {
        currentState := checkReady
        // since this is the last action with the async on the outside, this should only happen for one cycle
        io.in.ready := true.B
      }
        .otherwise {
          currentState := sending
        }
    }
    is(checkReady) {
      // This state is in charge of checking if the ready signal of the fifo to write to is true and also that the queue is not empty (valid is true).
      when(io.out.ready && io.in.valid) {
        currentState := sending
        // when sending, the valid signal must be set true as soon as possible, so here?
      }
        .otherwise {
          currentState := checkReady
        }
    }
  }
  when(currentState === checkReady) {
    io.out.valid := false.B
  }
    .elsewhen(currentState === sending) {
      io.out.valid := true.B
    }
    .otherwise {
      io.out.valid := false.B
    }
}

// This is an input async interface based on a decoupled IO. the input will be handshaked, while the output will be a standard decoupled io. It will continuously output data if possible. If not, it will continuously try and but will signal ready to true.
class async_io_in(numberOfBits: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(numberOfBits.W)))
    val out = Decoupled(UInt(numberOfBits.W))
  })

  // data will always be on output
  io.out.bits := io.in.bits

  // defaults for input to be ready by default and output invalid by default
  io.in.ready := true.B
  io.out.valid := false.B

  // This state machine below handles handshaking with the input
  val receiving :: checkValid :: Nil = Enum(2)
  val currentState = RegInit(checkValid)
  switch(currentState) {
    is(receiving) {
      // This state is in charge of receiving a valid signal of 0. The next response is to set the ready signal back to true and complete the "transaction"
      // another way of seeing this is when input's valid is true, the ready signal is false
      when(!io.in.valid) {
        currentState := checkValid
      }
        .otherwise {
          currentState := receiving
        }
    }
    is(checkValid) {
      // this is in charge of mainly checking for a valid signal from outside. Also prevents acknowledging the valid signal if the queue is empty (ready is false).
      // Ideally, if the queue is full, don't set the ready signal to true.
      // The next response is setting ready to true and also reading in data into the input queue
      when(io.in.valid & io.out.ready) {
        currentState := receiving
        // delay ready signal until next cycle to try avoiding combinational loop
        // io.in.ready := false.B
        // like the sender, this statement should only happen for one cycle
        // by the time this state is done, the data should be valid going into the fifo, so it's ok to move from here to the next state
        io.out.valid := true.B
      }
        .otherwise {
          currentState := checkValid
        }
    }
  }
  when(currentState === checkValid) {
    io.in.ready := true.B
  }
    .elsewhen(currentState === receiving) {
      io.in.ready := false.B
    }
    .otherwise {
      io.in.ready := true.B
    }

}
class async_io_in_vec(width: Int, depth: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(Vec(width, UInt(depth.W))))
    val out = Decoupled(Vec(width, UInt(depth.W)))
  })

  // data will always be on output
  io.out.bits := io.in.bits

  // defaults for input to be ready by default and output invalid by default
  io.in.ready := true.B
  io.out.valid := false.B

  // This state machine below handles handshaking with the input
  val receiving :: checkValid :: Nil = Enum(2)
  val currentState = RegInit(checkValid)
  switch(currentState) {
    is(receiving) {
      // This state is in charge of receiving a valid signal of 0. The next response is to set the ready signal back to true and complete the "transaction"
      // another way of seeing this is when input's valid is true, the ready signal is false
      when(!io.in.valid) {
        currentState := checkValid
      }
        .otherwise {
          currentState := receiving
        }
    }
    is(checkValid) {
      // this is in charge of mainly checking for a valid signal from outside. Also prevents acknowledging the valid signal if the queue is empty (ready is false).
      // Ideally, if the queue is full, don't set the ready signal to true.
      // The next response is setting ready to true and also reading in data into the input queue
      when(io.in.valid & io.out.ready) {
        currentState := receiving
        // delay ready signal until next cycle to try avoiding combinational loop
        // io.in.ready := false.B
        // like the sender, this statement should only happen for one cycle
        // by the time this state is done, the data should be valid going into the fifo, so it's ok to move from here to the next state
        io.out.valid := true.B
      }
        .otherwise {
          currentState := checkValid
        }
    }
  }
  when(currentState === checkValid) {
    io.in.ready := true.B
  }
    .elsewhen(currentState === receiving) {
      io.in.ready := false.B
    }
    .otherwise {
      io.in.ready := true.B
    }

}

// clock A
//
class fifo_one(numberOfBits: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(numberOfBits.W)))
    val out = Decoupled(UInt(numberOfBits.W))
  })
  // create queue with depth 4, size 1
  val queue = Module(new Queue(UInt(numberOfBits.W), 4))
  val async_in = Module(new async_io_out(numberOfBits))
  queue.io.enq <> io.in
  async_in.io.in <> queue.io.deq
  io.out <> async_in.io.out
}

// clock B
// This is a test module with an async input going into a fifo, then that fifo will go to the output all based on a valid-ready interface.
class fifo_two(numberOfBits: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(numberOfBits.W)))
    val out = Decoupled(UInt(numberOfBits.W))
  })
  // create queue with depth 4, size 1
  val queue = Module(new Queue(UInt(numberOfBits.W), 4))

  val async_in = Module(new async_io_in(numberOfBits))
  async_in.io.in <> io.in
  queue.io.enq <> async_in.io.out
  io.out <> queue.io.deq
}
// Tests async handshake from queue to queue
// no sequential logic is used in this module directly, so no clock needs to be stepped
class top(numberOfBits: Int) extends Module {
  val io = IO(new Bundle {
    val clockA = Input(Clock())
    // val resetA = Input(Bool())
    val clockB = Input(Clock())
    // val resetB = Input(Bool())
    val in = Flipped(Decoupled(UInt(numberOfBits.W)))
    val out = Decoupled(UInt(numberOfBits.W))
  })
  // input side:
  // checkReady: ready = 1
  // send: valid from 0 to 1
  // send_ack: ready from 1 to 0
  // end/finish: valid from 1 to 0
  // end_ack: ready from 0 to 1
  val one = withClock(io.clockA) {
    Module(new fifo_one(numberOfBits))
  }
  one.io.in <> io.in
  // output side:
  // check valid: valid = 1 (0 to 1)
  // recv ack: ready from 1 to 0
  // finish: valid 1 to 0
  val two = withClock(io.clockB) {
    Module(new fifo_two(numberOfBits))
  }
  two.io.in <> one.io.out

  io.out <> two.io.out
}
class reset_test() extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(2.W))
  })
  // without reset, I assume it will be at 0
  val first :: second :: third :: fourth :: Nil = Enum(4)
  val state = RegInit(fourth)
  switch(state) {
    is(first) {
      state := second
    }
    is(second) {
      state := second
    }
    is(third) {
      state := third
    }
    is(fourth) {
      state := third
    }
  }
  io.out := state
  // // init register to 16 (5 bits)
  // val tempReg = RegInit((2*2*2*2).U)
  // io.out := tempReg
  // tempReg := tempReg + 1.U
}
class multiclock() extends Module {
  val io = IO(new Bundle {
    val clockA = Input(Clock())
    val out = Output(UInt(2.W))
  })
  val rtest = withClock(io.clockA) { Module(new reset_test()) }
  io.out := rtest.io.out
}
// class multiclock_top() extends Module {
//   val io = IO(new Bundle {
//     val out = Output(UInt(2.W))
//   })
//   val temp = Clock()
//   val top = Module(new multiclock())
//   io.out := top.io.out
//   top.io.clockA := temp
// }
class add_init_test() extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(2.W))
    val out = Output(UInt(4.W))
  })
  val first = RegInit(10.U)
  first := io.in + first
  io.out := first
}
class top_init_add_test() extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(2.W))
    val out = Output(UInt(4.W))
  })

}
// generic version of async_io_out
class async_io_out_generic[T <: Data](gen: T) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(gen))
    val out = Decoupled(gen)
  })

  // connect the queue data and output data
  io.out.bits := io.in.bits

  // set deq's ready to false by default to prevent multiple reads
  io.in.ready := false.B

  val sending :: checkReady :: Nil = Enum(2)
  val currentState = RegInit(checkReady)
  switch(currentState) {
    is(sending) {
      // This state is in charge of checking for a ready signal that's false. This means the output has acknowledged and read in data and the "transaction" can be finished.
      // The next response is to set valid to false to start the completion of the "transaction"
      when(!io.out.ready) {
        currentState := checkReady
        // since this is the last action with the async on the outside, this should only happen for one cycle
        io.in.ready := true.B
      }
        .otherwise {
          currentState := sending
        }
    }
    is(checkReady) {
      // This state is in charge of checking if the ready signal of the fifo to write to is true and also that the queue to read from is not empty (valid is true).
      when(io.out.ready & io.in.valid) {
        currentState := sending
        // when sending, the valid signal must be set true as soon as possible, so here?
      }
        .otherwise {
          currentState := checkReady
        }
    }
  }
  when(currentState === checkReady) {
    io.out.valid := false.B
  }
    .elsewhen(currentState === sending) {
      io.out.valid := true.B
    }
    .otherwise {
      io.out.valid := false.B
    }
}
// generic verison of async_io_in
class async_io_in_generic[T <: Data](gen: T) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(gen))
    val out = Decoupled(gen)
  })

  // data will always be on output
  io.out.bits := io.in.bits

  // defaults for input to be ready by default and output invalid by default
  io.in.ready := true.B
  io.out.valid := false.B

  // This state machine below handles handshaking with the input
  val receiving :: checkValid :: Nil = Enum(2)
  val currentState = RegInit(checkValid)
  switch(currentState) {
    is(receiving) {
      // This state is in charge of receiving a valid signal of 0. The next response is to set the ready signal back to true and complete the "transaction"
      // another way of seeing this is when input's valid is true, the ready signal is false
      when(!io.in.valid) {
        currentState := checkValid
      }
        .otherwise {
          currentState := receiving
        }
    }
    is(checkValid) {
      // this is in charge of mainly checking for a valid signal from outside. Also prevents acknowledging the valid signal if the queue is empty (ready is false).
      // Ideally, if the queue is full, don't set the ready signal to true.
      // The next response is setting ready to true and also reading in data into the input queue
      when(io.in.valid & io.out.ready) {
        currentState := receiving
        // like the sender, this statement should only happen for one cycle
        // by the time this state is done, the data should be valid going into the fifo, so it's ok to move from here to the next state
        io.out.valid := true.B
      }
        .otherwise {
          currentState := checkValid
        }
    }
  }
  when(currentState === checkValid) {
    io.in.ready := true.B
  }
    .elsewhen(currentState === receiving) {
      io.in.ready := false.B
    }
    .otherwise {
      io.in.ready := true.B
    }

}
// based on input, go perform addition in reset_test module and read outputs. Result should be either +1 or +2
// push start to start; can perform a reset if this test fails?
class domain_test_emu() extends Module {
  val io = IO(new Bundle {
    val clockA = Input(Clock())
    val in = Input(UInt(4.W))
    val start = Input(Bool())
    // val in_reset = Input(Bool())
    val out = Output(UInt(4.W))
  })
  val test = Module(new generic_domain_test())
  test.io.clockA := io.clockA
  test.io.in.bits := io.in
  io.out := test.io.out.bits
  // default "tick" assignments since I'm too lazy to find an easier alternative
  // reset := false.B
  test.io.in.valid := false.B
  test.io.out.ready := false.B

  val perform_reset :: done :: start :: write_in :: read_out :: Nil = Enum(5)
  val state = RegInit(done)
  switch(state) {
    is(done) {
      when(io.start) {
        state := write_in
      }
        .otherwise {
          state := done
        }
    }
    // is(perform_reset) {
    //   reset := true.B
    //   state := done
    // }
    is(write_in) {
      when(test.io.in.ready) {
        state := read_out
      }
        .otherwise {
          state := write_in
        }
    }
    is(read_out) {
      // read data out; might dequeue to early, so this might need to be registered
      // technically, due to the state machine, ready should be high for only one cycle
      when(test.io.out.valid) {
        state := done
      }
        .otherwise {
          state := read_out
        }
    }
  }
  when(state === read_out) {
    test.io.out.ready := true.B
  }
    .elsewhen(state === write_in) {
      test.io.in.valid := true.B
    }
}
// provide connections; purely combinational, driver will be hardware as a wrapper
class generic_domain_test() extends Module {
  val io = IO(new Bundle {
    val clockA = Input(Clock())
    val in = Flipped(Decoupled(UInt(4.W)))
    val out = Decoupled(UInt(4.W))
  })
  val from_main_to_domain = Module(new sync_to_sync(UInt(4.W)))
  // connect input and clock
  from_main_to_domain.io.clockA := io.clockA
  from_main_to_domain.io.in <> io.in
  val add_reset_test = withClockAndReset(io.clockA, reset.asAsyncReset) {
    Module(new add_reset_test())
  }
  // This takes the clock but flipped (io.clockA should be the main clock)
  val from_domain_to_main = withClockAndReset(io.clockA, reset.asAsyncReset) {
    Module(new sync_to_sync(UInt(4.W)))
  }
  // connect output from reset_test to next sync to sync module
  // not sure if this works since clock implicit clock is not usually used
  from_domain_to_main.io.clockA := clock
  add_reset_test.io.in <> from_main_to_domain.io.out
  from_domain_to_main.io.in <> add_reset_test.io.out
  from_domain_to_main.io.out <> io.out
}
// cdc module to combine the async modules together
// default clock is main clock
// clockA is new domain's clock
class sync_to_sync[T <: Data](gen: T) extends Module {
  val io = IO(new Bundle {
    // val clock = Input(Clock())
    // val reset = Input(Bool())
    val clockA = Input(Clock())
    val in = Flipped(Decoupled(gen))
    val out = Decoupled(gen)
  })
  val sync_in_async_out = Module(new async_io_out_generic(gen))

  val async_in_sync_out = withClock(io.clockA) {
    Module(new async_io_in_generic(gen))
  }
  sync_in_async_out.io.in <> io.in
  async_in_sync_out.io.in <> sync_in_async_out.io.out
  io.out <> async_in_sync_out.io.out
}
class add_reset_test() extends Module with RequireAsyncReset {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(4.W)))
    val out = Decoupled(UInt(4.W))
  })
  // without reset, I assume it will be at 0
  // val first :: second :: third :: fourth :: Nil = Enum(4)
  // val state = RegInit(fourth)
  // switch(state) {
  //   is(first) {
  //     state := second
  //   }
  //   is(second) {
  //     state := second
  //   }
  //   is(third) {
  //     state := third
  //   }
  //   is(fourth) {
  //     state := third
  //   }
  // }
  val regtemp = RegInit(15.U)
  // without reset, this should be + 1; with reset this should be + 2
  // regtemp := io.in.bits + state
  io.out.bits := regtemp + io.in.bits
  // dequeue from input since addition should be combinational and write to output
  // if not, this module's ready
  // when(io.in.valid) {
  //   io.in.ready := false.B
  //   io.out.valid := true.B
  // }
  //   .otherwise {
  //     io.in.ready := true.B
  //     io.out.valid := false.B
  //   }
  io.in.ready := true.B
  io.out.valid := false.B
  val read :: ready :: Nil = Enum(2)
  val state_decoupled_io = RegInit(ready)
  switch(state_decoupled_io) {
    is(read) {
      // reminder that ready is a "dequeue" signal, not a "ready for a new value" signal
      when (io.out.ready) {
        state_decoupled_io := ready
      }
      .otherwise {
        state_decoupled_io := read
      }
    }
    is (ready) {
      when (io.in.valid) {
        state_decoupled_io := read
        // every read will increment regtemp
        regtemp := regtemp + 1.U
      }
      .otherwise {
        state_decoupled_io := ready
      }
    }
  }

  when (state_decoupled_io === ready) {
    io.out.valid := false.B
    io.in.ready := true.B
  }
  .elsewhen (state_decoupled_io === read) {
    io.in.ready := false.B
    io.out.valid := true.B
  }
}
