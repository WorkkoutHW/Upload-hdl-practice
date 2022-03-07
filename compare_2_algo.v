module compare_2_algo(	output reg A_lt_B, A_gt_B, A_eq_B,
			input [1:0] A,B);

always @ (A or B)
begin 
assign A_lt_B = 0;
assign A_gt_B = 0;
assign A_eq_B = 0;

if (A==B) A_eq_B = 1;
else if (A>B) A_gt_B = 1;
else A_lt_B = 1;
end
endmodule
