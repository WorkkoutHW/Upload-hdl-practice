module mux2(d0, d1, s, y);
	
	parameter word_size = 4;
	input [word_size-1:0] d0, d1; 
	input s;
	output [word_size-1:0] y;

assign y = s ? d1 : d0;
endmodule


module mux4(d0, d1, d2, d3, s, y);
	input [15:0] d0, d1, d2, d3;
	input [1:0] s;
	output [15:0] y;
	wire [15:0] y0, y1;

mux2 #(16) u0(d0, d1, s[0], y0);
mux2 #(16) u1(d2, d2, s[0], y1);
mux2 #(16) u2(y0, y1, s[1], y);

endmodule 