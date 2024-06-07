`timescale 1ns / 1ps

module blackandwhite_tb;

    reg [9:0] p_card;
    wire [2:0] p_black;
    wire [2:0] p_white;

    // ?��?��?��?��?��
    blackandwhite uut (
        .p_card(p_card),
        .p_black(p_black),
        .p_white(p_white)
    );

    initial begin
        // ?��?��?�� �??��?��: ?��?�� 값을 �?경하�? 결과�? 모니?���?
        $monitor("time=%0d, p_card=%d, p_black=%0d, p_white=%0d", $time, p_card, p_black, p_white);

        // �? ?��?��?�� 벡터?�� ???�� 모듈 ?���?
        p_card = 10'b0000000000; #10;  // 0 ?��카드, 0 백카?�� (p_black=000, p_white=000)
        p_card = 10'b1111111111; #10;  // 5 ?��카드, 5 백카?�� (p_black=101, p_white=101)
        p_card = 10'b1010101010; #10;  // 3 ?��카드, 2 백카?�� (p_black=011, p_white=010)
        
        p_card = 10'b1000000000; #10;
        p_card = 10'b0100000000; #10;
        p_card = 10'b1011101110; #10;
        p_card = 10'b1110101011; #10;

        // ?��뮬레?��?�� 종료
        //
    end

endmodule

module count_tb;

    reg [4:0] in;
    wire [2:0] count;

    // ?��?��?��?��?��
    count uut (
        .in(in),
        .count(count)
    );

    initial begin
        // ?��?��?�� �??��?��: ?��?�� 값을 �?경하�? 결과�? 모니?���?
        $monitor("time=%0d, in=%b, count=%b", $time, in, count);

        // �? ?��?��?�� 벡터?�� ???�� 모듈 ?���?
        in = 5'b00000; #10;  // 0�? (count=000)
        in = 5'b11111; #10;  // 5�? (count=101)
        in = 5'b10101; #10;  // 3�? (count=011)

        // ?��뮬레?��?�� 종료
        $finish;
    end

endmodule
