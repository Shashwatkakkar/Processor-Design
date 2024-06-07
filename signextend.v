`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:03 04/20/2020 
// Design Name: 
// Module Name:    signextend 
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
module signextend(
    input [5:0] imm,
    input [1:0] insel,
    output reg [7:0] out
    );
always @(imm or insel)
begin
case(insel)
2'b00: out = 8'hf8+imm[2:0];  
endcase
end

endmodule
