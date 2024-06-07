`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:05:39 04/20/2020 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
    input [2:0] readreg1,
    input [2:0] readreg2,
    input reset,
	 input regwrite,
	 input [2:0] writereg,
	 input [7:0] writedata,
    output reg [7:0] data1,
    output reg [7:0] data2
    );
reg [7:0] fixreg [7:0];
always @(readreg1 or readreg2 or writedata)
begin
if(reset==1)
begin
fixreg[0] = 'd0; fixreg[1] = 'd1; fixreg[2] = 'd2; 
fixreg[3] = 'd3; fixreg[4] = 'd4; fixreg[5] = 'd5; fixreg[6] = 'd6; fixreg[7] = 'd7;
data1 <= fixreg[readreg1];
data2 <= fixreg[readreg2];
if(regwrite==1)
begin
fixreg[writereg] <= writedata;
end
end
else
begin
if(writereg==readreg1)
begin
data1 <= writedata;
end
else
begin
data1 <= fixreg[readreg1];
end
if(writereg==readreg2)
begin
data2 <= writedata;
end
else
begin
data2 <= fixreg[readreg2];
end
if(regwrite==1)
begin
fixreg[writereg] <= writedata;
end
end
end
endmodule
