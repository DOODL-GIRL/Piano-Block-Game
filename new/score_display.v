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


//��ģ�����߶������ʵʱ��ʾ��ǰ�÷�
module score_display(score,clk,rst_n,one,ten,hun,seg,an);
input [7:0] score;//Ҫ��ʾ�ĵ÷�(���255��
input clk;//ϵͳʱ��
input rst_n;//��λ�źţ��͵�ƽ��Ч��
input [3:0] one;
input [3:0] ten;
input [3:0] hun;
output reg [6:0] seg;//�����������ʾ�ź�
output reg [7:0] an;//����ܱ���ź�

wire clk_out;//�ṩɨ������ܵ�1000HZʱ��
divider #(100000/2)divider1000HZ(.clk(clk),.clk_out(clk_out));

reg [1:0] count;//��0����3�����ε������������	 
initial count=0;
always@(posedge clk_out)
begin
    if(count==3)count<=0;
    else count<=count+1;
end

reg [3:0]digit;//��ȡ�����١�ʮ����λ�����ָ���ʾ
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
      case(digit) //���� gfedcba ��˳��������ܵ�ƽ�����е͵�ƽ��ʾ�ùܷ���
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
