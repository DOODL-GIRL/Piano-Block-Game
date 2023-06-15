`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:35:43
// Design Name: 
// Module Name: top
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


module top(
    input clk,//100MHZʱ��
    input rst_n,//��Ϸ����
    input [2:0]choice,//����ѡ��
    input level,//�Ѷ�ѡ��
    input ps2_clk,//����ʱ��
    input ps2_data,//��������
    output speaker,//������
    output [6:0]SEG, //�߶��������ʾ����
    output [7:0]AN, //�߶������ѡ��
    output hys,//��ͬ��
    output vys,//��ͬ��
    output [11:0]lcd_rgb//[11:8]r,[7:4]g,[3:0]b
);
    wire vga_clk;//vgaר��ʱ��
    wire [6:0]tone_cur;//���ڲ�������������
    wire [2:0]pitch_cur;//���ڲ�������������
    reg [6:0] addr = 0;//ѡ�������ĵڼ�������
    wire clk_2HZ;//��ģʽʱ��Ƶ��
    wire clk_4HZ;//��սģʽ����Ƶ��
    reg clk_chosen;//���ѡ���ģʽ��Ӧʱ��Ƶ��
    wire [7:0] v_enb;//ѡ���������Ĺ��
    wire [7:0] erase;//�û��Ƿ��ڸ��ٿ�����ǰ�����������
    wire [7:0] score;//��ǰ�÷�
    wire [31:0] keycode;//��ǰ�����ļ�����
    wire [3:0] one;//�÷�����λ��ʾ
    wire [3:0] ten;//�÷���ʮλ��ʾ
    wire [3:0] hun;//�÷�����λ��ʾ
    reg [1:0]loop_times;//ѭ�����Ŵ���
    reg [3:0] status;//��ǰ״̬��001չʾ��ʼ���棻010չʾ��Ϸ���棻100չʾ�������棩
    always@(posedge clk)
    begin
        if(choice!=3'b001 && choice!=3'b010 && choice!=3'b100) status <= 3'b001;
        else if(loop_times==2) status<=3'b100;
        else status<=3'b010;
    end
   
    always@ (posedge clk) 
    begin
        if(level==0) clk_chosen<=clk_2HZ;
        else clk_chosen<=clk_4HZ;
    end
    
    
    always@(posedge clk_chosen , negedge rst_n)
    begin
        if(!rst_n || status!=3'b010) begin addr<=0; loop_times <= 0; end 
        else 
        begin
            if(addr==127) begin addr<=0; loop_times<= loop_times+1; end
            else addr<=addr+1;
        end
    end
    
    //����vgaר�õ�25MHZIP��
    vga_ip vga_ip_inst(.clk_in1(clk),.clk_out1(vga_clk));
    //2HZ��Ƶ,��ģʽ
	divider #(50000000/2) d_2hz(.clk(clk),.clk_out(clk_2HZ));
	//4HZ��Ƶ,��սģʽ
    divider #(25000000/2) d_4hz(.clk(clk),.clk_out(clk_4HZ));
    //���ѡ����ٿ���ֹ��ģ��
    block_random block_random_inst(.addr(addr),.cur_tone(tone_cur),.cur_pitch(pitch_cur),.v_enb(v_enb));
    //����ѡ��ģ��
    music_choice music_choice_inst(.choice(choice),.addr(addr),.pitch(pitch_cur),.tone(tone_cur));
    //��������ģ��
    music_creator music_creator_inst(.clk(clk),.rst_n(rst_n),.status(status),.tone(tone_cur),.pitch(pitch_cur),.speaker(speaker));
    //vga��ʾģ��
    vga vga_inst(.clk(clk),.vga_clk(vga_clk),.rst_n(rst_n),.status(status),.level(level),.v_enb(v_enb),.erase(erase),.hys(hys),.vys(vys),.lcd_rgb(lcd_rgb));
    //�����źŽ���ģ��
    ps2_receiver ps2_receiver_inst(.clk(clk),.kclk(ps2_clk),.kdata(ps2_data),.rst_n(rst_n),.keycode(keycode));
    //��Ҳ�����������ģ��
    erase_controller erase_controller_inst(.clk(clk),.rst_n(rst_n),.v_enb(v_enb),.keycode(keycode),.level(level),.erase(erase),.score(score));
    //������תΪʮ����ģ��
    bin_dec bin_dec_inst(.clk(clk),.bin(score),.rst_n(rst_n),.one(one),.ten(ten),.hun(hun));
    //ʵʱ�Ʒ���ʾģ��
    score_display score_display_inst(.score(score),.clk(clk),.rst_n(rst_n),.one(one),.ten(ten),.hun(hun),.seg(SEG),.an(AN));
endmodule
