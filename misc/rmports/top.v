module top
(
 input x,
 input x,
 input z,
 input cin,

 output reg A,
 output cout
 );
 parameter X = 1;
 wire o;

always @(posedge cin)
	A <= o;

middle u_mid (.z(z),.x(x),.o(o));

endmodule

module middle
(
	input x,
	input y,
	input z,
	output o
);

assign o = x + y;
endmodule
