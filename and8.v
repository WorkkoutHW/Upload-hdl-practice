module and8(a, y);
input [7:0] a;
output y;

assign y = &a; // all of a is combined

endmodule