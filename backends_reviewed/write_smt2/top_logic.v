module top
(
 input x,
 input y,
 input z,
 input clk,

 input A,
 output B
 );


assign  B = (x || y || !z)?  (A & z) : ~x;

endmodule
