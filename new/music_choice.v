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
    input [2:0]choice,//р╙я║тЯ╣дюжгЗ(д©г╟╧╡сп3йвюжгЗ©иртя║тЯё╘
    input [6:0]addr,//р╙я║тЯ╣дрТ╥Ш╣ьж╥ё╗ц©йвюжгЗ╡╩Ё╛╧Щ127╦ЖрТ╥Шё╘
    output reg [2:0] pitch,//рТ╥Ш╣дрТ╦ъ
    output reg [6:0] tone//рТ╥Ш╣дрТ╣В
    );
    always@(choice,addr)
    begin
        if(choice==3'b001)//южгЗ"╟втб╧БсКжЛи╟ПК"
        begin
            case(addr)
                1: begin pitch=3'b010; tone=7'b000_0001; end //жпрТ1 
                2: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                3: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                4: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                5: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                6: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                7: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                8: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                9: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                10: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                11: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                12: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                13: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                14: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                15: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                16: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                17: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                18: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                19: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2 
                20: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                21: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                22: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                23: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4 
                24: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                25: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                26: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                27: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                28: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                29: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                30: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                31: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                32: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                33: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                34: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                35: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                36: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                37: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                38: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                39: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                40: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                41: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                42: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                43: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                44: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                45: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                46: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                47: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                48: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6
                49: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                50: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                51: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                52: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                53: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                54: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                55: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                56: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                57: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                59: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                60: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                61: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                62: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                63: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                64: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                65: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                66: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ 
                67: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                68: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                69: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                70: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                71: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                72: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                73: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                74: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                75: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                76: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                77: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                78: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                79: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                80: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                81: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                82: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                83: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                84: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ 
                85: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                86: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                87: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                88: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ 
                89: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                90: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                91: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                92: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                93: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                94: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                95: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                96: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                97: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                98: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                99: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                100: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                101: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                102: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                103: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                104: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                105: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                106: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                107: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                108: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                109: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                110: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                111: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                112: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                113: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                114: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                115: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                116: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ 
                117: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                118: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                119: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                120: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                121: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                122: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ 
                123: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                124: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                125: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
            endcase
        end
        else if(choice==3'b010)//южгЗ"╢Мн╩й╠©у"
        begin
        case(addr)
                1: begin pitch=3'b100; tone=7'b010_0000; end //╣мрТ6 
                2: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                3: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                4: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                5: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                6: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                7: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                8: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                9: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                10: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                11: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                12: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                13: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                14: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                15: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                16: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                17: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                18: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                19: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                20: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                21: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                22: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                23: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                24: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                25: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                26: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                27: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                28: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                29: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                30: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                31: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                32: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                33: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                34: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                35: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                36: begin pitch<=3'b010; tone<=7'b000_1000; end //ясрТ
                37: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                38: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                39: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                40: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                41: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                42: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                43: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                44: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                45: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                46: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                47: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                48: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                49: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                50: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                51: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                52: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                53: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                54: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                55: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                56: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                57: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                59: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                60: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                61: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                62: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                63: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6
                64: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                65: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                66: begin pitch<=3'b010; tone<=7'b010_0100; end //ясрТ 
                67: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                68: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                69: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                70: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                71: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                72: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                73: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                74: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                75: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                76: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                77: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                78: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ
                79: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                80: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                81: begin pitch<=3'b001; tone<=7'b000_0001; end //╦ърТ1
                82: begin pitch<=3'b001; tone<=7'b000_0001; end //ясрТ
                83: begin pitch<=3'b010; tone<=7'b100_0000; end //жпрТ7
                84: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6 
                85: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                86: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                87: begin pitch<=3'b010; tone<=7'b001_0000; end //жпрТ5
                88: begin pitch<=3'b010; tone<=7'b001_0000; end //ясрТ 
                89: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                90: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                91: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                92: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                93: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                94: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                95: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                96: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                97: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                98: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                99: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                100: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                101: begin pitch<=3'b010; tone<=7'b000_1000; end //жпрТ4
                102: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                103: begin pitch<=3'b010; tone<=7'b100_0100; end //жпрТ3
                104: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                105: begin pitch<=3'b010; tone<=7'b010_0000; end //жпрТ6
                106: begin pitch<=3'b010; tone<=7'b010_0000; end //ясрТ
                107: begin pitch<=3'b001; tone<=7'b000_0001; end //╦ърТ1
                108: begin pitch<=3'b001; tone<=7'b000_0001; end //ясрТ
                109: begin pitch<=3'b001; tone<=7'b000_0001; end //ясрТ
                110: begin pitch<=3'b001; tone<=7'b000_0001; end //ясрТ
                111: begin pitch<=3'b001; tone<=7'b000_0010; end //╦ърТ2
                112: begin pitch<=3'b001; tone<=7'b000_0010; end //ясрТ
                113: begin pitch<=3'b001; tone<=7'b000_0010; end //ясрТ
                114: begin pitch<=3'b001; tone<=7'b000_0100; end //╦ърТ3
                115: begin pitch<=3'b001; tone<=7'b000_0010; end //╦ърТ2
                116: begin pitch<=3'b001; tone<=7'b000_0010; end //ясрТ 
                117: begin pitch<=3'b001; tone<=7'b000_0100; end //╦ърТ3
                118: begin pitch<=3'b001; tone<=7'b000_0100; end //ясрТ
                119: begin pitch<=3'b010; tone<=7'b100_0000; end //жпрТ7
                120: begin pitch<=3'b010; tone<=7'b100_0000; end //ясрТ
                121: begin pitch<=3'b010; tone<=7'b100_0000; end //ясрТ
                122: begin pitch<=3'b010; tone<=7'b100_0000; end //ясрТ 
                123: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                124: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                125: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
            endcase
        end
        else if(choice==3'b100)//южгЗ"лЛ©уж╝Ёг"
        begin
        case(addr)
                1: begin pitch=3'b100; tone=7'b010_0000; end //╣мрТ6 
                2: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                3: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                4: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                5: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                6: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                7: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                8: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                9: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                10: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                11: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                12: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                13: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                14: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                15: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                16: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                17: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                18: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                19: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                20: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                21: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                22: begin pitch<=3'b100; tone<=7'b001_0000; end //╣мрТ5
                23: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                24: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                25: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                26: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                27: begin pitch<=3'b100; tone<=7'b001_0000; end //╣мрТ5
                28: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                29: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                30: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                31: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                32: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                33: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                34: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                35: begin pitch<=3'b100; tone<=7'b000_1000; end //╣мрТ4
                36: begin pitch<=3'b100; tone<=7'b000_1000; end //ясрТ
                37: begin pitch<=3'b100; tone<=7'b000_1000; end //ясрТ
                38: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                39: begin pitch<=3'b100; tone<=7'b000_1000; end //╣мрТ4
                40: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                41: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                42: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                43: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                44: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                45: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                46: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                47: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                48: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                49: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                50: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                51: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                52: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                53: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                54: begin pitch<=3'b100; tone<=7'b000_1000; end //╣мрТ4
                55: begin pitch<=3'b100; tone<=7'b000_1000; end //ясрТ
                56: begin pitch<=3'b100; tone<=7'b000_1000; end //ясрТ
                57: begin pitch<=3'b100; tone<=7'b000_1000; end //╣мрТ4
                58: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                59: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                60: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                61: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                62: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                63: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                64: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                65: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                66: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                67: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                68: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                69: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                70: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                71: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                72: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                73: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                74: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                75: begin pitch<=3'b010; tone<=7'b000_0100; end //ясрТ
                76: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                77: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                78: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                79: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                80: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                81: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                82: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                83: begin pitch<=3'b100; tone<=7'b000_0100; end //ясрТ
                84: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                85: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                86: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                87: begin pitch<=3'b100; tone<=7'b001_0000; end //╣мрТ5
                88: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                89: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                90: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                91: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                92: begin pitch<=3'b100; tone<=7'b001_0000; end //╣мрТ5
                93: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                94: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                95: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                96: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                97: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                98: begin pitch<=3'b100; tone<=7'b000_0100; end //╣мрТ3
                99: begin pitch<=3'b100; tone<=7'b000_1000; end //╣мрТ4
                100: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                101: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                102: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                103: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                104: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                105: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                106: begin pitch<=3'b010; tone<=7'b000_0010; end //жпрТ2
                107: begin pitch<=3'b010; tone<=7'b000_0010; end //ясрТ
                108: begin pitch<=3'b010; tone<=7'b000_0100; end //жпрТ3
                109: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                110: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                111: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                112: begin pitch<=3'b010; tone<=7'b000_0001; end //ясрТ
                113: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                114: begin pitch<=3'b010; tone<=7'b000_0001; end //жпрТ1
                115: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                116: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                117: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                118: begin pitch<=3'b100; tone<=7'b100_0000; end //╣мрТ7
                119: begin pitch<=3'b100; tone<=7'b100_0000; end //ясрТ
                120: begin pitch<=3'b100; tone<=7'b001_0000; end //╣мрТ5
                121: begin pitch<=3'b100; tone<=7'b001_0000; end //ясрТ
                122: begin pitch<=3'b100; tone<=7'b010_0000; end //╣мрТ6 
                123: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                124: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                125: begin pitch<=3'b100; tone<=7'b010_0000; end //ясрТ
                126: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
                127: begin pitch<=3'b000; tone<=7'b000_0000; end //пщж╧╥Ш
            endcase
        end
    end
endmodule