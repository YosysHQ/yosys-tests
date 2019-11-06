module top
(
 input [1:0] x,
 input [1:0] y,
 input [1:0] z,
 input clk,

 input A,
 output reg B
 );

 initial begin
    B = 0;
 end

always @(posedge clk) begin
    if (x || y && z)
        B <=  A & z;
    if (x || y && !z)
        B <=  A | x;
end

always @(negedge clk) begin
    if (x || y && z)
        A <=  x & z;
end

endmodule
