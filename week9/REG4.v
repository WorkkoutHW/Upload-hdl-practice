module REG4(input clock, reset,
		input [3:0] din,
		output reg [3:0] dout);

always @ (posedge clock or negedge clock)
if (reset == 0) dout <= 4'b0000;
else dout <= din;
endmodule 