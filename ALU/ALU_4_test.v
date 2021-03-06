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


module AL_4(input [3:0] A,B,
		input S1, S0,
		output reg [3:0] G_L);

always @ *
	case({S1, S0})
		2'b00: G_L = A & B; //AND
		2'b01: G_L = A | B; //OR
		2'b10: G_L = A ^ B; //XOR
		2'b11: G_L = ~A; //NOT
	endcase
endmodule


module ALU_4(input [3:0] A, B,
		input Cin, S0, S1, S2,
		output reg [3:0] G,
		output reg Cout);

	wire [3:0] G_A, G_L;
	wire Cout_sub;

AL_4 M9(A, B, S1, S0, G_L);
AU_4 M10(A, B, S1, S0, Cin, Cout_sub, G_A);

always @ *
if(S2 == 1)
begin 
	{Cout, G} = {1'b0, G_L};
end
else
begin
	{Cout, G} = {Cout_sub, G_A};
end
endmodule

module ALU_4_test;
	reg [3:0] A, B;
	reg Cin, S2, S1, S0;
	wire [3:0] G;
	wire Cout;

ALU_4 ALU_4(.S2(S2), .S1(S1), .S0(S0), .Cin(Cin), .A(A), .B(B), .Cout(Cout), .G(G));

initial begin
A = 4'b1111;
B = 4'b0001;
S2 = 0; S1 = 0; S0 = 0; Cin = 0;
#100
S2 = 0; S1 = 0; S0 = 0; Cin = 1;
#100
S2 = 0; S1 = 0; S0 = 1; Cin = 0;
#100
S2 = 0; S1 = 0; S0 = 1; Cin = 1;
#100
S2 = 0; S1 = 1; S0 = 0; Cin = 0;
#100
S2 = 0; S1 = 1; S0 = 0; Cin = 1;
#100
S2 = 0; S1 = 1; S0 = 1; Cin = 0;
#100
S2 = 0; S1 = 1; S0 = 1; Cin = 1;
#100
S2 = 1; S1 = 0; S0 = 0; Cin = 0;
#100
S2 = 1; S1 = 0; S0 = 0; Cin = 1;
#100
S2 = 1; S1 = 0; S0 = 1; Cin = 0;
#100
S2 = 1; S1 = 0; S0 = 1; Cin = 1;
#100
S2 = 1; S1 = 1; S0 = 0; Cin = 0;
#100
S2 = 1; S1 = 1; S0 = 0; Cin = 1;
#100
S2 = 1; S1 = 1; S0 = 1; Cin = 0;
#100
S2 = 1; S1 = 1; S0 = 1; Cin = 1;
#100
$stop;
end
endmodule
