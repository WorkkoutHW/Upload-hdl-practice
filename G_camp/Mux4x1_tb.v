
module Mux4x1_tb();

reg [3:0] data;
reg [1:0] select;
wire out;


Mux4x1 DUT(.data(data), .select(select), .out(out));

initial begin
data = 4'b1010;
select = 2'b00; #10;
select = 2'b01; #10;
select = 2'b10; #10;
select = 2'b11; #10;
end
 
endmodule