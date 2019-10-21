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

//assign cout =  cin? y : x;

middle u_mid (.x(x),.o(o));
u_rtl inst_u_rtl (.x(x),.o(o));

endmodule

module middle
(
	input x,
	input y,
	output o
);

assign o = x + y;
endmodule

module u_rtl
(
	input x,
	input y,
	output o
);

assign o = x + y;
endmodule
