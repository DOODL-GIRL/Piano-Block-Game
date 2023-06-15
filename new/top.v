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
    input clk,//100MHZ时钟
    input rst_n,//游戏开关
    input [2:0]choice,//乐曲选择
    input level,//难度选择
    input ps2_clk,//键盘时钟
    input ps2_data,//键盘数据
    output speaker,//扬声器
    output [6:0]SEG, //七段数码管显示数据
    output [7:0]AN, //七段数码管选择
    output hys,//行同步
    output vys,//场同步
    output [11:0]lcd_rgb//[11:8]r,[7:4]g,[3:0]b
);
    wire vga_clk;//vga专用时钟
    wire [6:0]tone_cur;//正在播放音符的音调
    wire [2:0]pitch_cur;//正在播放音符的音高
    reg [6:0] addr = 0;//选择乐曲的第几个音符
    wire clk_2HZ;//简单模式时钟频率
    wire clk_4HZ;//挑战模式采样频率
    reg clk_chosen;//玩家选择的模式对应时钟频率
    wire [7:0] v_enb;//选择产生方块的轨道
    wire [7:0] erase;//用户是否在钢琴块下落前点击将其消除
    wire [7:0] score;//当前得分
    wire [31:0] keycode;//当前读到的键盘码
    wire [3:0] one;//得分数个位显示
    wire [3:0] ten;//得分数十位显示
    wire [3:0] hun;//得分数百位显示
    reg [1:0]loop_times;//循环播放次数
    reg [3:0] status;//当前状态（001展示起始界面；010展示游戏界面；100展示结束界面）
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
    
    //生成vga专用的25MHZIP核
    vga_ip vga_ip_inst(.clk_in1(clk),.clk_out1(vga_clk));
    //2HZ分频,简单模式
	divider #(50000000/2) d_2hz(.clk(clk),.clk_out(clk_2HZ));
	//4HZ分频,挑战模式
    divider #(25000000/2) d_4hz(.clk(clk),.clk_out(clk_4HZ));
    //随机选择钢琴块出现轨道模块
    block_random block_random_inst(.addr(addr),.cur_tone(tone_cur),.cur_pitch(pitch_cur),.v_enb(v_enb));
    //音乐选择模块
    music_choice music_choice_inst(.choice(choice),.addr(addr),.pitch(pitch_cur),.tone(tone_cur));
    //播放音乐模块
    music_creator music_creator_inst(.clk(clk),.rst_n(rst_n),.status(status),.tone(tone_cur),.pitch(pitch_cur),.speaker(speaker));
    //vga显示模块
    vga vga_inst(.clk(clk),.vga_clk(vga_clk),.rst_n(rst_n),.status(status),.level(level),.v_enb(v_enb),.erase(erase),.hys(hys),.vys(vys),.lcd_rgb(lcd_rgb));
    //键盘信号接收模块
    ps2_receiver ps2_receiver_inst(.clk(clk),.kclk(ps2_clk),.kdata(ps2_data),.rst_n(rst_n),.keycode(keycode));
    //玩家擦除操作控制模块
    erase_controller erase_controller_inst(.clk(clk),.rst_n(rst_n),.v_enb(v_enb),.keycode(keycode),.level(level),.erase(erase),.score(score));
    //将分数转为十进制模块
    bin_dec bin_dec_inst(.clk(clk),.bin(score),.rst_n(rst_n),.one(one),.ten(ten),.hun(hun));
    //实时计分显示模块
    score_display score_display_inst(.score(score),.clk(clk),.rst_n(rst_n),.one(one),.ten(ten),.hun(hun),.seg(SEG),.an(AN));
endmodule
