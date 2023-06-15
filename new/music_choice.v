`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:37:20
// Design Name: 
// Module Name: music_choice
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


module music_choice(
    input [2:0]choice,//Ҫѡ�������(Ŀǰ����3����������ѡ��
    input [6:0]addr,//Ҫѡ���������ַ��ÿ������������127��������
    output reg [2:0] pitch,//����������
    output reg [6:0] tone//����������
    );
    always@(choice,addr)
    begin
        if(choice==3'b001)//����"���¹�����ɰ��"
        begin
            case(addr)
                1: begin pitch=3'b010; tone=7'b000_0001; end //����1 
                2: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                3: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                4: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                5: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                6: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                7: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                8: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                9: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                10: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                11: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                12: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                13: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                14: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                15: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                16: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                17: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                18: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                19: begin pitch<=3'b010; tone<=7'b000_0010; end //����2 
                20: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                21: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                22: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                23: begin pitch<=3'b010; tone<=7'b000_1000; end //����4 
                24: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                25: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                26: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                27: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                28: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                29: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                30: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                31: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                32: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                33: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                34: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                35: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                36: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                37: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                38: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                39: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                40: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                41: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                42: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                43: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                44: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                45: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                46: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                47: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                48: begin pitch<=3'b100; tone<=7'b010_0000; end //����6
                49: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                50: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                51: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                52: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                53: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                54: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                55: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                56: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                57: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                59: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                60: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                61: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                62: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                63: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                64: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                65: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                66: begin pitch<=3'b010; tone<=7'b000_0001; end //���� 
                67: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                68: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                69: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                70: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                71: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                72: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                73: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                74: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                75: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                76: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                77: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                78: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                79: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                80: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                81: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                82: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                83: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                84: begin pitch<=3'b010; tone<=7'b000_0010; end //���� 
                85: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                86: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                87: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                88: begin pitch<=3'b010; tone<=7'b000_1000; end //���� 
                89: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                90: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                91: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                92: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                93: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                94: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                95: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                96: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                97: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                98: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                99: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                100: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                101: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                102: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                103: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                104: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                105: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                106: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                107: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                108: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                109: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                110: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                111: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                112: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                113: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                114: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                115: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                116: begin pitch<=3'b010; tone<=7'b000_0010; end //���� 
                117: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                118: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                119: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                120: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                121: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                122: begin pitch<=3'b010; tone<=7'b000_0001; end //���� 
                123: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                124: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                125: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
            endcase
        end
        else if(choice==3'b010)//����"��λʱ��"
        begin
        case(addr)
                1: begin pitch=3'b100; tone=7'b010_0000; end //����6 
                2: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                3: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                4: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                5: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                6: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                7: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                8: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                9: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                10: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                11: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                12: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                13: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                14: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                15: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                16: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                17: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                18: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                19: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                20: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                21: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                22: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                23: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                24: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                25: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                26: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                27: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                28: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                29: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                30: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                31: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                32: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                33: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                34: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                35: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                36: begin pitch<=3'b010; tone<=7'b000_1000; end //����
                37: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                38: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                39: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                40: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                41: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                42: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                43: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                44: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                45: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                46: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                47: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                48: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                49: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                50: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                51: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                52: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                53: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                54: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                55: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                56: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                57: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                59: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                60: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                61: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                62: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                63: begin pitch<=3'b100; tone<=7'b010_0000; end //����6
                64: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                65: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                66: begin pitch<=3'b010; tone<=7'b010_0100; end //���� 
                67: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                68: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                69: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                70: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                71: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                72: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                73: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                74: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                75: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                76: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                77: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                78: begin pitch<=3'b010; tone<=7'b001_0000; end //����
                79: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                80: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                81: begin pitch<=3'b001; tone<=7'b000_0001; end //����1
                82: begin pitch<=3'b001; tone<=7'b000_0001; end //����
                83: begin pitch<=3'b010; tone<=7'b100_0000; end //����7
                84: begin pitch<=3'b010; tone<=7'b010_0000; end //����6 
                85: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                86: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                87: begin pitch<=3'b010; tone<=7'b001_0000; end //����5
                88: begin pitch<=3'b010; tone<=7'b001_0000; end //���� 
                89: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                90: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                91: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                92: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                93: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                94: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                95: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                96: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                97: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                98: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                99: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                100: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                101: begin pitch<=3'b010; tone<=7'b000_1000; end //����4
                102: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                103: begin pitch<=3'b010; tone<=7'b100_0100; end //����3
                104: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                105: begin pitch<=3'b010; tone<=7'b010_0000; end //����6
                106: begin pitch<=3'b010; tone<=7'b010_0000; end //����
                107: begin pitch<=3'b001; tone<=7'b000_0001; end //����1
                108: begin pitch<=3'b001; tone<=7'b000_0001; end //����
                109: begin pitch<=3'b001; tone<=7'b000_0001; end //����
                110: begin pitch<=3'b001; tone<=7'b000_0001; end //����
                111: begin pitch<=3'b001; tone<=7'b000_0010; end //����2
                112: begin pitch<=3'b001; tone<=7'b000_0010; end //����
                113: begin pitch<=3'b001; tone<=7'b000_0010; end //����
                114: begin pitch<=3'b001; tone<=7'b000_0100; end //����3
                115: begin pitch<=3'b001; tone<=7'b000_0010; end //����2
                116: begin pitch<=3'b001; tone<=7'b000_0010; end //���� 
                117: begin pitch<=3'b001; tone<=7'b000_0100; end //����3
                118: begin pitch<=3'b001; tone<=7'b000_0100; end //����
                119: begin pitch<=3'b010; tone<=7'b100_0000; end //����7
                120: begin pitch<=3'b010; tone<=7'b100_0000; end //����
                121: begin pitch<=3'b010; tone<=7'b100_0000; end //����
                122: begin pitch<=3'b010; tone<=7'b100_0000; end //���� 
                123: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                124: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                125: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
            endcase
        end
        else if(choice==3'b100)//����"���֮��"
        begin
        case(addr)
                1: begin pitch=3'b100; tone=7'b010_0000; end //����6 
                2: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                3: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                4: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                5: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                6: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                7: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                8: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                9: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                10: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                11: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                12: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                13: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                14: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                15: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                16: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                17: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                18: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                19: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                20: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                21: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                22: begin pitch<=3'b100; tone<=7'b001_0000; end //����5
                23: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                24: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                25: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                26: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                27: begin pitch<=3'b100; tone<=7'b001_0000; end //����5
                28: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                29: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                30: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                31: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                32: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                33: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                34: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                35: begin pitch<=3'b100; tone<=7'b000_1000; end //����4
                36: begin pitch<=3'b100; tone<=7'b000_1000; end //����
                37: begin pitch<=3'b100; tone<=7'b000_1000; end //����
                38: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                39: begin pitch<=3'b100; tone<=7'b000_1000; end //����4
                40: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                41: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                42: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                43: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                44: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                45: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                46: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                47: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                48: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                49: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                50: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                51: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                52: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                53: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                54: begin pitch<=3'b100; tone<=7'b000_1000; end //����4
                55: begin pitch<=3'b100; tone<=7'b000_1000; end //����
                56: begin pitch<=3'b100; tone<=7'b000_1000; end //����
                57: begin pitch<=3'b100; tone<=7'b000_1000; end //����4
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                59: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                60: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                61: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                62: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                63: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                64: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                65: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                66: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                67: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                68: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                69: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                70: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                71: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                72: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                73: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                74: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                75: begin pitch<=3'b010; tone<=7'b000_0100; end //����
                76: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                77: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                78: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                79: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                80: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                81: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                82: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                83: begin pitch<=3'b100; tone<=7'b000_0100; end //����
                84: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                85: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                86: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                87: begin pitch<=3'b100; tone<=7'b001_0000; end //����5
                88: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                89: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                90: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                91: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                92: begin pitch<=3'b100; tone<=7'b001_0000; end //����5
                93: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                94: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                95: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                96: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                97: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                98: begin pitch<=3'b100; tone<=7'b000_0100; end //����3
                99: begin pitch<=3'b100; tone<=7'b000_1000; end //����4
                100: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                101: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                102: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                103: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                104: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                105: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                106: begin pitch<=3'b010; tone<=7'b000_0010; end //����2
                107: begin pitch<=3'b010; tone<=7'b000_0010; end //����
                108: begin pitch<=3'b010; tone<=7'b000_0100; end //����3
                109: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                110: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                111: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                112: begin pitch<=3'b010; tone<=7'b000_0001; end //����
                113: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                114: begin pitch<=3'b010; tone<=7'b000_0001; end //����1
                115: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                116: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                117: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                118: begin pitch<=3'b100; tone<=7'b100_0000; end //����7
                119: begin pitch<=3'b100; tone<=7'b100_0000; end //����
                120: begin pitch<=3'b100; tone<=7'b001_0000; end //����5
                121: begin pitch<=3'b100; tone<=7'b001_0000; end //����
                122: begin pitch<=3'b100; tone<=7'b010_0000; end //����6 
                123: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                124: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                125: begin pitch<=3'b100; tone<=7'b010_0000; end //����
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //��ֹ��
            endcase
        end
    end
endmodule