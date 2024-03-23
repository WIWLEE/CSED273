`timescale 1ns / 1ps


module score(
    input clk,
    input reset,
    input is_correct,
    output [1:0] score
    );
    
    wire [1:0] temp, tempplus1;
    wire c_out;
    
    adder T(score[1:0], 2'b01, 0, tempplus1[1:0], c_out);
    
    
    assign temp[0] = (score[0]&~is_correct&~reset) | (0 & reset) | (tempplus1[0] & is_correct & ~reset);
    assign temp[1] = (score[1]&~is_correct&~reset) | (0 & reset) | (tempplus1[1] & is_correct & ~reset);
    
    
    assign score = temp;
    
endmodule
