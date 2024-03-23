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