/* Eric Schulte, Portland State University, Aug. 2019
   n-bit gray code generator test bench */

module TB;

	logic CLK;
	logic [3:1] OUT; // Packed ([n:1] wide)
	
	n_bit_gen generator(.clk(CLK), .out(OUT));
	localparam half_per = 5; // .5 clk period
	
	// Generate input signals
	initial begin
		CLK = 1'b0;
		
		forever begin
			#half_per CLK = 1'b1;
			#half_per CLK = 1'b0;
		end
	end
		
	initial begin
		#100 $finish;
	end
	
endmodule
