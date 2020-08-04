`timescale 1ns/1ps
module unwrap_tb();
  reg clk;
  reg signed [11:0] phase;
  wire [11:0] outphase;
  
  unwrap unwrap0(.clk(clk),.inphase(phase),.outphase(outphase));
  
  initial begin
    clk = 0;
	 forever
	   #50 clk = ~clk;
	 end
	 
  initial begin
    phase = 12'b000000000000;
	 #100 phase = 12'b000000000000;
	 #100 phase = 12'b000000010000;
	 #100 phase = 12'b000000100000;
	 #100 phase = 12'b000001000000;
	 #100 phase = 12'b000010000000;
	 #100 phase = 12'b000100000000;
	 #100 phase = 12'b001000000000;
	 #100 phase = 12'b010000000000;
	 
	end
endmodule
	 
	 