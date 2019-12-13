module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output cout
 );
 wire o;

always @(posedge cin)
	A <= y + x;

assign cout =  cin + A;

endmodule
