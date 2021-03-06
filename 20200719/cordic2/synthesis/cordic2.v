// cordic2.v

// Generated using ACDS version 15.0 145

`timescale 1 ps / 1 ps
module cordic2 (
		input  wire        areset, // areset.reset
		input  wire        clk,    //    clk.clk
		output wire [11:0] q,      //      q.q
		input  wire [11:0] x,      //      x.x
		input  wire [11:0] y       //      y.y
	);

	cordic2_CORDIC_0 cordic_0 (
		.clk    (clk),    //    clk.clk
		.areset (areset), // areset.reset
		.x      (x),      //      x.x
		.y      (y),      //      y.y
		.q      (q)       //      q.q
	);

endmodule
