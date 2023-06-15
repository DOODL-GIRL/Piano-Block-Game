`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 16:03:43
// Design Name: 
// Module Name: erase_controller
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


//通过键盘输入控制是否应该擦除钢琴块以及是否加分
module erase_controller(
    input clk,//系统时钟
    input rst_n,//复位信号（低电平有效）
    input[7:0] v_enb,//允许出现钢琴块的轨道
    input[31:0]keycode,//当前读到的键盘码
    input level,//玩家选择的难度
    output reg [7:0]erase,//是否擦除某轨道上的钢琴块
    output reg [7:0]score//当前得分
    );
    reg [7:0] prev_enb = 8'b00000000;//上一次的出现钢琴块轨道的信号
    reg [7:0] detect;//是否允许检测某轨道来自键盘消除信号的标志
    reg [27:0] count0;
    reg [27:0] count1;
    reg [27:0] count2;
    reg [27:0] count3;
    reg [27:0] count4;
    reg [27:0] count5;
    reg [27:0] count6;
    reg [27:0] count7;
    reg [31:0]count_max;
    
   always@(level)
    begin
       if(level==0)  count_max<=32'd250000000;
       else count_max<=32'd125000000;
    end
    
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin erase <= 0; score <= 0; end
    else
    begin
        //轨道0
        if(prev_enb[0] == 0 && v_enb[0] == 1) //当某轨道钢琴块产生时，该轨道对应的检测信号置1，计数置0，擦除标志置0
            begin detect[0] <= 1; count0 <= 0; erase[0] <= 0;end
        else 
        begin
            //当接收到键盘对应消除按键时，对应erase位置1,分数加1
            if(keycode[7:0]==8'h16 && detect[0]==1) begin erase[0] <= 1;  score <= score+1; end; 
            //当钢琴块完全落下或消除键已经按下时，对应轨道检测标志置0
            if(count0==count_max || erase[0]==1) detect[0] <= 0;
            //正在检测阶段，count每次加1 
            if(detect[0]==1) count0 <= count0+1;
        end
        //轨道1
        if(prev_enb[1] == 0 && v_enb[1] == 1) 
            begin detect[1] <= 1; count1 <= 0; erase[1] <= 0;end
        else
        begin
            if(keycode[7:0]==8'h1e && detect[1]==1) begin erase[1] <= 1; score <= score+1; end;
            if(count1==count_max || erase[1]==1) detect[1] <= 0; 
            if(detect[1]==1) count1 <= count1+1;
        end
        //轨道2
        if(prev_enb[2] == 0 && v_enb[2] == 1) 
            begin detect[2] <= 1; count2 <= 0; erase[2] <= 0;end
        else 
        begin
            if(keycode[7:0]==8'h26 && detect[2]==1) begin erase[2] <= 1;  score <= score+1; end; 
            if(count2==count_max || erase[2]==1) detect[2] <= 0; 
            if(detect[2]==1) count2 <= count2+1;
        end
        //轨道3
        if(prev_enb[3] == 0 && v_enb[3] == 1) 
            begin detect[3] <= 1; count3 <= 0; erase[3] <= 0;end
        else
        begin
             if(keycode[7:0]==8'h25 && detect[3]==1) begin erase[3] <= 1;  score <= score+1; end;
             if(count3==count_max || erase[3]==1) detect[3] <= 0; 
             if(detect[3]==1) count3 <= count3+1;
        end
        //轨道4
        if(prev_enb[4] == 0 && v_enb[4] == 1) 
            begin detect[4] <= 1; count4 <= 0; erase[4] <= 0;end
        else 
        begin
            if(keycode[7:0]==8'h2e && detect[4]==1) begin erase[4] <= 1;  score <= score+1; end;
            if(count4==count_max || erase[4]==1) detect[4] <= 0;
            if(detect[4]==1) count4 <= count4+1;
        end
        //轨道5
        if(prev_enb[5] == 0 && v_enb[5] == 1) 
            begin detect[5] <= 1; count5 <= 0; erase[5] <= 0; end
        else 
        begin
            if(keycode[7:0]==8'h36 && detect[5]==1) begin erase[5] <= 1;  score <= score+1; end;
            if(count5==count_max || erase[5]==1) detect[5] <= 0; 
            if(detect[5]==1) count5 <= count5+1;
        end
        //轨道6
        if(prev_enb[6] == 0 && v_enb[6] == 1) 
            begin detect[6] <= 1; count6 <= 0; erase[6] <= 0; end
        else
        begin 
            if(keycode[7:0]==8'h3d && detect[6]==1) begin erase[6] <= 1;  score <= score+1; end;
            if(count6==count_max || erase[6]==1) detect[6] <= 0;
            if(detect[6]==1) count6 <= count6+1;
        end
        //轨道7
        if(prev_enb[7] == 0 && v_enb[7] == 1) 
            begin detect[7] <= 1; count7 <= 0; erase[7] <= 0; end
        else 
        begin
            if(keycode[7:0]==8'h3e && detect[7]==1) begin erase[7] <= 1;  score <= score+1; end;
            if(count7==count_max || erase[7]==1) detect[7] <= 0; 
            if(detect[7]==1) count7 <= count7+1;
        end
    end
    prev_enb <= v_enb;//记录前一次轨道的使能信号
end
    
endmodule
