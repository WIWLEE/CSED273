`timescale 1ns / 1ps

module top(
    input clk,
    input reset,
    input [9:0] switch,
    output [9:0] led,
    output reg [1:0] reg_score,
    output [6:0] ssDisp
    );
    
    reg [1:0] testcase;
    
    //for user input
    wire [9:0] my_sol;
    
    //signals
    wire is_correct, is_wrong, led_is_finish, user_turn_finish, start_led, compare_turn_finish;
    //reg LED_en, USER_en, COMP_en, time_out;
    
    
    initial begin
        testcase[0] = 1'b1;
        testcase[1] = 1'b1;
        reg_score[0] = 1'b0;
        reg_score[1] = 1'b0;
    end
    
    
    /*reg [5:0] temp = 30;
    wire [5:0] tempminus1;
    reg c_out;
    always @(posedge clk) begin
        temp = temp-1;
      end
    assign start_led = temp;  
    */
    
    
    //LED 점화
    state_001 LEDturn(clk, reset, testcase, reg_score, compare_turn_finish, led, led_is_finish);  
    
    //유저 입력 받기
    state_010 USERturn(clk, reset, led_is_finish, testcase, switch, user_turn_finish, my_sol );
    
    //유저 입력과 답 비교
    state_011 compare(clk, reset, user_turn_finish, testcase, my_sol, is_correct, is_wrong, compare_turn_finish);
    
    wire [1:0] temp_score;
    wire [1:0] temp_testcase;
    wire c_out;
    //testcase update
    adder_2bit tcminus1(testcase, 10, 1, temp_testcase, c_out);
    adder_2bit scoreplus1(reg_score, 01, 0, temp_score, c_out);
    
    always@(posedge clk) begin
         testcase[0] <= (user_turn_finish&temp_testcase[0] | ~user_turn_finish&testcase[0]);
         testcase[1] <= (user_turn_finish&temp_testcase[1] | ~user_turn_finish&testcase[1]);
         reg_score[0] <= (is_correct&temp_score[0] | !is_correct&reg_score[0]);
         reg_score[1] <= (is_correct&temp_score[1] | !is_correct&reg_score[1]);
    end
    
    assign ssDisp[0] = ~reg_score[1] | reg_score[0];
    assign ssDisp[1] = 1;
    assign ssDisp[2] = reg_score[1] | ~reg_score[0];
    assign ssDisp[3] = ~reg_score[1] | reg_score[0];
    assign ssDisp[4] = ~reg_score[1];
    assign ssDisp[5] = ~reg_score[1]&~reg_score[0];
    assign ssDisp[6] = reg_score[0];
    
endmodule


