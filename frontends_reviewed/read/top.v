module top
(
 input x,
 input y,
 input cin,
 input clk,

 output A,
 output cout
 );

 assign    A =  y + cin;
 assign   cout =  x + A;

endmodule
