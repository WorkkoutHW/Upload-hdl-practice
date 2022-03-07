module inverter(a, y);
input [5:0] a;
output [5:0] y;

assign y = ~a;

endmodule