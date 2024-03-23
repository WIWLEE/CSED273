`timescale 1ns / 1ps

module state_011(
    input clk,
    input reset_n,
    input en,
    input [1:0] testcase,
    input [9:0] my_sol,
    output is_correct,
    output is_wrong,
    output is_finish
    );
    
    reg is_start;
    reg [9:0] solution [0:3];
    
     //is start 변수 설정
   /* initial begin
        is_start <= 1;
    end
    
    always@(en & clk) begin //안되면 clk
        is_start = 0;
    end
    */
    initial begin
        solution[3] <= {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0};
        solution[2] <= {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
        solution[1] <= {1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0}; 
        solution[0] <= 0;
    end
    
  
    assign is_correct = 
    en & ( 
       ((testcase[0] & testcase[1]) & (my_sol[2] & my_sol[7] & my_sol[9])) |
       ((!testcase[0] & testcase[1]) & (my_sol[0] & my_sol[5] & my_sol[6] & my_sol[9])) |
       ((testcase[0] & !testcase[1]) & (my_sol[1] & my_sol[2] & my_sol[3] & my_sol[5] & my_sol[7] & my_sol[8]))
    );
    
    assign is_wrong = en & ~is_correct;
    assign is_finish = (is_correct | is_wrong);
        
         
endmodule