`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2026 01:19:01 PM
// Design Name: 
// Module Name: EX_Mem_Latch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_Mem_Latch(
    input [1:0] WB,
    input [2:0] Mem,
    input [31:0] Add_Result,
    input Zero,
    input [31:0] ALU_Result,
    input [31:0] ReadData2_ex_mem,
    input [4:0] muxOut_5bit,
    input clk,
    input rst,
    input [1:0] EX_Mem_Latch_WB,
    input [2:0] EX_Mem_Latch_Mem,
    input [31:0] EX_Mem_Latch_Add_Result,
    input EX_Mem_Latch_Zero,
    input [31:0] EX_Mem_Latch_ALU_Result,
    input [31:0] EX_Mem_Latch_ReadData2_ex_mem,
    input [4:0] EX_Mem_Latch_muxOut_5bit
    );
endmodule
