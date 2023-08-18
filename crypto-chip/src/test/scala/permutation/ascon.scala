package ascon

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import ascon._
import permutation._
import layers._



// class encryptBehavior(dut:ascon, pcycle:Int) extends AnyFlatSpec with ChiselScalatestTester {
//   // "encryption" should "work" in {
//   //   test(new ascon()) { dut =>
//       dut.io.key.poke(BigInt("000102030405060708090A0B0C0D0E0F", 16))
//       // poke(dut.io.key, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.nounce, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//       poke(dut.io.tagin, "h00000000000000000000000000000000".U)

//       poke(dut.io.start, true.B)
//       poke(dut.io.empty, false.B)
//       poke(dut.io.full,false.B)
//       poke(dut.io.mode, 1.U)
//       step(1)
//       poke(dut.io.start, false.B)
//       for (j <- 0 until pcycle*20) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  
//         //println("State: " + peek(dut.io.state).toString(16) + " Warning: " + peek(dut.io.warning).toString(16))   
//       }
//       step(1)
//       poke(dut.io.empty, true.B)
//       poke(dut.io.message, "h80000000000000000000000000000000".U)
//       println("Push: " + peek(dut.io.push).toString
//       (16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  

//       for (j <- 0 until pcycle*8) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  
//       }
//       step(1)
//       poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//       println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  

//       for (j <- 0 until pcycle*8) {
//         step(1)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  
//       }
//       step(1)
//       poke(dut.io.full, true.B)
//       poke(dut.io.message, "h80000000000000000000000000000000".U)
//       println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  

//       for (j <- 0 until 80) {
//         step(1)
//         poke(dut.io.message, "h00000000000000000000000000000000".U)
//         println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  
//       }
//     // }
//   // }


// }


// class decryptBehavior(dut:ascon, pcycle:Int) extends PeekPokeTester(dut) {
//   poke(dut.io.key, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.nounce, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.message, "h000102030405060708090A0B0C0D0E0F".U)
//   poke(dut.io.tagin, "h316d7ab17724ba67a85ecd3c0457c459".U)
//   //poke(dut.io.data, "h8000000000000000".U)
//   poke(dut.io.start, true.B)
//   poke(dut.io.empty, false.B)
//   poke(dut.io.full, false.B)
//   poke(dut.io.mode, 3.U)
//   step(1)
//   poke(dut.io.start, false.B)
//   for (j <- 0 until pcycle*20) {
//     step(1)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))  
//     //println("State: " + peek(dut.io.state).toString(16) + " Warning: " + peek(dut.io.warning).toString(16))   
//   }
//   step(1)
//   poke(dut.io.empty, true.B)
//   poke(dut.io.message, "h80000000000000000000000000000000".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))  
  
//   for (j <- 0 until pcycle*8) {
//     step(1)
//     poke(dut.io.message, "h00000000000000000000000000000000".U)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))    
//   }
//   step(1)
//   poke(dut.io.message, "h52499ac9c84323a4ae24eaeccf45c137".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))

//   for (j <- 0 until pcycle*8) {
//     step(1)
//     poke(dut.io.message, "h00000000000000000000000000000000".U)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))   
//   }
//   step(1)
//   poke(dut.io.full, true.B)
//   poke(dut.io.message, "h0000000000000000000000000000000".U)
//   println("Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16))  

//   for (j <- 0 until 80) {
//     step(1)
//     println(j + "Push: " + peek(dut.io.push).toString(16) + " Pull: " + peek(dut.io.pull).toString(16) + " Done: " + peek(dut.io.done).toString(16) + " Cipher: " + peek(dut.io.cipher).toString(16) + " Valid: " + peek(dut.io.valid).toString(16) + " Tag: " + peek(dut.io.tagout).toString(16))  
//   }
// }


