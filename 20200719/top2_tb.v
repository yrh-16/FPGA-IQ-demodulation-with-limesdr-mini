`timescale 1ns/1ps

module top2_tb();
	
	reg [11:0] data_mem[0:255];
	reg unsigned [7:0] index = 0;
	reg clk;
	reg [11:0] IQ;
	wire [11:0] value;
	
	
	initial	
	begin
		$readmemb("C:/Users/Administrator/Desktop/sin.txt", data_mem);
		index = 8'b0;
		IQ = 12'b0;

	end
	
	initial
	begin
	clk = 0;
		forever
		#50 clk = ~clk;
	end
	
	initial 
	begin
	# 10000 $stop;
	end
	
	always @(posedge clk)
	begin
	
		IQ <= data_mem[index];
		index <= index + 8'b1;
	end
	
	top2 top2(
	.clk(clk),
	.IQ(IQ),
	.outputData(value));	

	
	
endmodule
