module top(
	input clk,
	input [11:0] IQ,
	output [11:0] outputData
	);
	
	reg clk_enable = 1;
	reg reset = 0;
	wire [11:0] filter_out_I, filter_out_Q;
	reg [11:0] regI = 0;
	wire [11:0] arc;
	
	
	filter filterI(
			.clk(clk),
         .clk_enable(clk_enable),
         .reset(reset),
         .filter_in(IQ),
         .filter_out(filter_out_I)
         );
			
	filter filterQ(
			.clk(~clk),
         .clk_enable(clk_enable),
         .reset(reset),
         .filter_in(IQ),
         .filter_out(filter_out_Q)
         );
			
	
	always @(posedge clk)
	begin
		regI <= filter_out_I;		
	end
	
	cordic2 actan(
		.clk(clk),    //    clk.clk
		.areset(1'b0), // areset.reset
		.x(regI),      //      x.x
		.y(filter_out_Q),      //      y.y
		.q(arc));       //      q.q

	
	
	
	unwrap suiBian(.clk(clk),
						.inphase(arc),
						.data(outputData));
	
endmodule
