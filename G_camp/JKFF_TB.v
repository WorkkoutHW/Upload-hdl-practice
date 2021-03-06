module JKFF_TB;
reg J, K, clock;
wire out;

JKFF DUT(.J(J), .K(K), .clk(clock), .out(out));

initial begin
J = 0; K = 0; # 10;
J = 0; K = 1; # 10;
J = 1; K = 0; # 10;
J = 1; K = 1; # 10;
J = 0; K = 0;
end

initial begin
clock = 0;
repeat(1000)
#5 clock = ~clock;
end

endmodule