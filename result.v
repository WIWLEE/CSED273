`timescale 1ns / 1ps


module result(
    input clk,
    input reset,
    input [1:0] score,
    input en,
    output [9:0] led
    );
    
    
    
    assign led[0] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1));
    assign led[1] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1));
    assign led[2] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1));
    assign led[3] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1));
    assign led[4] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1));
    assign led[5] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1));
    assign led[6] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1));
    assign led[7] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&1)| (score[0]&score[1]&1));
    assign led[8] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&0) | (~score[0]&score[1]&0)| (score[0]&score[1]&1));
    assign led[9] =  en&((~score[0]&~score[1]&0) | (score[0]&~score[1]&1) | (~score[0]&score[1]&1)| (score[0]&score[1]&1));
    /*
    if(en) begin
       if(score == 1) begin
            temp[8:0] <= 0;
            temp[9] <= 1;  
            end
       else if(score == 2) begin
            temp[9:5] <=1;
            temp[4:0] <=0;
            
            end  
       else if(score == 3) begin
            temp[9:0] <= 1;
            end   
       else begin
            temp[9:0] <= 0;
            end
    end
    */
    
    
endmodule
