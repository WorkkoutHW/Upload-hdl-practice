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

module MUX_4x1 (input S1, S0,
		input I1, I2,
		output Y);
	
		wire w1, w2;

and (w1, I1, S0);
and (w2, I2, S1);
or(Y, w1, w2);
endmodule

module AU_4(input [3:0] A, B,
		input S1, S0,
		input Cin,
		output Cout,
		output [3:0] G);


		wire c_in1, c_in2, c_in3;
		wire [3:0] Bbar, Y;

not (Bbar[0], B[0]);
not (Bbar[1], B[1]);
not (Bbar[2], B[2]);
not (Bbar[3], B[3]);

MUX_4x1 M1(S1, S0, B[0], Bbar[0], Y[0]);
MUX_4x1 M2(S1, S0, B[1], Bbar[1], Y[1]);
MUX_4x1 M3(S1, S0, B[2], Bbar[2], Y[2]);
MUX_4x1 M4(S1, S0, B[3], Bbar[3], Y[3]); 

full_add M5(A[0], Y[0], Cin, c_in1, G[0]);
full_add M6(A[1], Y[1], c_in1, c_in2, G[1]);
full_add M7(A[2], Y[2], c_in2, c_in3, G[2]);  
full_add M8(A[3], Y[3], c_in3, Cout, G[3]);
 
endmodule
