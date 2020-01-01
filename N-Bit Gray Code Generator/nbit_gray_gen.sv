/* Eric Schulte, Portland State University, Aug. 2019
   n-bit gray code generator
   Sequentially generates an n-bit-wide, 2^n length sequence of gray code.
   A007814 sequence generation logic (denoted in comments) courtesy of:
   Redjan Shabani, Sapienza University of Rome, July 17 2012 - oeis.org/A007814 */

module n_bit_gen #(
parameter n = 3, //Gray code bit width
parameter length = 'b1 << n)(clk, out); //2^n Sequence length

input logic clk;
output logic [n:1] out;

int j;
int k = 'd1;
bit [length:1][n:1]shift; // Packed array 'shift'
bit [length:1][n:1]seq; // Packed array 'seq'

initial begin

shift[2] = 1'b1;

for(j=3; j<=(length+1); j=j+1)
	if (shift[j-2] != 0)begin
		shift[j] = shift[j-(j/2)]+1'b1; //Courtesy of R. Shabani
		seq[j-1] = 'b1 << shift[j-2];
		seq[j-1] = seq[j-1]^seq[j-2];
		end
	else begin
		shift[j] = 1'b0; //Courtesy of R. Shabani
		seq[j-1] = 'b1 << shift[j-2];
		seq[j-1] = seq[j-1]^seq[j-2];
		end

	for(j=1; j<=length; j=j+1)
		$display ("Seq %d = %b", j, seq[j]);

end

// Output the kth row of 'seq' each posedge clk
always_ff @(posedge clk) begin
	if ((k==k) && (k <= length)) begin
		out <= seq[k];
		k <= k+1;
		end
	else
		out <= 'bx;
end

endmodule
