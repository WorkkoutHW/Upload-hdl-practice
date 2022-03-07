module GATE_TB;
reg A, B;
wire C;

GATE DUT(.A(A), .B(B), .C(C));
initial begin
A = 0; B = 0; #500;
A = 0; B = 1; #500;
A = 1; B = 0; #500;
A = 1; B = 1; #500;
A = 0; B = 0;
end
endmodule