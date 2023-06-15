`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:37:48
// Design Name: 
// Module Name: music_creator
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


module music_creator(
    input clk,//100MHZ系统时钟
    input rst_n,//复位信号（低电平有效）
    input [3:0] status,//当前游戏状态
    input [6:0] tone, //音调
    input [2:0] pitch, //音高
    output reg speaker//扬声器
    );

	wire [6:0] high, middle, low; //定义低中高音

	//调用分频模块
	//低音1~7(分别为low[0]~low[7])
	divider #(388200/2) d_l1(.clk(clk),.clk_out(low[0]));
	divider #(340500/2) d_l2(.clk(clk),.clk_out(low[1]));
	divider #(303300/2) d_l3(.clk(clk),.clk_out(low[2]));
	divider #(286300/2) d_l4(.clk(clk),.clk_out(low[3]));
	divider #(255100/2) d_l5(.clk(clk),.clk_out(low[4]));
	divider #(227200/2) d_l6(.clk(clk),.clk_out(low[5]));
	divider #(202500/2) d_l7(.clk(clk),.clk_out(low[6]));
					  
	//中音1~7(分别为middle[0]~middle[7])
	divider #(191100/2) d_m1(.clk(clk),.clk_out(middle[0]));
	divider #(170200/2) d_m2(.clk(clk),.clk_out(middle[1]));
	divider #(151600/2) d_m3(.clk(clk),.clk_out(middle[2]));
	divider #(143100/2) d_m4(.clk(clk),.clk_out(middle[3]));
	divider #(127500/2) d_m5(.clk(clk),.clk_out(middle[4]));
	divider #(113600/2) d_m6(.clk(clk),.clk_out(middle[5]));
	divider #(101200/2) d_m7(.clk(clk),.clk_out(middle[6]));
					  				  
	//高音1~7(分别为high[0]~high[7])
	divider #(95600/2) d_h1(.clk(clk),.clk_out(high[0]));
	divider #(85100/2) d_h2(.clk(clk),.clk_out(high[1]));
	divider #(75800/2) d_h3(.clk(clk),.clk_out(high[2]));
	divider #(71500/2) d_h4(.clk(clk),.clk_out(high[3]));
	divider #(63700/2) d_h5(.clk(clk),.clk_out(high[4]));
	divider #(56800/2) d_h6(.clk(clk),.clk_out(high[5]));
	divider #(50600/2) d_h7(.clk(clk),.clk_out(high[6]));
	
	always@(pitch,tone,rst_n)
	begin
	if(!rst_n||status!=3'b010) speaker<=0;
    //高音部分
    else if(pitch == 3'b001)    
    begin
        case(tone)
            7'b000_0000:begin speaker<=0; end
            7'b000_0001:begin speaker<=high[0]; end
            7'b000_0010:begin speaker<=high[1]; end
            7'b000_0100:begin speaker<=high[2]; end
            7'b000_1000:begin speaker<=high[3]; end
            7'b001_0000:begin speaker<=high[4]; end
            7'b010_0000:begin speaker<=high[5]; end
            7'b100_0000:begin speaker<=high[6]; end
        endcase
    end
     
    //中音部分
    else if(pitch == 3'b010)
    begin
        case(tone)
            7'b000_0000:begin speaker<=0; end
            7'b000_0001:begin speaker<=middle[0]; end
            7'b000_0010:begin speaker<=middle[1]; end
            7'b000_0100:begin speaker<=middle[2]; end
            7'b000_1000:begin speaker<=middle[3]; end
            7'b001_0000:begin speaker<=middle[4]; end
            7'b010_0000:begin speaker<=middle[5]; end
            7'b100_0000:begin speaker<=middle[6]; end
        endcase
    end
    
    //低音部分
    else if(pitch == 3'b100)
    begin
        case(tone)
            7'b000_0000:begin speaker<=0; end
            7'b000_0001:begin speaker<=low[0]; end
            7'b000_0010:begin speaker<=low[1]; end
            7'b000_0100:begin speaker<=low[2]; end
            7'b000_1000:begin speaker<=low[3]; end
            7'b001_0000:begin speaker<=low[4]; end
            7'b010_0000:begin speaker<=low[5]; end
            7'b100_0000:begin speaker<=low[6]; end
            endcase
        end
         
    else speaker<=0;
	end
endmodule