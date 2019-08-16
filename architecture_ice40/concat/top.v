module top
(
 input x,
 input [1:0] y,
 input z,

 output [1:0] A,
 output [2:0] B,
 output [3:0] C
 );


`ifndef BUG
assign A =  {x,z};
assign B = {x,y};
assign C =  {x,y,z};
`else
assign A =  x + z;
assign B = x * y;
assign C =  x - y - z;
`endif

endmodule
