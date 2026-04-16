`timescale 1ns / 1ps


module Instruction_Execute(
// - - - - - - inputs - - - - - -
    input [31:0]    NPC,
    input [31:0]    ReadData1,
    input [31:0]    ReadData2,
    input           ALU_Src,
    input [31:0]    SignExtend,
    input [3:0]     ALU_Op,
    input [4:0]     Instr_2016,
    input [4:0]     Instr_1511,
    input           RegDst,
    input [1:0]     WB,
    input [2:0]     Mem,
    input           clk,
    input           rst,
// - - - - - - outputs - - - - - -
//These all go for LATCH
    output [1:0]    IE_WB,
    output [2:0]    IE_Mem,
    output [31:0]   Add_Result,
    output          Zero,
    output [31:0]   ALU_Result,
    output [31:0]   ReadData2_ex_mem,
    output [4:0]    muxOut_5bit
    );

//Adder
    .inp_1(),
    .inp_2(),
    .Add_Result()

//ALU_control
    .ALU_Op(),
    .SignExtend(),
    .ALU_Control_outp(),

//ALU
    .ReadData1(), //a
    .Data2(), //b
    .control(), //added bc she had this
    .ALU_Result(),
    .zero_flag()

//Mux
    .sel(),
    .in_1(),
    .in_2(),
    .outp()


//Latch
// - - - - - - inputs - - - - - -
//Adder, ALU, ReadData2, Mux all feed into latch
    .WB(WB),
    .Mem(Mem),
    .Add_Result(Add_Result), 
    .Zero(),
    .ALU_Result(),
    .ReadData2_ex_mem(),
    .muxOut_5bit(),
    .clk(clk),
    .rst(rst),
// - - - - - - outputs - - - - - -
//THIS COMES FROM UP TOP OF FILE
    .EX_Mem_Latch_WB(IE_WB),
    .EX_Mem_Latch_Mem(IE_Mem),
    .EX_Mem_Latch_Add_Result(Add_Result),
   .EX_Mem_Latch_Zero(Zero),
    .EX_Mem_Latch_ALU_Result(ALU_Result),
    .EX_Mem_Latch_ReadData2_ex_mem(ReadData2_ex_mem),
    .EX_Mem_Latch_muxOut_5bit(muxOut_5bit)


endmodule