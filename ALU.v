
`timescale 1ps / 1fs

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
    assign c[1] = ((x[1] ^ y[1]) & c[0]) | (x[1] & y[1]);
    assign c[2] = ((x[2] ^ y[2]) & c[1]) | (x[2] & y[2]);
    assign c_out = ((x[3] ^ y[3]) & c[2]) | (x[3] & y[3]);
    
    assign    out[0] = x[0] ^ y[0] ^ c_in;
    assign    out[1] = x[1] ^ y[1] ^ c[0];
    assign    out[2] = x[2] ^ y[2] ^ c[1];
    assign    out[3] = x[3] ^ y[3] ^ c[2];

    ////////////////////////

endmodule


module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] A;
    
    assign A[0] = (select[2] & ~y[0]) | (select[1] & y[0]);
    assign A[1] = (select[2] & ~y[1]) | (select[1] & y[1]);
    assign A[2] = (select[2] & ~y[2]) | (select[1] & y[2]);
    assign A[3] = (select[2] & ~y[3]) | (select[1] & y[3]);
    
    adder ADD(x, A, select[0], out, c_out);
    ////////////////////////

endmodule




module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    wire [3:0] A0;
    assign A0[0] = x[0] & y[0];
    assign A0[1] = x[0] | y[0];
    assign A0[2] = x[0] ^ y[0];
    assign A0[3] = ~x[0];
    mux_4_1 MUX0(A0, select, out[0]); 
    
     wire [3:0] A1;
    assign A1[0] = x[1] & y[1];
    assign A1[1] = x[1] | y[1];
    assign A1[2] = x[1] ^ y[1];
    assign A1[3] = ~x[1];
    mux_4_1 MUX1(A1, select, out[1]); 
    
     wire [3:0] A2;
    assign A2[0] = x[2] & y[2];
    assign A2[1] = x[2] | y[2];
    assign A2[2] = x[2] ^ y[2];
    assign A2[3] = ~x[2];
    mux_4_1 MUX2(A2, select, out[2]);
    
     wire [3:0] A3;
    assign A3[0] = x[3] & y[3];
    assign A3[1] = x[3] | y[3];
    assign A3[2] = x[3] ^ y[3];
    assign A3[3] = ~x[3];
    mux_4_1 MUX3(A3, select, out[3]);  
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    assign out = (in[0] & ~select) | (in[1] & select);
    ////////////////////////

endmodule


module ALU(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] Ar;
    wire [3:0] Lo;
    
    arithmeticUnit AU(x, y, {select[2:0]}, Ar, c_out);
    logicUnit LU(x, y, select[1:0], Lo);
    
    mux2to1 M0({Lo[0], Ar[0]}, select[3], out[0]);
    mux2to1 M1({Lo[1], Ar[1]}, select[3], out[1]);
    mux2to1 M2({Lo[2], Ar[2]}, select[3], out[2]);
    mux2to1 M3({Lo[3], Ar[3]}, select[3], out[3]);
    
    ////////////////////////

endmodule
