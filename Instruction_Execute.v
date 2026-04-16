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

//internal wires the 5 outputs of aadder, ALU, MUX, ALUcontrol, Mux2
wire [31:0] adder_32_out; //output of adder
wire [31:0] mux_32_out; //mux 32 bit output
wire [31:0] alu_32_out; // 32 bit output of alue
wire [2:0] ALU_control_out;//output of ALU control
wire [4:0] mux_5_out;//output of second mux



//Adder
//
    .inp_1(NPC),
    .inp_2(SignExtend),
    .Add_Result()

//ALU_control
    .ALU_Op(),
    .SignExtend(),
    .ALU_Control_outp(),

//ALU
    .ReadData1(ReadData1), //a
    .Data2(), //b
    .control(), //added bc she had this
    .ALU_Result(),
    .zero_flag()

//Mux
    .sel(ALU_Src),
    .in_1(Instr_2016),
    .in_2(Instr_1511),
    .outp()


//Latch
// - - - - - - inputs - - - - - -

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