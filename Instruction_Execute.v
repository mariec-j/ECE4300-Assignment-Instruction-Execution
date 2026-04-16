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
    output [1:0]    IE_WB,
    output [2:0]    IE_Mem,
    output [31:0]   Add_Result,
    output          Zero,
    output [31:0]   ALU_Result,
    output [31:0]   ReadData2_ex_mem,
    output [4:0]    muxOut_5bit
    );
endmodule
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
    . ALU_Result(),
    .zero_flag()

//Latch
// - - - - - - inputs - - - - - -
    .WB(),
    .Mem(),
    .Add_Result(),
    .Zero(),
    .ALU_Result(),
    .ReadData2_ex_mem(),
    .muxOut_5bit(),
    .clk(),
    .rst(),
// - - - - - - outputs - - - - - -
    .EX_Mem_Latch_WB(),
    .EX_Mem_Latch_Mem(),
    .EX_Mem_Latch_Add_Result(),
   .EX_Mem_Latch_Zero(),
    .EX_Mem_Latch_ALU_Result(),
    .EX_Mem_Latch_ReadData2_ex_mem(),
    .EX_Mem_Latch_muxOut_5bit()

//Mux
    .sel(),
    .in_1(),
    .in_2(),
    .outp()