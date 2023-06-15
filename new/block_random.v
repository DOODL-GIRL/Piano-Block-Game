`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:49:42
// Design Name: 
// Module Name: block_random
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


module block_random(
    input [6:0]addr,//��ǰ��ȡ��������ַ
    input [6:0]cur_tone,//��ǰ��������������
    input [2:0]cur_pitch,//��ǰ���ŵ�����������
    output reg [7:0] v_enb//ѡ����ָ��ٿ�Ĺ��
    );

   always@(addr)
   begin
       if(addr%8==0) v_enb = 8'b0000_0001;
       else if(addr%8==1) v_enb = 8'b0001_0000;
       else if(addr%8==2) v_enb = 8'b0100_0100;
       else if(addr%8==3) v_enb = 8'b0010_1000;
       else if(addr%8==4) v_enb = 8'b0000_0100;
       else if(addr%8==5) v_enb = 8'b0010_0010;
       else if(addr%8==6) v_enb = 8'b1000_0000;
       else if(addr%8==7) v_enb = 8'b0000_0001;
       else v_enb = 8'b0000_0000;
       end
 
endmodule