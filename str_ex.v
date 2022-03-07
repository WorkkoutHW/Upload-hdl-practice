module and3(a, b, c, y);
	input a, b, c;
	output y;

assign y = a & b & c;
endmodule

module inv(a, y);
	input a;
	input y;

assign y = ~a;
endmodule 

module nand3(a, b, c, y);
	input a, b, c;
	output y;

	wire n1;

and3 u0(a, b, c, n1);
inv inv(n1, y);
endmodule	
