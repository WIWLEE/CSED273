`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//testcase

//3 :   9 2 7
//2 :   0 4 1 3 2
//1 :   1 9 4 2 0 8 7 5 
//0 :   끝 

module state_001(
    input clk,
    input reset,
    input [1:0] testcase,
    input [1:0] score,
    input compare_finish,
    output reg [9:0] led,
    output is_finish
    );

    
    wire [7:0] total_clk;
     reg [5:0] reg_clk;
     reg is_start;
    
    //decade_counter_2digits count(!reset, clk, total_clk);
     always@(testcase) begin
        reg_clk = 0;
     end
     
     always@(posedge clk) begin
         reg_clk = reg_clk + 1;
     end
     
     initial begin
        is_start = 1;
     end

    
    always@(reg_clk) begin
        if(compare_finish) begin
            is_start=1;
        end
        if(is_start) begin
        led[0] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1)));
        led[1] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1)));
        led[2] = ((testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 1) & !reg_clk[4])
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1)));
        led[3] = ((testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1)));
        led[4] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1)));
        led[5] =((testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1)));
        led[6] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1)));
        led[7] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 1) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1)));
        led[8] = ((testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1)));
        led[9] = ((testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 1) & !reg_clk[4]) 
            | (~testcase[0]&~testcase[1]&((~score[0]&~score[1]&0) | (score[0]&~score[1]&1) | (~score[0]&score[1]&1)| (score[0]&score[1]&1)));
        end
        if(reg_clk[4]) begin
            is_start =0;
            led[0] = 0;
            led[1] = 0;
            led[2] = 0;
            led[3] = 0;
            led[4] = 0;
            led[5] = 0;
            led[6] = 0;
            led[7] = 0;
            led[8] = 0;
            led[9] = 0;
            reg_clk[0] = 0;
            reg_clk[1] = 0;
            reg_clk[2] = 0;
            reg_clk[3] = 0;
            reg_clk[4] = 0;
            
        end
        
    end
    
   assign is_finish = ~is_start;
   
   

endmodule


/*
module state_001(
    input clk,
    input reset,
    input [1:0] testcase,
    input is_start,
    output reg [9:0] led,
    output is_finish
    );
    
    
    always@( is_start) begin
    
        led[0] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0);
        led[1] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0);
        led[2] = 0 | is_start&(testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 1);
        led[3] = 0 | is_start&(testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0);
        led[4] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 0);
        led[5] = 0 | is_start&(testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0);
        led[6] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0);
        led[7] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&1 | testcase[0] & testcase[1] & 1);
        led[8] = 0 | is_start&(testcase[0]&~testcase[1]&0 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 0);
        led[9] = 0 | is_start&(testcase[0]&~testcase[1]&1 | ~testcase[0]&testcase[1]&0 | testcase[0] & testcase[1] & 1);
   
    
    end
    
    assign is_finish = 1;
    
    endmodule
*/
 /*
    reg [1:0] temp = 3;
    reg [1:0] tempminus1;
    reg temp_timeout =0;
    reg c_out;
    adder_2bit T1(temp[1:0], 2'b10, 1, tempminus1[1:0], c_out);
    
    always @(posedge clk) begin
        temp_timeout = (0&reset) | (1&~reset);
        temp[0] = (temp[0]&~user_turn&~reset) | (1 & reset) | (tempminus1[0] & user_turn & ~reset);
        temp[1] = (temp[1]&~user_turn&~reset) | (1 & reset) | (tempminus1[1] & user_turn & ~reset);
        temp_timeout = 0 | (1&~timer[0]&~timer[1]);
    end
    
    assign is_finish = temp_timeout;
    
*/
 /*   
    wire [3:0] led_index;
    wire [3:0] next_led_index;
    wire [3:0] test_en; //각 test모듈의 enable
    wire [3:0] test_finish;
    
  
    reg [3:0] temp_test_en;
    always@(*) begin
        temp_test_en[0] = (1&testcase[0]&testcase[1]);
        temp_test_en[1] = (1&~testcase[0]&testcase[1]);
        temp_test_en[2] = (1&testcase[0]&~testcase[1]);
        temp_test_en[3] = (1&~testcase[0]&~testcase[1]);
    end
    
    assign test_en = temp_test_en;
    //initialize led when start state
    
    mux_2_1 mux_initial_0 (led[0], 0, is_start & en, led[0]);
    mux_2_1 mux_initial_1 (led[1], 0, is_start & en, led[1]);
    mux_2_1 mux_initial_2 (led[2], 0, is_start & en, led[2]);
    mux_2_1 mux_initial_3 (led[3], 0, is_start & en, led[3]);
    mux_2_1 mux_initial_4 (led[4], 0, is_start & en, led[4]);
    mux_2_1 mux_initial_5 (led[5], 0, is_start & en, led[5]);
    mux_2_1 mux_initial_6 (led[6], 0, is_start & en, led[6]);
    mux_2_1 mux_initial_7 (led[7], 0, is_start & en, led[7]);
    mux_2_1 mux_initial_8 (led[8], 0, is_start & en, led[8]);
    mux_2_1 mux_initial_9 (led[9], 0, is_start & en, led[9]); 
 //   mux_2_1 mux_initial_10 (test_en[0], 0, is_real_start & en, test_en[0]);
 //   mux_2_1 mux_initial_11 (test_en[1], 0, is_real_start & en, test_en[1]);
 //   mux_2_1 mux_initial_12 (test_en[2], 0, is_real_start & en, test_en[2]);
 //   mux_2_1 mux_initial_13 (test_en[3], 0, is_real_start & en, test_en[3]);
        
   
     //test_case에 따라 모듈 활성화
   // decoder_2_4 TEST_DECODER (en, testcase, test_en);
    
    
    
    //led index로 led 변경
    wire [15:0] temp_led;
    assign temp_led = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,led};
    decoder_4_16 LED_CHANGE (en, led_index, temp_led);
    
    reg [3:0] temp_led_idx;
    
    always@(*) begin
        temp_led_idx[0] = (1&testcase[1]&testcase[0])| (1&~testcase[1]&testcase[0]) | (0&testcase[1]&~testcase[0]) | (1&~testcase[1]&~testcase[0]);
        temp_led_idx[1] = 0;
        temp_led_idx[2] = 0;
        temp_led_idx[3] = (1&testcase[1]&testcase[0]) | (0&~testcase[1]&testcase[0]) | (0&testcase[1]&~testcase[0]) | (1&~testcase[1]&~testcase[0]);
    end
    
    wire changed;
    assign changed = 0| (temp_led_idx[0]&~next_led_index[0]) | (temp_led_idx[1]&~next_led_index[1]) | (temp_led_idx[2]&~next_led_index[2]) | (temp_led_idx[3]&~next_led_index[3]);
    assign led_index[0] = 0 | (temp_led_idx[0]&~changed) | (next_led_index[0]&changed);
    assign led_index[1] = 0 | (temp_led_idx[1]&~changed) | (next_led_index[1]&changed);
    assign led_index[2] = 0 | (temp_led_idx[2]&~changed) | (next_led_index[2]&changed);
    assign led_index[3] = 0 | (temp_led_idx[3]&~changed) | (next_led_index[3]&changed);
    
     //test 모듈 선언
    test_3 TEST_3 (clk, test_en[3], reset_n, led_index, next_led_index, led, test_finish[3]);
    test_2 TEST_2 (clk, test_en[2], reset_n, led_index, next_led_index, led, test_finish[2]);
    test_1 TEST_1 (clk, test_en[1], reset_n, led_index, next_led_index, led, test_finish[1]);
    //Led index 업데이트
    
    
    //한 테스트의 state 끝
    assign is_finish = test_finish[testcase]; //state 나간뒤로 testcase 감소 필요, is_finish 0 set 필요
    
    
endmodule


module test_2(
    input clk,
    input en,
    input reset_n,
    input [3:0] index,
    output [3:0] next_index,
    output [9:0] led,
    output is_finish
);
    
    wire D[3:0];
    assign D[3] = index[1];
    assign D[2] = index[3] | (index[2] & index[1]);
    assign D[1] = (index[1] & index[0]) | (index[2] & ~index[1]);
    assign D[0] = index[0] | (index[2] & index[1]);
    
    wire [3:0] q_;
    assign q_ = ~next_index;
    //led 변경시키기
    edge_trigger_D_FF A3(reset_n, D[3], clk, next_index[3], q_[3]);
    edge_trigger_D_FF A2(reset_n, D[2], clk, next_index[2], q_[2]);
    edge_trigger_D_FF A1(reset_n, D[1], clk, next_index[1], q_[1]);
    edge_trigger_D_FF A0(reset_n, D[0], clk, next_index[0], q_[0]);
    
    //꺼져있으면 input 그대로 내보내기
    mux_2_1 E3(index[3], next_index[3], en, next_index[3]);
    mux_2_1 E2(index[2], next_index[2], en, next_index[2]);
    mux_2_1 E1(index[1], next_index[1], en, next_index[1]);
    mux_2_1 E0(index[0], next_index[0], en, next_index[0]);
    
    //5 다음은 is_finish 1 설정
    mux_2_1 END(0,1,~index[3] & index[2] & ~index[1] & index[0], is_finish);
    
endmodule


module test_3(
    input clk,
    input en,
    input reset_n,
    input [3:0] index,
    output [3:0] next_index,
    output [9:0] led,
    output is_finish
);


    wire D[3:0];
    assign D[3] = 0;
    assign D[2] = ~index[3];
    assign D[1] = 1;
    assign D[0] = ~index[3];
    
    wire [3:0] q_;
    assign q_ = ~next_index;
    //led 변경시키기
    edge_trigger_D_FF A3(reset_n, D[3], clk, next_index[3], q_[3]);
    edge_trigger_D_FF A2(reset_n, D[2], clk, next_index[2], q_[2]);
    edge_trigger_D_FF A1(reset_n, D[1], clk, next_index[1], q_[1]);
    edge_trigger_D_FF A0(reset_n, D[0], clk, next_index[0], q_[0]);
    
    //꺼져있으면 input 그대로 내보내기
    mux_2_1 E3(index[3], next_index[3], en, next_index[3]);
    mux_2_1 E2(index[2], next_index[2], en, next_index[2]);
    mux_2_1 E1(index[1], next_index[1], en, next_index[1]);
    mux_2_1 E0(index[0], next_index[0], en, next_index[0]);
    
    //2 다음은 is_finish 1 설정
    mux_2_1 END(0,1,~index[3] & index[2] & index[1] & index[0], is_finish);
    
endmodule

module test_1(
    input clk,
    input en,
    input reset_n,
    input [3:0] index,
    output [3:0] next_index,
    output [9:0] led,
    output is_finish
);

    wire D[3:0];
    assign D[3] = 0;
    assign D[2] = ~index[3];
    assign D[1] = 1;
    assign D[0] = ~index[3];
    
     wire [3:0] q_;
    assign q_ = ~next_index;
    //led 변경시키기
    edge_trigger_D_FF A3(reset_n, D[3], clk, next_index[3], q_[3]);
    edge_trigger_D_FF A2(reset_n, D[2], clk, next_index[2], q_[2]);
    edge_trigger_D_FF A1(reset_n, D[1], clk, next_index[1], q_[1]);
    edge_trigger_D_FF A0(reset_n, D[0], clk, next_index[0], q_[0]);
    
    //꺼져있으면 input 그대로 내보내기
    mux_2_1 E3(index[3], next_index[3], en, next_index[3]);
    mux_2_1 E2(index[2], next_index[2], en, next_index[2]);
    mux_2_1 E1(index[1], next_index[1], en, next_index[1]);
    mux_2_1 E0(index[0], next_index[0], en, next_index[0]);
    
    //7 다음은 is_finish 1 설정
    mux_2_1 END(0,1,~index[3] & index[2] & index[1] & index[0], is_finish);
    
endmodule

*/