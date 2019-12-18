module top
(
 input x,
 input y,
 input z,

 output A,
 output B
 );

 wire A1,B1,A2,B2;

 assign A1 = x & A2;
 assign A2 = A1 & y;
 assign A = ~A2;

endmodule
