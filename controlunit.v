`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:37 04/20/2020 
// Design Name: 
// Module Name:    controlunit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module controlunit(
    input [1:0] opcode,
    output reg [1:0] insel,
    output reg immsel,
	 output reg regwrite
    );
always @(opcode)
begin
case(opcode)
2'b00: begin
		insel = opcode;
		immsel = 1;
		regwrite = 1;  
		end
2'b01: begin
		insel = opcode;
		immsel = 0;
		regwrite = 1;
		end
2'b11: begin
		insel = opcode;
		immsel = 0;
		regwrite = 0;
		end
endcase
end
endmodule
