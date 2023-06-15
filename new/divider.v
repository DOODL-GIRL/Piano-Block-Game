`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:38:36
// Design Name: 
// Module Name: divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divider(clk, clk_out);

	parameter DIV_NUM = 1; //对时钟进行分频
	
	input clk;
	output reg clk_out;
	reg [31:0]count;
	
	always@(posedge clk)
	begin
		if(count == DIV_NUM)
		begin
			clk_out <= !clk_out;
			count <= 0;
		end
		else
			count <= count + 1;
	end
	
endmodule
