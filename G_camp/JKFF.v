module JKFF(input J, K,
	    input clk,
	    output reg out);

always @ (posedge clk) begin
if(J == 0 && K == 0) 
	begin end
else if(J == 0 && K == 1) 
	begin out <= 1'b0; end
else if(J == 1 && K == 0) 
	begin out <= 1'b1; end
else 
	begin out <= ~out; end
end

endmodule