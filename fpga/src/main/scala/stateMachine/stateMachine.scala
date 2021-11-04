package stateMachine

import chisel3._
import chisel3.util._
import tools._

class StateMachine extends Module{
    val io = IO(new Bundle{
        val newFrameRecieved = Input(Bool())
        val bhDone = Input(Bool())
        val bhStartRegular = Output(Bool())
        val bhStartClear = Output(Bool())
        val loadNextFrame = Output(Bool())
        val lineIndex = Output(UInt(STD.lineIndexWidth))
    })

    io.bhStartRegular := false.B
    io.bhStartClear := false.B
    io.loadNextFrame := false.B

    val (lineIndex, lineWrap) = Counter(io.bhDone, STD.linenum)
    io.lineIndex := lineIndex
    val unrenderedFrame = RegInit(false.B)
    when(io.newFrameRecieved){
        unrenderedFrame := true.B
    }

    val waiting :: clearing :: rendering :: Nil = Enum(3)
    val state = RegInit(waiting)

    switch(state){
        is(waiting){
            when(unrenderedFrame){
                io.bhStartClear := true.B
                state := clearing
            }
        }
        is(clearing){
            when(io.bhDone && !lineWrap){
                io.bhStartClear := RegNext(true.B)
            }
            when(io.bhDone && lineWrap){
                io.loadNextFrame := true.B
                unrenderedFrame := false.B
                io.bhStartRegular := RegNext(true.B)
                state := rendering 
            }
        }
        is(rendering){
            when(io.bhDone && !lineWrap){
                io.bhStartRegular := RegNext(true.B)
            }
            when(io.bhDone && lineWrap){
                state := waiting
            }
        }
    }





}