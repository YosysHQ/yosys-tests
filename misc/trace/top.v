module top
(
 input x,
 input y,
 input cin,

 output A,
 output cout
 );

assign {cout,A} =  cin + y + x;

endmodule
