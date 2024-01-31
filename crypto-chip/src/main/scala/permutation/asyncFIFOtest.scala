package layers
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource

// This is an output async interface based on a ready-valid IO. the output will be handshaked, while the input will be a standard valid-ready io.

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
        is (sending) {
            // This state is in charge of checking for a ready signal that's false. This means the output has acknowledged and read in data and the "transaction" can be finished.
            // The next response is to set valid to false to start the completion of the "transaction"
            when (!io.out.ready) {
                currentState := checkReady
                // since this is the last action with the async on the outside, this should only happen for one cycle
                io.in.ready := true.B
            }
            .otherwise {
                currentState := sending
            }
        }
        is (checkReady) {
            // This state is in charge of checking if the ready signal of the fifo to write to is true and also that the queue is not empty (valid is true).
            when (io.out.ready & io.in.valid) {
                currentState := sending
                // when sending, the valid signal must be set true as soon as possible, so here?
            }
            .otherwise {
                currentState := checkReady
            }
        }
    }
    when (currentState === checkReady) {
        io.out.valid := false.B
    }
    .elsewhen(currentState === sending) {
        io.out.valid := true.B
    }
    .otherwise {
        io.out.valid := false.B
    }
}

// This is an input async interface based on a ready-valid IO. the input will be handshaked, while the output will be a standard valid-ready io.
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
        is (receiving) {
            // This state is in charge of receiving a valid signal of 0. The next response is to set the ready signal back to true and complete the "transaction"
            // another way of seeing this is when input's valid is true, the ready signal is false
            when (!io.in.valid) {
                currentState := checkValid
            }
            .otherwise {
                currentState := receiving
            }
        }
        is (checkValid) {
            // this is in charge of mainly checking for a valid signal from outside. Also prevents acknowledging the valid signal if the queue is empty (ready is false).
            // Ideally, if the queue is full, don't set the ready signal to true.
            // The next response is setting ready to true and also reading in data into the input queue
            when (io.in.valid & io.out.ready) {
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
    when (currentState === checkValid) {
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
        val clockA = Input(Bool())
        val resetA = Input(Bool())
        val clockB = Input(Bool())
        val resetB = Input(Bool())
        val in = Flipped(Decoupled(UInt(numberOfBits.W)))
        val out = Decoupled(UInt(numberOfBits.W))
    })
    // input side:
        // checkReady: ready = 1
        // send: valid from 0 to 1
        // send_ack: ready from 1 to 0
        // end/finish: valid from 1 to 0
        // end_ack: ready from 0 to 1
    val one = withClockAndReset(io.clockA.asClock, io.resetA) {
        Module(new fifo_one(numberOfBits))
    }
    one.io.in <> io.in
    // output side:
        // check valid: valid = 1 (0 to 1)
        // recv ack: ready from 1 to 0
        // finish: valid 1 to 0
    val two = withClockAndReset(io.clockB.asClock, io.resetB) {
        Module(new fifo_two(numberOfBits))
    }
    two.io.in <> one.io.out

    io.out <> two.io.out
}
