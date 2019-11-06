module top
(
 input x,
 input y,
 input cin,

 output A,
 output cout,
 output signed pow,
 output signed pow2
 );

 wire p,n;

assign pow = 2 ** y;
assign pow2 = 2 ** 2;

assign p =  +x;
assign n =  -x;
assign A =  cin * x;

endmodule
