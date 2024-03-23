`timescale 1ns / 1ps

module state_010(
    input clk,
    input reset,
    input en,
    input [1:0] testcase,
    input [9:0] switch,
    output is_finish,
    output reg [9:0] my_sol
    );

    reg [9:0] count;
    wire is_switch;

    //is start 변수 설정
    initial begin
        //is_start <= 1;
        my_sol <= 0;
    end
    
     //initialize my_sol, count
    wire signal;
    assign signal = en;
    
    //REG 초기화
    always@(signal) begin
        my_sol = 10'b0000000000;
        count = 3'b000;
    end

    //switch 입력시 led 키기
    wire [9:0] temp_my_sol;
    //assign temp_my_sol = my_sol;
    /*
    always@(*) begin
        led[9:0] = switch[9:0];    
    end
*/

    assign temp_my_sol[0] = (switch[0] | temp_my_sol[0]) & en;
    assign temp_my_sol[1] = (switch[1] | temp_my_sol[1]) & en;
    assign temp_my_sol[2] = (switch[2] | temp_my_sol[2]) & en;
    assign temp_my_sol[3] = (switch[3] | temp_my_sol[3]) & en;
    assign temp_my_sol[4] = (switch[4] | temp_my_sol[4]) & en;
    assign temp_my_sol[5] = (switch[5] | temp_my_sol[5]) & en;
    assign temp_my_sol[6] = (switch[6] | temp_my_sol[6]) & en;
    assign temp_my_sol[7] = (switch[7] | temp_my_sol[7]) & en;
    assign temp_my_sol[8] = (switch[8] | temp_my_sol[8]) & en;    
    assign temp_my_sol[9] = (switch[9] | temp_my_sol[9]) & en; 
       

//temp wire를 REG에 넣기 (x는 안넣게)
    always@(temp_my_sol[0]) begin
        my_sol[0] = temp_my_sol[0];
    end

    always@(temp_my_sol[1]) begin
        my_sol[1] = temp_my_sol[1];
    end
    
    always@(temp_my_sol[2]) begin
        my_sol[2] = temp_my_sol[2];
    end
    
    always@(temp_my_sol[3]) begin
        my_sol[3] = temp_my_sol[3];
    end
    
    always@(temp_my_sol[4]) begin
        my_sol[4] = temp_my_sol[4];
    end
    
    always@(temp_my_sol[5]) begin
        my_sol[5] = temp_my_sol[5];
    end
    
    always@(temp_my_sol[6]) begin
        my_sol[6] = temp_my_sol[6];
    end
    
    always@(temp_my_sol[7]) begin
        my_sol[7] = temp_my_sol[7];
    end
    
    always@(temp_my_sol[8]) begin
        my_sol[8] = temp_my_sol[8];
    end
       
    always@(temp_my_sol[9]) begin
        my_sol[9] = temp_my_sol[9];
    end
   
   //switch 입력 횟수 카운 -> count
    assign is_switch = (switch[0] | switch[1] | switch[2] | switch[3] | switch[4] | switch[5] | switch[6] | switch[7] | switch[8] | switch[9]);
   
    always@(is_switch) begin
        count[0] <= (is_switch | count[0]) & en;
        count[1] <= ((is_switch & count[0]) | count[1]) & en;
        count[2] <= ((is_switch & count[1]) | count[2]) & en;
        count[3] <= ((is_switch & count[2]) | count[3]) & en;
        count[4] <= ((is_switch & count[3]) | count[4]) & en;
        count[5] <= ((is_switch & count[4]) | count[5]) & en;
        count[6] <= ((is_switch & count[5]) | count[6]) & en;
        count[7] <= ((is_switch & count[6]) | count[7]) & en;
        count[8] <= ((is_switch & count[7]) | count[8]) & en;
        count[9] <= ((is_switch & count[8]) | count[9]) & en; 
    end
    
    
   /* wire [3:0]temp_switch;
    wire temp_cout;
    assign temp_switch ={1'b0,1'b0,1'b0,is_switch};
    */


    //3에서는 3개, 2에서는 4개, 1에서는 6개 입력하면 is_finish
    assign is_finish = 0| 
    ((testcase[1] & testcase[0]) & count[2]) |
    ((testcase[1] & ~testcase[0]) & count[3]) |
    ((~testcase[1] & testcase[0]) & count[5]);
   
 
endmodule