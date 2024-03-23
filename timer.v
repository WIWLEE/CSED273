`timescale 1ns / 1ps



module timer(
    input clk,
    input reset,
    input user_turn,
    output [5:0] timer,
    output time_out
    );
    
    wire clk_1s;
    assign clk_1s = clk&~clk;
    
    reg [5:0] temp = 60;
    reg [5:0] tempminus1;
    reg temp_timeout =0;
    reg c_out;
    adder_6bit T1(timer[5:0], 6'b111110, 1, tempminus1[5:0], c_out);
    
    always @(posedge clk_1s) begin
        temp_timeout = (0&reset) | (1&~reset);
        temp[0] = (timer[0]&~user_turn&~reset) | (0 & reset) | (tempminus1[0] & user_turn & ~reset);
        temp[1] = (timer[1]&~user_turn&~reset) | (0 & reset) | (tempminus1[1] & user_turn & ~reset);
        temp[2] = (timer[2]&~user_turn&~reset) | (1 & reset) | (tempminus1[2] & user_turn & ~reset);
        temp[3] = (timer[3]&~user_turn&~reset) | (1 & reset) | (tempminus1[3] & user_turn & ~reset);
        temp[4] = (timer[4]&~user_turn&~reset) | (1 & reset) | (tempminus1[4] & user_turn & ~reset);
        temp[5] = (timer[5]&~user_turn&~reset) | (1 & reset) | (tempminus1[5] & user_turn & ~reset);
        temp_timeout = 0 | (1&~timer[0]&~timer[1]&~timer[2]&~timer[3]&~timer[4]&~timer[5]);
        
        /*
        if(reset) begin
            temp <=60;
            temp_timeout =0;
            end
        else if(user_turn) begin
            if(temp <= 1) begin
                temp <= 0;
                temp_timeout =1;
            end
            else begin
                temp <= temp-1;
                temp_timeout=0;
            end
        end
       */
       
    end
      assign timer = temp;
      assign time_out = temp_timeout;
endmodule


