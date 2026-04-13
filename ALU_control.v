`timescale 1ns / 1ps

module ALU_Control(
    input [1:0] ALU_Op,
    input [5:0] SignExtend,
    output reg [2:0] ALU_Control_outp
    );
    
    always @(*) begin
        case (ALU_Op)
            00: ALU_Control_outp = 010;
            
            01: ALU_Control_outp = 110;
            
            10: begin
                case (SignExtend)
                    100000: ALU_Control_outp = 010;
                    100010: ALU_Control_outp = 110;
                    100100: ALU_Control_outp = 000;
                    100101: ALU_Control_outp = 001;
                    101010: ALU_Control_outp = 111;
                    default: ALU_Control_outp = 010;
                endcase
            end
            
            default: ALU_Control_outp = 010;
        endcase
    end
    
endmodule
