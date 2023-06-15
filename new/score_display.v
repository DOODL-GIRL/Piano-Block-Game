`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 16:08:29
// Design Name: 
// Module Name: score_display
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


//本模块用七段数码管实时显示当前得分
module score_display(score,clk,rst_n,one,ten,hun,seg,an);
input [7:0] score;//要显示的得分(最多255）
input clk;//系统时钟
input rst_n;//复位信号（低电平有效）
input [3:0] one;
input [3:0] ten;
input [3:0] hun;
output reg [6:0] seg;//单个数码管显示信号
output reg [7:0] an;//数码管编号信号

wire clk_out;//提供扫描数码管的1000HZ时钟
divider #(100000/2)divider1000HZ(.clk(clk),.clk_out(clk_out));

reg [1:0] count;//从0数到3，依次点亮三个数码管	 
initial count=0;
always@(posedge clk_out)
begin
    if(count==3)count<=0;
    else count<=count+1;
end

reg [3:0]digit;//截取分数百、十、个位数，分个显示
always @(count)
      if(!rst_n) begin digit <= 0;  an<=8'b1111_1111; end
      else
      begin
	  case(count)
	     0:begin digit <= one; an<=8'b1111_1110; end 
	     1:begin digit <= ten; an<=8'b1111_1101; end 
	     2:begin digit <= hun; an<=8'b1111_1011; end
	     default:begin digit <= 0;  an<=8'b1111_1111; end
	  endcase
	  end
	  
always @(digit)
      case(digit) //按照 gfedcba 的顺序表明各管电平，其中低电平表示该管发光
          0:seg = 7'b1000000;			
          1:seg = 7'b1111001;
          2:seg = 7'b0100100;							
          3:seg = 7'b0110000;							 	
          4:seg = 7'b0011001;						    
          5:seg = 7'b0010010;                                    
          6:seg = 7'b0000010;
          7:seg = 7'b1111000;
          8:seg = 7'b0000000;
          9:seg = 7'b0010000;
          default: seg = 7'b0000000;
      endcase

endmodule
