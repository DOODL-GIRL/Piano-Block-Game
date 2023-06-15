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
input  [7:0] bin;//����Ķ�������
input  clk;//ʱ��
input rst_n;//��λ�źţ��͵�ƽ��Ч��
output reg [3:0] one;//��λ 
output reg [3:0] ten;//ʮλ
output reg [3:0] hun;//��λ

reg [3:0] count = 0;//��λ��������
reg [19:0]shift_reg=20'b00000000000000000000;

// ��������
always @ ( posedge clk or negedge rst_n )
begin
 if( !rst_n )
   count<=0;
 else if (count==8)
   count<=0;
 else
   count<=count+1;
end

// ������ת��Ϊʮ���� 
always @ (posedge clk or negedge rst_n )
begin
  if (!rst_n)
       shift_reg=0;
  else if (count==0)
       shift_reg={12'b000000000000,bin};
  else if (count<=8)                //ʵ��8����λ����
  begin
      if(shift_reg[11:8]>=5)         //�жϸ�λ�Ƿ�>5���������+3  
      begin
          if(shift_reg[15:12]>=5) //�ж�ʮλ�Ƿ�>5���������+3  
          begin
              shift_reg[15:12]=shift_reg[15:12]+2'b11;   
              shift_reg[11:8]=shift_reg[11:8]+2'b11;
              shift_reg=shift_reg<<1;  //�Ը�λ��ʮλ������������������
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

//�����ֵ
always @ ( posedge clk or negedge rst_n )
begin
 if ( !rst_n )
  begin
    one<=0;
    ten<=0;
    hun<=0; 
  end
 else if (count==8)  //��ʱ8����λȫ����ɣ�����Ӧ��ֵ�ֱ𸳸���,ʮ,��λ
  begin
    one<=shift_reg[11:8];
    ten<=shift_reg[15:12];
    hun<=shift_reg[19:16]; 
  end
 else;
end
endmodule
