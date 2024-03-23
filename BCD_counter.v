/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)*/

module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire [3:0] _count;
    wire JA, JB, JC, JD, KA, KB, KC, KD;
    wire not_A;
    and(JA, count[0], count[1], count[2]);
    assign KA = count[0];
    and(JB, count[0], count[1]);
    and(KB, count[0], count[1]);
    not(not_A, count[3]);
    and(JC, not_A, count[0]);
    assign KC = count[0];
    assign JD = 1;
    assign KD = 1;
    
    edge_trigger_JKFF A(reset_n, JA, KA, clk, count[3], _count[3]);
    edge_trigger_JKFF B(reset_n, JB, KB, clk, count[2], _count[2]);
    edge_trigger_JKFF C(reset_n, JC, KC, clk, count[1], _count[1]);
    edge_trigger_JKFF D(reset_n, JD, KD, clk, count[0], _count[0]);
    ////////////////////////
	
endmodule

module decade_counter_2digits(input reset_n, input clk, output [7:0] count);

    ////////////////////////
    decade_counter A(reset_n, clk, count[3:0]);
    decade_counter B(reset_n, count[3], count[7:4]);
    ////////////////////////
	
endmodule
