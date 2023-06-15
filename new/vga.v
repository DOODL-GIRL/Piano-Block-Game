`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:45:14
// Design Name: 
// Module Name: vga
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


module vga(
    input clk,//100MHZϵͳʱ��
    input vga_clk,//25MHZʱ�ӣ���IP�����ɣ�
    input rst_n,//��λ�źţ��͵�ƽ��Ч��
    input [3:0] status,//��ǰ��Ϸ״̬
    input [7:0]v_enb,//Ҫ��ʾ��ɫ�Ĳ�����ӦֵΪ1
    input level,//�����û�ѡ����Ѷ�ȷ�����ٿ������ٶ�
    input [7:0]erase,//�û��Ƿ����ø��ٿ�
    output reg hys,//��ͬ��
    output reg vys,//��ͬ��
    output reg [11:0]lcd_rgb//[11:8]r,[7:4]g,[3:0]b
);

reg [9:0]h_cnt;//�������������ͬ��
reg [9:0]v_cnt;//����������Ƴ�ͬ��
wire add_h_cnt;//������ͬ�����������1��־
wire end_h_cnt;//��ͬ����ɫ�źŽ�����ʾ��־
wire add_v_cnt;//���Ƴ�ͬ�����������1��־
wire end_v_cnt;//��ͬ����ɫ�źŽ�����ʾ��־

//��ͬ����ز���
parameter C_HS_SYNC_PULSE = 96;//ͬ������
parameter C_HS_BACK_PORCH = 48;//��ʾ����
parameter C_HS_ACTIVE_TIME = 640;//��ʾ����
parameter C_HS_FRONT_PORCH = 16; //��ʾǰ��
parameter C_HS_LINE_PERIOD = 800;//֡��
//��ͬ����ز���
parameter C_VS_SYNC_PULSE = 2;//ͬ������
parameter C_VS_BACK_PORCH = 33;//��ʾ����
parameter C_VS_ACTIVE_TIME = 480;//��ʾ����
parameter C_VS_FRONT_PORCH = 10; //��ʾǰ��
parameter C_VS_FRAME_PERIOD = 525;//֡��
//���ٿ���ز���
parameter width = 80;
parameter length = 160;


//ÿ�θ���һ�����ص㣬��ģʽ�¸���Ƶ��Ϊ2*160HZ����սģʽ�¸���Ƶ��Ϊ4*160HZ
//�������ѡ����Ѷ�ȷ�����ٿ����ʾ���򶥲����䵽�ײ�����ĸ��´���
wire clk_64MHZ;
block_drop_clock d_64mhz(.clk_in1(clk),.clk_out1(clk_64MHZ));
wire clk1;//��ģʽ�µĿ��Ƹ��ٿ�����ʱ��
wire clk2;//��սģʽ�¿��Ƹ��ٿ�����ʱ��
divider #(200000/2)d_2c160HZ(.clk(clk_64MHZ),.clk_out(clk1));
divider #(100000/2)d_4c160HZ(.clk(clk_64MHZ),.clk_out(clk2));
reg clk_chosen;//�������ѡ����Ѷ�ѡ��ʱ��
always@(level)
begin
    if(level==0) clk_chosen <= clk1;
    else clk_chosen <= clk2;
end

//��Ƴ�ͬ���ź� hys
always @(posedge vga_clk or negedge rst_n)
begin
     if(!rst_n)
     begin
         h_cnt <= 0;
     end
     else if(add_h_cnt)
     begin
         if(end_h_cnt)
             h_cnt <= 0;
         else
             h_cnt <= h_cnt + 1;
     end
end
assign add_h_cnt = 1; 
assign end_h_cnt = add_h_cnt && h_cnt==C_HS_LINE_PERIOD - 1;

always@(posedge vga_clk or negedge rst_n)
begin
     if(!rst_n)
     begin
         hys <= 0;
     end
     else if(add_h_cnt && h_cnt ==C_HS_SYNC_PULSE -1)
     begin
         hys <= 1'b1;
     end
     else if(end_h_cnt)
     begin
         hys <= 1'b0;
     end
end

//��� vys �ź�
always @(posedge vga_clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        v_cnt <= 0;
    end
    else if(add_v_cnt)
    begin
        if(end_v_cnt)
            v_cnt <= 0;
    else
        v_cnt <= v_cnt + 1;
    end
end
assign add_v_cnt = end_h_cnt; 
assign end_v_cnt = add_v_cnt && v_cnt==C_VS_FRAME_PERIOD - 1;

always @(posedge vga_clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        vys <= 1'b0;
    end
    else if(add_v_cnt && v_cnt ==  C_VS_SYNC_PULSE - 1)
    begin
        vys <= 1'b1;
    end
    else if(end_v_cnt)
    begin
        vys <= 1'b0;
    end
end

//���lcd_rgb �ź�
reg whole_area;//������ɫ��ʾ��Ч�����־
reg [7:0] area; //�������߸���ɫ��ʾ�����־�ֱ��Ӧ�߸�����

reg [11:0]count0;
reg [11:0]count1;
reg [11:0]count2;
reg [11:0]count3;
reg [11:0]count4;
reg [11:0]count5;
reg [11:0]count6;
reg [11:0]count7;
reg [7:0]prev_enb=8'b0000_0000;
reg [7:0]flag;//flag����1ʱ��Ӧ������ٿ��ܹ���ʾ

always@(posedge clk_chosen)
begin
    if(prev_enb[0]==0 && v_enb[0]==1) begin count0<=0; flag[0] <= 1; end
    if(count0==C_VS_ACTIVE_TIME+length || erase[0] == 1) flag[0] <= 0;
    if(flag[0] == 1) count0<=count0+1;
    
    if(prev_enb[1]==0 && v_enb[1]==1) begin count1<=0; flag[1] <= 1; end
    if(count1==C_VS_ACTIVE_TIME+length || erase[1] == 1) flag[1] <= 0;
    if(flag[1] == 1) count1<=count1+1;
    
    if(prev_enb[2]==0 && v_enb[2]==1) begin count2<=0; flag[2] <= 1; end
    if(count2==C_VS_ACTIVE_TIME+length || erase[2] == 1) flag[2] <= 0;
    if(flag[2] == 1) count2<=count2+1;
    
    if(prev_enb[3]==0 && v_enb[3]==1) begin count3<=0; flag[3] <= 1; end
    if(count3==C_VS_ACTIVE_TIME+length || erase[3] == 1) flag[3] <= 0;
    if(flag[3] == 1) count3<=count3+1;
    
    if(prev_enb[4]==0 && v_enb[4]==1) begin count4<=0; flag[4] <= 1; end
    if(count4==C_VS_ACTIVE_TIME+length || erase[4] == 1) flag[4] <= 0;
    if(flag[4] == 1) count4<=count4+1;
    
    if(prev_enb[5]==0 && v_enb[5]==1) begin count5<=0; flag[5] <= 1; end
    if(count5==C_VS_ACTIVE_TIME+length || erase[5] == 1) flag[5] <= 0;
    if(flag[5] == 1) count5<=count5+1;
    
    if(prev_enb[6]==0 && v_enb[6]==1) begin count6<=0; flag[6] <= 1; end
    if(count6==C_VS_ACTIVE_TIME+length || erase[6] == 1) flag[6] <= 0;
    if(flag[6] == 1) count6<=count6+1;
    
    if(prev_enb[7]==0 && v_enb[7]==1) begin count7<=0; flag[7] <= 1; end
    if(count7==C_VS_ACTIVE_TIME+length || erase[7] == 1) flag[7] <= 0;
    if(flag[7] == 1) count7<=count7+1;
    
    prev_enb <= v_enb;
end
    
always @(posedge vga_clk)
begin
    whole_area <= (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+C_HS_ACTIVE_TIME))
                 && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+C_VS_ACTIVE_TIME));
    area[0] <= flag[0] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count0) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count0));
    area[1] <= flag[1] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+2*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count1) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count1));
    area[2] <= flag[2] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+2*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+3*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count2) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count2));
    area[3] <= flag[3] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+3*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+4*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count3) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count3));
    area[4] <= flag[4] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+4*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+5*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count4) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count4));
    area[5] <= flag[5] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+5*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+6*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count5) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count5));
    area[6] <= flag[6] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+6*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+7*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count6) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count6));
    area[7] <= flag[7] && whole_area && (h_cnt>=(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+7*width) && h_cnt<(C_HS_SYNC_PULSE+C_HS_BACK_PORCH+8*width))
              && (v_cnt>=(C_VS_SYNC_PULSE+C_VS_BACK_PORCH-length+count7) && v_cnt<(C_VS_SYNC_PULSE+C_VS_BACK_PORCH+count7));
end

//��ʼ����ͼƬ����
 reg [18:0]address_start;
 always@(posedge clk)
 begin
    if(!rst_n) address_start <=0;
    else if(whole_area) address_start <= (v_cnt-(C_VS_SYNC_PULSE+C_VS_BACK_PORCH))*640+(h_cnt-(C_HS_SYNC_PULSE+C_HS_BACK_PORCH) );
    else address_start<=0;
 end
wire [11:0] data_start;
start_picture m0(.clka(clk),.ena(1'b1),.wea(1'b0),.addra(address_start),.dina(12'd0),.douta(data_start));

always @(posedge vga_clk or negedge rst_n)
begin
    if(!rst_n) lcd_rgb <= 12'b0000_0000_0000;
    else if(status!=3'b010 && whole_area) lcd_rgb <= data_start;
    else if (area) lcd_rgb <= 12'b1111_1111_1111;
    else lcd_rgb <= 12'b0000_0000_0000;
end

endmodule

