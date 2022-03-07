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


module Add_rca_4 (output sum[3:0],
			output c_out,
			input a[3:0],
			input b[3:0],
			input c_in);

	wire w1, w2, w3;

full_add M1 (a[0], b[0], c_in, w1, sum[0]);
full_add M1 (a[1], b[1], w1, w2, sum[1]);
full_add M1 (a[2], b[2], w2, w3, sum[2]);
full_add M1 (a[3], b[3], w3, c_out, sum[3]);

endmodule