`timescale 1ns / 1ps

module ALU(
    input [31:0] ReadData1,
    input [31:0] Data2,
    input  [2:0]  control, //added bc she had this
    output [31:0] ALU_Result,
    output zero_flag
    );
endmodule

parameter ALUadd = 3'b010,
parameter ALUsub = 3'b110,
parameter ALUand = 3'b000,     
parameter ALUor = 3'b001,
parameter ALUslt = 3'b111;

always@* begin
    case(control)

ALUadd: result = a + b;
ALUsub: result = a - b;
ALUand: result = a & b;
ALUor: result = a | b;


ALUslt: result = a < b ? 1 - sign_mismatch // (1)
: 0 + sign_mismatch; // (0)
default: result = 32'bX; // control = ALUx | *
    endcase
end