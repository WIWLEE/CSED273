
/* Active Low 2-to-4 Decoder*/
module decoder_2_4(
    input wire en,
    input wire [1:0] in,
    output wire [3:0] out 
    );

    nand(out[0], in[0], in[1], en);
    nand(out[1],  ~in[0], in[1], en);
    nand(out[2], in[0],  ~in[1], en);
    nand(out[3],  ~in[0],  ~in[1], en);

endmodule


/* Implement Active Low 4-to-16 Decoder*/
module decoder_4_16(
    input wire en,
    input wire [3:0] in,
    output wire [15:0] out
    );

    ////////////////////////
    wire en1, en2, en3, en4;
    decoder_2_4 A(en,{in[3],in[2]},{en4,en3,en2,en1});
    decoder_2_4 B(en1, {in[1],in[0]},{out[3],out[2],out[1],out[0]});
    decoder_2_4 C(en2, {in[1],in[0]},{out[7],out[6],out[5],out[4]});
    decoder_2_4 D(en3, {in[1],in[0]},{out[11],out[10],out[9],out[8]});
    decoder_2_4 E(en4, {in[1],in[0]},{out[15],out[14],out[13],out[12]});
    ////////////////////////

endmodule


/* Implement 4:1 mux */
module mux_4_1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    assign out = (in[0] & ~select[1] & ~select[0]) |
                 (in[1] & ~select[1] & select[0]) |
                 (in[2] & select[1] & ~select[0]) |
                 (in[3] & select[1] & select[0]);
    ////////////////////////

endmodule

/* 2-to-1 Multiplexer*/
module mux_2_1(
    input wire data_input1,
    input wire data_input2,
    input wire select_input,
    output wire out
    );

	wire i0, i1;
	and(i0, ~select_input, data_input1);
	and(i1, select_input, data_input2);
	or(out, i0, i1);

endmodule


/* 8-to-1 Multiplexer*/
module mux_8_1(
    input wire [7:0] data_input,
    input wire [2:0] select_input,
    output wire out
    );

    wire i0, i1, i2, i3, i4, i5, i6, i7;
    and(i0, ~select_input[2], ~select_input[1], ~select_input[0], data_input[0]);
    and(i1, ~select_input[2], ~select_input[1],  select_input[0], data_input[1]);
    and(i2, ~select_input[2],  select_input[1], ~select_input[0], data_input[2]);
    and(i3, ~select_input[2],  select_input[1],  select_input[0], data_input[3]);
    and(i4,  select_input[2], ~select_input[1], ~select_input[0], data_input[4]);
    and(i5,  select_input[2], ~select_input[1],  select_input[0], data_input[5]);
    and(i6,  select_input[2],  select_input[1], ~select_input[0], data_input[6]);
    and(i7,  select_input[2],  select_input[1],  select_input[0], data_input[7]);
    or(out, i0, i1, i2, i3, i4, i5, i6, i7);

endmodule

module mux_2_1_10bit(
    input wire [9:0] data_input1,
    input wire [9:0] data_input2,
    input wire select_input,
    output wire [9:0] out
    );

   mux_2_1 A(data_input1[0], data_input2[0], select_input, out[0]);
   mux_2_1 B(data_input1[1], data_input2[1], select_input, out[1]);
   mux_2_1 C(data_input1[2], data_input2[2], select_input, out[2]);
   mux_2_1 D(data_input1[3], data_input2[3], select_input, out[3]);
   mux_2_1 E(data_input1[4], data_input2[4], select_input, out[4]);
   mux_2_1 F(data_input1[5], data_input2[5], select_input, out[5]);
   mux_2_1 G(data_input1[6], data_input2[6], select_input, out[6]);
   mux_2_1 H(data_input1[7], data_input2[7], select_input, out[7]);
   mux_2_1 I(data_input1[8], data_input2[8], select_input, out[8]);
   mux_2_1 J(data_input1[9], data_input2[9], select_input, out[9]);

endmodule


