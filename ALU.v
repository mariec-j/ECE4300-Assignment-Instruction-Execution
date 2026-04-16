`timescale 1ns / 1ps

module ALU(
    input [31:0] ReadData1, //a
    input [31:0] Data2, //b
    input  [2:0]  control, //added bc she had this
    output [31:0] ALU_Result,
    output zero_flag
    );

reg [31:0] result;
parameter ALUadd = 3'b010;
parameter ALUsub = 3'b110;
parameter ALUand = 3'b000;     
parameter ALUor = 3'b001;
parameter ALUslt = 3'b111;

always@* begin
    case(control)
        ALUadd: result = ReadData1 + Data2;
        ALUsub: result = ReadData1 - Data2;
        ALUand: result = ReadData1 & Data2;
        ALUor: result = ReadData1 | Data2;
        ALUslt: result = ReadData1 < Data2 ? 1:0; // (0)
        default: result = 32'bX; // control = ALUx 
    endcase
end

assign zero = (result == 0) ? 1 : 0;
assign ALU_result = result;

endmodule