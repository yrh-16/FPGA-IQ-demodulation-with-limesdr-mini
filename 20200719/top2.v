module top2(
	input clk,
	input [11:0] IQ,
	output [11:0] outputData
	);
	
	reg clk_enable = 1;
	reg reset = 0;
	reg [11:0] regI;
	wire [11:0] arc;
	
	cordic2 actan(
		.clk(clk),    //    clk.clk
		.areset(1'b0), // areset.reset
		.x(IQ),      //      x.x
		.y(IQ),      //      y.y
		.q(arc));       //      q.q
	
	unwrap suiBian(.clk(clk),
						.inphase(arc),
						.data(outputData));
	
endmodule
