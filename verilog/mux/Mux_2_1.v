
`timescale 1 ns / 1 ps

module Mux_2_1 (
	input       a,
	input       b,
	input       sel,
	output wire y
);

assign y = (sel == 1'b0)? a : b;

endmodule

