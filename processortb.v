`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:37:41 04/23/2020
// Design Name:   processor
// Module Name:   E:/xilinx/pipeline/processortb.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module processortb;// Inputs
	reg clk;
	reg reset;
// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		repeat(60)
		#5 clk =~ clk;
		$finish;
	end
		initial begin
		reset = 1;
		#10;
		reset = 0;
		#10;
		reset = 0;
		#10;
		reset = 0;
		#100;
		$finish;
	end
endmodule

