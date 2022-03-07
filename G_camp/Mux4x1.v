module Mux4x1(input [3:0] data,
	      input [1:0] select,
		output reg out);

always @ (data or select) begin

	case(select)
	2'b00: out = data[0];
	2'b01: out = data[1];
	2'b10: out = data[2];
	2'b11: out = data[3];
	endcase

end

endmodule