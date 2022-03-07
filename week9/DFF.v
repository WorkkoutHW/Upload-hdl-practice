module DFF(input clock, reset,
		input din,
		output reg dout);

always @ (posedge clock or negedge reset)
	if (reset == 0) dout <= 0;
	else dout <= din;
endmodule 
