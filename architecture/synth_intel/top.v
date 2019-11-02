module top
(
 input [3:0] x,
 input [3:0] y,
 input [3:0] cin,

 output [4:0] A,
 output [4:0] cout
 );

assign {cout,A} =  cin + y + x;

endmodule
