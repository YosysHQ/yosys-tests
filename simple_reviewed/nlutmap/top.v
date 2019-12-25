module top
(
 input x,
 input y,
 input cin,

 output A,
 output cout
 );
wire  p,r,s;
	xor (p,x,y);
	xor (A,p,cin);

	and(r,p,cin);
	and(s,x,y);
	or(cout,r,s);

endmodule
