`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:55 04/21/2020 
// Design Name: 
// Module Name:    forwardunit 
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
module forwardunit(
    input [2:0] rd,
    input [2:0] rs,
    input [7:0] result,
	 input [7:0] immval,
	 input [1:0] opcode,
    output reg [7:0] out,
	 output reg forward
    );
always @(rd or rs)begin
if(rd==rs)
begin
forward = 1;
if(opcode==2'b01)
begin
out <= result;
end
if(opcode==2'b00)
begin
out <= immval;
end
end
else
begin
forward = 0;
end
end
endmodule
