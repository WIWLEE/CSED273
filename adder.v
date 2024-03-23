`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module adder_6bit(
    input [5:0] x,
    input [5:0] y,
    input c_in,             // Carry in
    output [5:0] out,
    output c_out            // Carry out
); 
    wire [3:0] c;
    assign c[0] = ((x[0] ^ y[0]) & c_in) | (x[0] & y[0]);
    assign out[0] = x[0] ^ y[0] ^ c_in;
    assign c[1] = ((x[1] ^ y[1]) & c[0]) | (x[1] & y[1]);
    assign out[1] = x[1] ^ y[1] ^ c[0];
    assign c[2] = ((x[2] ^ y[2]) & c[1]) | (x[2] & y[2]);
    assign out[2] = x[2] ^ y[2] ^ c[1];
    assign c_out = ((x[3] ^ y[3]) & c[2]) | (x[3] & y[3]);
    assign out[3] = x[3] ^ y[3] ^ c[2];
    assign c_out = ((x[4] ^ y[4]) & c[3]) | (x[4] & y[4]);
    assign out[4] = x[4] ^ y[4] ^ c[3];
    assign c_out = ((x[5] ^ y[5]) & c[4]) | (x[5] & y[5]);
    assign out[5] = x[5] ^ y[5] ^ c[4];

endmodule

module adder_2bit(
    input [1:0] x,
    input [1:0] y,
    input c_in,             // Carry in
    output [1:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    
    wire c;
    
    assign c = ((x[0] ^ y[0]) & c_in) | (x[0] & y[0]);
    assign out[0] = x[0] ^ y[0] ^ c_in;
    assign c_out = ((x[1] ^ y[1]) & c) | (x[1] & y[1]);
    assign out[1] = x[1] ^ y[1] ^ c;
    
    ////////////////////////

endmodule

module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    
    wire [2:0] c;
    
    assign c[0] = ((x[0] ^ y[0]) & c_in) | (x[0] & y[0]);
    assign out[0] = x[0] ^ y[0] ^ c_in;
    assign c[1] = ((x[1] ^ y[1]) & c[0]) | (x[1] & y[1]);
    assign out[1] = x[1] ^ y[1] ^ c[0];
    assign c[2] = ((x[2] ^ y[2]) & c[1]) | (x[2] & y[2]);
    assign out[2] = x[2] ^ y[2] ^ c[1];
    assign c_out = ((x[3] ^ y[3]) & c[2]) | (x[3] & y[3]);
    assign out[3] = x[3] ^ y[3] ^ c[2];
    ////////////////////////

endmodule
