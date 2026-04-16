`timescale 1ns / 1ps

module IE_tb();

    reg [31:0]    NPC;
// All the valuesredest bench  
    reg [31:0]    ReadData1;
    reg [31:0]    ReadData2;
    reg           ALU_Src;
    reg [31:0]    SignExtend;
    reg [3:0]     ALU_Op;
    reg [4:0]     Instr_2016;
    reg [4:0]     Instr_1511;
    reg           RegDst;
    reg [1:0]     WB;
    reg [2:0]     Mem;
    reg           clk;
    reg           rst;
// - - - - - - outputs - - - - - -
    wire [1:0]    IE_WB;
    wire [2:0]    IE_Mem;
    wire [31:0]   Add_Result;
    wire          Zero;
    wire [31:0]   ALU_Result;
    wire [31:0]   ReadData2_ex_mem;
    wire [4:0]    muxOut_5bit;

Instruction_Execute UUT(
// - - - - - - inputs - - - - - -
    .NPC(NPC),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .ALU_Src(ALU_Src),
    .SignExtend(SignExtend),
    .ALU_Op(ALU_Op),
    .Instr_2016(Instr_2016),
    .Instr_1511(Instr_1511),
    .RegDst(RegDst),
    .WB(WB),
    .Mem(Mem),
    .clk(clk),
    .rst(rst),
// - - - - - - outputs - - - - - -
    .IE_WB(IE_WB),
    .IE_Mem(IE_Mem),
    .Add_Result(Add_Result),
    .Zero(Zero),
    .ALU_Result(ALU_Result),
    .ReadData2_ex_mem(ReadData2_ex_mem),
    .muxOut_5bit(muxOut_5bit)
);

    always forever #5 clk = ~clk;
    
    initial begin
    
    end


endmodule
