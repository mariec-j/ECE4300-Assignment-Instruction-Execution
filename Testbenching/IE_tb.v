`timescale 1ns / 1ps

module IE_tb();

    reg [31:0]    NPC;
    reg [31:0]    ReadData1;
    reg [31:0]    ReadData2;
    reg           ALU_Src;
    reg [31:0]    SignExtend;
    reg [1:0]     ALU_Op;
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

    always #5 clk = ~clk;
    
    initial begin
        NPC = 0;
    	ReadData1 = 6;
    	ReadData2 = 7;
    	ALU_Src = 0;
    	SignExtend = 0;
    	ALU_Op = 0;
    	Instr_2016 = 6;
    	Instr_1511 = 7;
    	RegDst = 0;
    	WB = 3;        // At all times WB = 3
    	Mem = 6;       // At all times Mem = 6
    	clk = 0;
    	rst = 0;

    #5  rst = 1;
// Test the adder 
        NPC = 32'h10;
        SignExtend = 32'h11;
	// adder output should become 32'h21
	
// testing ALU_control and ALU
// Changing ALU_Op and Sign extend to see if output is as intended
    #10 ALU_Op = 0; // (Restating... lol) LW/SW,    ALU_control_out = 010,  ALU_Result = 13
    #10 ALU_Op = 2'b01; // Branch Equal,               ALU_control_out = 110,  ALU_result = -1
    #10 ALU_Op = 2'b10; // R-type,
        SignExtend[5:0] = 32'b100000; // add,       ALU_control_out = 010,  ALU_Result = 13
    #10 SignExtend[5:0] = 32'b100010; // sub,       ALU_control_out = 110,  ALU_Result = -1
    #10 SignExtend[5:0] = 32'b100100; // AND,       ALU_control_out = 000,  ALU_Result = 6
    #10 SignExtend[5:0] = 32'b100101; // OR,        ALU_control_out = 001,  ALU_Result = 7
    #10 SignExtend[5:0] = 32'b101010; // slt,       ALU_control_out = 111,  ALU_Result = 1
    #10 ReadData1 = 32'd10; // still slt,           ALU_control_out = 111,  ALU_Result = 0, Zero = 1
    
// test 32 bit mux
    #10 ALU_Src = 0;    // Restating,       mux_32_out = ReadData2 = 7
    #10 ALU_Src = 1; SignExtend = 32'h15; // mux_32_out = 32'h15
    
// test the 5 bit mux
    #10 RegDst = 0;     // Restating,   muxOut_5bit = 5'h6
    #10 RegDst = 1;     //              muxOut_5bit = 5'h7
	
    end

endmodule