//isfinish tb// by gpt
module tb_isfinish;
    reg [3:0] round;
    reg [3:0] win;
    reg [3:0] lose;
    wire fin;
    wire [1:0] printwinner;

    // Instantiate the isfinish module
    isfinish uut (
        .round(round),
        .win(win),
        .lose(lose),
        .fin(fin),
        .printwinner(printwinner)
    );

    initial begin
        // Test case 1: ?���? ?��?��?���? ?��?��?��?��
        round = 4'b0101; // Round 5
        win = 4'b0010;   // Win 3
        lose = 4'b0011;  // Lose 2
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 0, printwinner = 00

        // Test case 2: p1?�� ?��리�?? ?��?���??��
        round = 4'b1001; // Round 9
        win = 4'b0110;   // Win 6
        lose = 4'b0010;  // Lose 2
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 10

        // Test case 3: p2?�� ?��리�?? ?��?���??��
        round = 4'b1001; // Round 9
        win = 4'b0010;   // Win 2
        lose = 4'b0110;  // Lose 6
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 11

        // Test case 4: 무승�?
        round = 4'b1001; // Round 9
        win = 4'b0101;   // Win 5
        lose = 4'b0101;  // Lose 5
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 01

        // Test case 5: ?��?��?���? ?��?���?�? ?��?���? ?��?��?���? ?��?��
        round = 4'b1000; // Round 8
        win = 4'b0100;   // Win 4
        lose = 4'b0100;  // Lose 4
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 0, printwinner = 00
    end
endmodule
