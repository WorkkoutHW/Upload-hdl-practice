module DFF_syn(input data, clk, reset, set,
		output reg q,
		output q_bar);

not (q_bar, q);

always @ (posedge clk)
begin
if (reset == 0) q <= 1'b0;
else if (set == 0) q <= 1'b1;
else q <= data;
end

endmodule