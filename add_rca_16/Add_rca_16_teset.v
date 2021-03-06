module half_add(input a, 
		input b, 
		output sum, 
		output c_out);

xor (sum, a, b);
and (c_out, a, b);
endmodule

module full_add(input a,
		input b,
		input c_in,
		output c_out,
		output sum);

	wire w1, w2, w3;

half_add h1(a, b, w1, w2);
half_add h2(c_in, w1, sum, w3);
or (c_out, w2, w3);
endmodule


module Add_rca_4 (output [3:0] sum,
			output c_out,
			input [3:0] a, b,
			input c_in);

	wire w1, w2, w3;

full_add M1 (a[0], b[0], c_in, w1, sum[0]);
full_add M2 (a[1], b[1], w1, w2, sum[1]);
full_add M3 (a[2], b[2], w2, w3, sum[2]);
full_add M4 (a[3], b[3], w3, c_out, sum[3]);

endmodule

module Add_rca_16 (output [15:0] sum,
			output c_out,
			input [15:0] a, b,
			input c_in);

	wire c_in4, c_in8, c_in12;

Add_rca_4 M1(sum[3:0], c_in4, a[3:0], b[3:0], c_in);
Add_rca_4 M2(sum[7:4], c_in8, a[7:4], b[7:4], c_in4);
Add_rca_4 M3(sum[11:8], c_in12, a[11:8], b[11:8], c_in8);
Add_rca_4 M4(sum[15:12], c_out, a[15:12], b[15:12], c_in12);

endmodule


module Add_rca_16_test;
	wire [15:0] sum;
	wire c_out;
	reg [15:0] a, b;
	reg c_in;
	integer i, j, k;

Add_rca_16 Add_rca_16(sum, c_out, a, b, c_in);

initial
begin
for(i = 0; i <= 15; i = i + 1)
	for(j = 0; j <= 15; j = j + 1)
		for(k = 0; k <= 15; k = k + 1)
			begin 
			a = i; b = j; c_in = k;
			#50000;
			end
		$stop;
	end
endmodule