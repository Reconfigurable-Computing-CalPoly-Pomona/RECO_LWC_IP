package layers
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource

// clock A
class fifo_one extends Module {
    val io = IO(new Bundle {
        val in = Flipped(Decoupled(UInt(1.W)))
        val out = Decoupled(UInt(1.W))
    })
    // create queue with depth 4, size 1
    val queue = Module(new Queue(UInt(1.W), 4))
    queue.io.enq <> io.in
    // connect the queue data and output data
    io.out.bits := queue.io.deq.bits

    val regReady = RegInit(false.B)
    val regvalid = RegInit(false.B)
    
    // set deq's ready to false by default to prevent multiple reads
    queue.io.deq.ready := false.B

    // set valid to false by default since that there's no data by default
    io.out.valid := false.B
    
    val sending :: checkReady :: Nil = Enum(2)
    val currentState = RegInit(checkReady)
    switch(currentState) {
        is (sending) {
            when (!io.out.ready) {
                currentState := checkReady
                // since this is the last action with the async on the outside, this should only happen for one cycle
                queue.io.deq.ready := true.B
            }
            .otherwise {
                currentState := sending
                io.out.valid := true.B
            }
        }
        is (checkReady) {
            when (io.out.ready & queue.io.deq.valid) {
                currentState := sending
                io.out.valid := true.B
            }
            .otherwise {
                currentState := checkReady
            }
        }
    }
}

// clock B
class fifo_two extends Module {
    val io = IO(new Bundle {
        val in = Flipped(Decoupled(UInt(1.W)))
        val out = Decoupled(UInt(1.W))
    })
    // create queue with depth 4, size 1
    val queue = Module(new Queue(UInt(1.W), 4))
    // queue.io.enq <> io.in
    
    queue.io.enq.bits := io.in.bits
    
    
    // when (queue.io.enq.ready) {
        //     io.in.ready := true.B
        // }
        
    val regReady = RegInit(true.B)
    val regvalid = RegInit(false.B)
    // main problem with this is when queue is full, ready should be false, not true
        // but also it will become false for other reasons in the state machine
    // This may cause the sender to get stuck waiting for the ready signal to go from 1 to 0 until the queue has space again
    io.in.ready := true.B

    queue.io.enq.valid := false.B

    io.out <> queue.io.deq

    val receiving :: checkValid :: Nil = Enum(2)
    val currentState = RegInit(checkValid)
    switch(currentState) {
        is (receiving) {
            when (!io.in.valid) {
                currentState := checkValid
            }
            .otherwise {
                io.in.ready := false.B
                currentState := receiving
            }
        }
        is (checkValid) {
            when (io.in.valid & queue.io.enq.ready) {
                currentState := receiving
                io.in.ready := false.B
                // like the sender, this statement should only happen for one cycle
                queue.io.enq.valid := true.B
            }
            .otherwise {
                currentState := checkValid
            }
        }
    }
}

class top extends Module {
    val io = IO(new Bundle {
        val clockA = Input(Clock())
        val resetA = Input(Bool())
        val clockB = Input(Clock())
        val resetB = Input(Bool())
        val in = Flipped(Decoupled(UInt(1.W)))
        val out = Decoupled(UInt(1.W))
    })
    // input side:
        // checkReady: ready = 1
        // send: valid from 0 to 1
        // send_ack: ready from 1 to 0
        // end/finish: valid from 1 to 0
        // end_ack: ready from 0 to 1
    val one = withClockAndReset(io.clockA, io.resetA) {
        Module(new fifo_one)
    }
    one.io.in <> io.in
    // output side:
        // check valid: valid = 1 (0 to 1)
        // recv ack: ready from 1 to 0
        // finish: valid 1 to 0
    val two = withClockAndReset(io.clockB, io.resetB) {
        Module(new fifo_two)
    }
    two.io.in <> one.io.out

    io.out <> two.io.out
}
