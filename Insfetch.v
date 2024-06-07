`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:38 04/19/2020 
// Design Name: 
// Module Name:    Insfetch 
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
module Insfetch(
    input clk,
    input reset,
	 input [7:0] jmp,
	 input [7:0] pcjmp,
	 output reg [7:0] pc,
    output [7:0] inscode
    );
reg [7:0] temp;
insmem i1(.pc(temp),.inscode(inscode));
always @(posedge clk)
begin
if(reset==1)
begin
temp <= 0;
pc <= 0;
end
else
begin
if(jmp[7:6]==2'b11)
begin
temp = {pcjmp[7:6],jmp[5:0]};
pc <= temp;
end
else
begin
temp = temp+1;
pc <= temp;
end
end
end
endmodule
