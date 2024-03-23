`timescale 1ns / 1ps


module testbench( );
    reg clk, reset;
    wire [1:0] testcase;
    reg [9:0] switch;
    wire [9:0] led;
    
    top Main (
    .clk(clk),
    .reset(reset),
    .switch(switch),
    .led(led)
    );
    
    always begin
        clk = !clk;
        #5;
    end
    
    initial begin
        clk = 0;
        reset = 1;
        #1
        reset =0;
        
        switch[9:0] = 0;
        
        #156;
        switch[9] = 1; #1; switch[9] = 0; #1;
        switch[2] = 1; #1; switch[2] = 0; #1;
        switch[7] = 1; #1; switch[7] = 0; #1;
        
        #170
        switch[0] = 1; #1; switch[0] = 0; #1;
        switch[1] = 1; #1; switch[1] = 0; #1;
        switch[6] = 1; #1; switch[6] = 0; #1;
        switch[9] = 1; #1; switch[9] = 0; #1;
        
        #170
        switch[1] = 1; #1; switch[1] = 0; #1;
        switch[2] = 1; #1; switch[2] = 0; #1;
        switch[3] = 1; #1; switch[3] = 0; #1;
        switch[5] = 1; #1; switch[5] = 0; #1;
        switch[7] = 1; #1; switch[7] = 0; #1;
        switch[8] = 1; #1; switch[8] = 0; #1;

    
        
    end

endmodule
