module top
(
 input x,
 input y,
 input cin,

 output A,
 output cout
 );

assign cout =  cin % y;
assign A =  cin - x;

endmodule
