`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:48 04/20/2020 
// Design Name: 
// Module Name:    processor 
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
module processor(
    input clk,
    input reset
    );
wire [7:0] inscode; wire [7:0] pc; wire [7:0] jmpaddr;
wire [7:0] toreg; wire fwdcont;
wire [7:0] data1; wire [7:0] data2;wire [1:0] cont; wire immsel;wire regwrite;
wire [7:0] immgen; wire [7:0] fwddata; wire [7:0] toalu; wire [7:0] aluout;wire [7:0] wbdata;

//////
reg [27:0] idextemp;reg [7:0] exwbtemp;//used as temporary registers to hold the valuse of generated data at each stages
reg [7:0] If_Id; reg [33:0] Id_Ex; reg [25:0] Ex_Wb;  //pipeline registers
//Instantiated blocks
Insfetch If(.clk(clk),.reset(reset),.jmp(inscode),.pcjmp(pc),.inscode(inscode),.pc(pc));

regfile rg(.readreg1(If_Id[5:3]),.readreg2(If_Id[2:0]),.writereg(Ex_Wb[7:5]),.reset(reset),.regwrite(Ex_Wb[1]),
	 .writedata(wbdata),.data1(data1), .data2(data2));
	 
controlunit contt(.opcode(If_Id[7:6]),.insel(cont),.immsel(immsel),.regwrite(regwrite));
	
signextend imm(.imm(If_Id[5:0]),.insel(cont),.out(immgen));

mux forward(.a(Id_Ex[25:18]),.b(fwddata),.cont(fwdcont),.out(toalu));

alu ex(.data1(Id_Ex[33:26]),.data2(toalu),.result(aluout));

forwardunit fwd(.rd(Ex_Wb[7:5]),.rs(Id_Ex[2:0]),.result(Ex_Wb[23:16]),.immval(Ex_Wb[15:8]),.opcode(Ex_Wb[25:24]),
.out(fwddata),.forward(fwdcont));

mux wbmux(.a(Ex_Wb[23:16]),.b(Ex_Wb[15:8]),.cont(Ex_Wb[0]),.out(wbdata));
/// end of instantiation
always @(posedge clk)begin
if(reset==1)begin
If_Id <= 0;
Id_Ex <= 0;
Ex_Wb <= 0;
idextemp <= 0;
exwbtemp <= 0;
end
//Id_Ex pipeline reg contains datareg1 in [33:26],datareg2 in [25:18],imm value(for li)in [17:10], opcode in [9:8],
//regwrite signal in 7th bit and immsel used to select imm value in writeback stage in 6th bit
//rd address in [5:3],rs in [2:0]
//Ex_Wb pipeline reg contains opcode in [25:24],alu result in [23:16],imm value in [15:8],rd in [7:5],
// rs-[4:2],regwrite-1st bit, immsel in 0th bit   
else begin
If_Id <= inscode; // contains instruction code (inscode)
Id_Ex <= {idextemp,If_Id[5:3],If_Id[2:0]};
Ex_Wb <= {Id_Ex[9:8],exwbtemp,Id_Ex[17:10],Id_Ex[5:3],Id_Ex[2:0],Id_Ex[7],Id_Ex[6]};
assign idextemp = {data1,data2,immgen,cont,regwrite,immsel}; //continuous assignment of temporary registers
assign exwbtemp = aluout;  
end
end
endmodule
