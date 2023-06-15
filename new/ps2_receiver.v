`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:55:58
// Design Name: 
// Module Name: ps2_receiver
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


//���Ӽ��̽��յ����ַ��洢��keycode��
module ps2_receiver(
    input clk,//ϵͳʱ��
    input kclk,//����ʱ��
    input kdata,//��������
    input rst_n,//�����ź�
    output reg [31:0] keycode = 0//�洢�Ӽ��̶�����ɨ����
    );
reg [7:0] datacur;//��ǰ������8λ����
reg [3:0] cnt;//0~10��������ȡһ���ֽ�

//���̰�������
reg [2:0] ps2_clk_sync = 3'b111;
always @ (posedge clk) 
    ps2_clk_sync<={ps2_clk_sync[1:0],kclk};
wire sampling = ps2_clk_sync[2]&~ps2_clk_sync[1];

always@(posedge clk) 
begin
    if (!rst_n) begin cnt=0; keycode=0; datacur=0; end
    else if(sampling)
    begin
        if(cnt==4'd10)
        begin
            keycode[31:24]=keycode[23:16];
            keycode[23:16]=keycode[15:8];
            keycode[15:8]=keycode[7:0];
            if(keycode[15:8]==8'hF0)//��������ɿ��������λ��������0
                keycode[7:0] = 8'b0000_0000;
            else
                keycode[7:0]=datacur;
            cnt=0;
        end
        else if(cnt>= 1&& cnt<=8)
        begin
            datacur[cnt-1]=kdata;
            cnt=cnt+1;
        end
        else cnt= cnt+1;//���Կ�ʼ�ͽ�����־�Լ���żУ��λ
   end
end

endmodule
