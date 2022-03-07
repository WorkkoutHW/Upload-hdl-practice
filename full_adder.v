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