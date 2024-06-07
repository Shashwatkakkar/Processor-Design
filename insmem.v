`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:13 04/19/2020 
// Design Name: 
// Module Name:    insmem 
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
module insmem(
    input [7:0] pc,
    output reg [7:0] inscode
    );
reg [7:0] Insmem [11:0];
always @(pc)
begin
$readmemh("Insmem.mem",Insmem);
inscode <= Insmem[pc];
end


endmodule
