module top
(
 input [3:0] x,
 input [3:0] y,

 output [3:0] A,
 output [3:0] B
 );

`ifndef BUG
assign A =  x * y;
assign B =  x ** y;
`else
assign A =  x ** y;
assign B =  y * x;
`endif

endmodule
