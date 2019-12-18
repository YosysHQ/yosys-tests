module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output cout
 );
 parameter WIDTH = 1;
 wire o;

assign cout =  cin ? y : x;

endmodule

module middle
(
	input x,
	input y,
	output o
);

assign o = x + y;
endmodule
