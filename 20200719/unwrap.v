module unwrap(clk, inphase, data);
   parameter signed pi = 12'b011001001000;
	parameter signed pi_half = 12'b001100100100;
   input [11:0]inphase;
	input clk;
	output reg [11:0] data = 0;
	reg [11:0]outphase = 0;
	reg [11:0] reg1, d1, d2 = 0; 
	reg signed [11:0]phase, phase1 = 0;
	reg signed [11:0]phase_reg, phase_reg1 = 0;
	//Delay signal to have p(i) and p(i-1)
	always @(posedge clk)
	begin
	phase <= inphase;
	phase_reg <= phase;	
	end
	
	always @(posedge clk)
	begin
	   if((phase - phase_reg)> pi_half && phase != 12'b0 && phase_reg != 12'b0)
		  outphase <= phase - pi;
		else if((phase_reg-phase)> pi_half && phase != 12'b0 && phase_reg != 12'b0)
		  outphase <= phase + pi;
	   else
		  outphase <= phase;
	end
	

	always @(posedge clk)
	begin
		  phase1 <= outphase;
		  phase_reg1 <= phase1;
		  data <= phase1 - phase_reg1;
	end
	


//	
endmodule
