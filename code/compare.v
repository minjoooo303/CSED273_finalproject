// compare : ?? ?´?´ê°? ?¸ ì¹´ë ?°?¼? ?¹?¨ ê²°ì ?? ëª¨ë

module compare(
    input [3:0] p1_handcard,
    input [3:0] p2_handcard,
    output [1:0] matchresult


);
    // 4-bit magnitude comparatorë¡? êµ¬í
    // matchresult ì§ë¦¬ê°?
    // 00
    // 01 draw
    // 10 p1?¹
    // 11 p2?¹
magnitude_comparator compare(p1_handcard, p2_handcard, matchresult);


    

endmodule

module onebit_cmp(
    input in_a, in_b,
    output [1:0]result

    );
     wire andab1, andab2;
    and(andab1, ~in_a,in_b);
    and(andab2, in_a,~in_b);
    or(result[1], andab1, andab2);

    or(result[0], ~in_a, in_b);


endmodule



/////?­? 
module magnitude_comparator(// 1ë¹í¸?© ë¹êµ? ê²°ê³¼ ê°?? ¸??? ìµì¢ ê²°ê³¼ ?´ê¸?. 01, 10,11ë¡? ?¹?, ë¬´ì¹ë¶? ?ë¦? 
    input [3:0] input1,
    input [3:0] input2,
    output [1:0] matchresult); // ë­ê¹,

    wire [1:0] res_0, res_1,res_2,res_3;
    //1ë¹í¸?© ë¹êµ
    onebit_cmp cmp3(input1[3],input2[3],res_3);//? ¤ ?°?ë¦¬ì
    onebit_cmp cmp2(input1[2],input2[2],res_2);
    onebit_cmp cmp1(input1[1],input2[1],res_1);
    onebit_cmp cmp0(input1[0],input2[0],res_0);//? ¤ ??? ?ë¦¬ì


    //ê°ìë¦¬ì ë¹êµ
    assign matchresult[1] = res_3[1] | (~res_3[1] & res_3[0] & (res_2[1] | ~res_2[1] & res_2[0] & (res_1[1] | ~res_3[1] & res_1[0] & res_0[1])));

    assign matchresult[0]=(res_3[1]&res_3[0])|(~res_3[1]&res_3[0]&res_2[0]&(res_2[1]| ~res_2[1]&res_1[0]&(res_1[1]|~res_1[1]&res_0[0])));


endmodule
