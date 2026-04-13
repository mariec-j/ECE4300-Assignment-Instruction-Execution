`timescale 1ns / 1ps

module ALU_Control(
    input [1:0] ALU_Op,
    input [5:0] SignExtend,
    output reg [2:0] ALU_Control_outp
    );
    
    always @(*) begin
        case (ALU_Op)
            00: ALU_Control_outp = 010; // add
            
            01: ALU_Control_outp = 110; // sub
            
            10: begin // R-type
                case (SignExtend)
                    100000: ALU_Control_outp = 010; // add
                    100010: ALU_Control_outp = 110; // sub
                    100100: ALU_Control_outp = 000; // AND
                    100101: ALU_Control_outp = 001; // OR
                    101010: ALU_Control_outp = 111; // set on less than
                    default: ALU_Control_outp = 010; // default to add
                endcase
            end
            
            default: ALU_Control_outp = 010; // default to add
        endcase
    end
    
endmodule