class hashBehavior extends AnyFlatSpec with ChiselScalatestTester {
  "hash" should "work" in {
    test(new ascon) { dut =>
      val pcycle = 2
      dut.io.key.poke("h00000000000000000000000000000000".U)
      dut.io.nounce.poke("h00000000000000000000000000000000".U)
      dut.io.tagin.poke("h00000000000000000000000000000000".U)
      dut.io.message.poke("h00010203040506070000000000000000".U)
      // poke(dut.io.key, "h00000000000000000000000000000000".U)
      // poke(dut.io.nounce, "h00000000000000000000000000000000".U)
      // poke(dut.io.tagin, "h00000000000000000000000000000000".U)
      // poke(dut.io.message, "h00010203040506070000000000000000".U)
      //poke(dut.io.message, "h8000000000000000".U)
      dut.io.start.poke(true.B)
      dut.io.empty.poke(false.B)
      dut.io.full.poke(false.B)
      dut.io.mode.poke(5.U)
      // poke(dut.io.start, true.B)
      // poke(dut.io.empty, false.B)
      // poke(dut.io.full, false.B)
      // poke(dut.io.mode, 5.U)
      dut.clock.step()
      dut.io.start.poke(false.B)
      //step(1)
      //poke(dut.io.start, false.B)
      for (j <- 0 until pcycle*20) {
        dut.clock.step()
        //step(1)
        println(j + "Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull.peek() + " Done: " + dut.io.done.peek() + " Result: " + dut.io.cipher.peek())  
      }
        dut.clock.step()
        //step(1)
        dut.io.message.poke("h08800000000000000000000000000000".U)
        //poke(dut.io.message, "h08800000000000000000000000000000".U)
        //poke(dut.io.message, "h0000000000000000".U)
        // poke(dut.io.empty, true.B)
        dut.io.empty.poke(true.B)
        println("*Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull.peek() + " Done: " + dut.io.done.peek() + " Result: " + dut.io.cipher.peek())  

      for (j <- 0 until 80) {
        dut.clock.step()
        //step(1)
        dut.io.message.poke("h00000000000000000000000000000000".U)
        // poke(dut.io.message, "h00000000000000000000000000000000".U)
        println("Push: " + dut.io.push.peek() + " Pull: " + dut.io.pull.peek() + " Done: " + dut.io.done.peek() + " Result: " + dut.io.cipher.peek())   
      }
    }
  }
}


class wrappertest extends AnyFlatSpec with ChiselScalatestTester {
  "wrapper" should "work" in {
    test(new permutation_two_wrapper) { dut =>
      var pcycle = 13
      // poke(dut.io.s_in, "hfe9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140".U)
      dut.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
      dut.io.round.poke(12.U)
      dut.io.start.poke(true.B)
      dut.clock.step()
      dut.io.start.poke(false.B)
      for (j <- 0 until 10+(pcycle-1)*12) {
        dut.clock.step()
        println("Done: " + (dut.io.done.peek()) + " Result is: " + (dut.io.s_out.peek()))
      }
      println("finished processing first permutations")
      dut.clock.step()
      dut.io.s_in.poke("h00400c00000000000000000000000000000000000000000000000000000000000000000000000000".U)
      dut.io.start.poke(true.B)
      println("*Done: " + (dut.io.done.peek()) + " Result is: " + (dut.io.s_out.peek()))
      dut.clock.step()
      dut.io.start.poke(false.B)
      for (j <- 0 until 11+(pcycle-1)*12) {
        dut.clock.step()
        println("Done: " + (dut.io.done.peek()) + " Result is: " + (dut.io.s_out.peek()))
      }
    }
  }
}

// object decryptBehavior extends App {
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  decryptBehavior(c, 2)
//   }
// }

// object encryptBehavior extends App {
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  encryptBehavior(c, 2)
//   }
// }


// object hashBehavior extends App {
//   ""
//   chisel3.iotesters.Driver(() => new ascon) { c =>
//     new  hashBehavior(c, 2)
//   }
// }


// object newBehavior extends App {
//   chisel3.iotesters.Driver(() => new permutation_one_wrapper()) { c =>
//     new newBehavior(c, 2)
//   }
// }