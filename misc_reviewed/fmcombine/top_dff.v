module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output cout
 );
 parameter X = 1;
 wire o;

always @(posedge cin)
	A <= o;

assign cout =  cin? y : x;

middle u_mid1 (.clk(cin),.x(x),.o(o),.y(1'b0));
middle u_mid2 (.clk(cin),.x(x),.o(o),.y(1'b1));
middle u_mid3 (.clk(cin),.x(x),.o(o),.y(1'bX));
middle u_mid4 (.clk(cin),.x(x),.o(o),.y(1'bX));

endmodule

module middle
(
	input clk,
	input x,
	input y,
	output o
);

urtl u_urtl (.clk(clk),.x(x),.o(o),.y(y));

endmodule

module urtl
(
	input clk,
	input x,
	input y,
	output reg o
);
always @(posedge clk)
	o <= x + y;
endmodule
