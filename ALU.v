`timescale 1ns / 1ps

module ALU(
    input [31:0] ReadData1, //a
    input [31:0] Data2, //b
    input  [2:0]  control, //added bc she had this
    output [31:0] ALU_Result,
    output zero_flag
    );


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


ALUslt: ALU_Result = ReadData1 < Data2 ? 1 - sign_mismatch // (1)
: 0 + sign_mismatch; // (0)

default: ALU_Result = 32'bX; // control = ALUx | *
    endcase
end
assign zero = (result == 0) ? 1 : 0;

endmodule