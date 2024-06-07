`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:12 04/20/2020 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input [7:0] a,
    input [7:0] b,
    input cont,
    output reg [7:0] out
    );
always @(*)
begin
case(cont)
0: out = a;
1: out = b;
endcase
end
endmodule
