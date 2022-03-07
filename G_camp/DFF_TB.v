module DFF_TB;
reg P, clock;
wire Q;

DFF DUT(.D(P), .clk(clock), .Q(Q));

initial begin
clock = 0;
repeat(1000)
#20 clock = ~clock;
end

initial begin
P = 1; #100;
P = 0;
end

endmodule