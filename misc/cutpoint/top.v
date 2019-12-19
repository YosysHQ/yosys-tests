module bb
(
 input x,
 input y,
 input cin,

 output A,
 output cout
 );


assign {cout,A} =  cin + y + x;

endmodule

module top
(
 input x,
 input y,
 input cin,

 output A,
 output cout
 );

bb u_bb (x,y,cin,A,cout);

endmodule
