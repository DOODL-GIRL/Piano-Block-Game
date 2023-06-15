`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 16:07:47
// Design Name: 
// Module Name: bin_dec
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


module bin_dec(clk,bin,rst_n,one,ten,hun);
input  [7:0] bin;//输入的二进制数
input  clk;//时钟
input rst_n;//复位信号（低电平有效）
output reg [3:0] one;//个位 
output reg [3:0] ten;//十位
output reg [3:0] hun;//百位

reg [3:0] count = 0;//移位次数计数
reg [19:0]shift_reg=20'b00000000000000000000;

// 计数部分
always @ ( posedge clk or negedge rst_n )
begin
 if( !rst_n )
   count<=0;
 else if (count==8)
   count<=0;
 else
   count<=count+1;
end

// 二进制转换为十进制 
always @ (posedge clk or negedge rst_n )
begin
  if (!rst_n)
       shift_reg=0;
  else if (count==0)
       shift_reg={12'b000000000000,bin};
  else if (count<=8)                //实现8次移位操作
  begin
      if(shift_reg[11:8]>=5)         //判断个位是否>5，如果是则+3  
      begin
          if(shift_reg[15:12]>=5) //判断十位是否>5，如果是则+3  
          begin
              shift_reg[15:12]=shift_reg[15:12]+2'b11;   
              shift_reg[11:8]=shift_reg[11:8]+2'b11;
              shift_reg=shift_reg<<1;  //对个位和十位操作结束后，整体左移
          end
          else
          begin
              shift_reg[15:12]=shift_reg[15:12];
              shift_reg[11:8]=shift_reg[11:8]+2'b11;
              shift_reg=shift_reg<<1;
          end
      end              
      else
      begin
          if(shift_reg[15:12]>=5)
          begin
              shift_reg[15:12]=shift_reg[15:12]+2'b11;
              shift_reg[11:8]=shift_reg[11:8];
              shift_reg=shift_reg<<1;
          end
          else
          begin
              shift_reg[15:12]=shift_reg[15:12];
              shift_reg[11:8]=shift_reg[11:8];
              shift_reg=shift_reg<<1;
          end
      end        
  end
end

//输出赋值
always @ ( posedge clk or negedge rst_n )
begin
 if ( !rst_n )
  begin
    one<=0;
    ten<=0;
    hun<=0; 
  end
 else if (count==8)  //此时8次移位全部完成，将对应的值分别赋给个,十,百位
  begin
    one<=shift_reg[11:8];
    ten<=shift_reg[15:12];
    hun<=shift_reg[19:16]; 
  end
 else;
end
endmodule
