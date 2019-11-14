module top
(
 input signed x,
 input signed y,
 input signed cin,

 output signed A,
 output signed cout,
 output signed B,C,
 output signed D,E
 );


assign A =  y >> x;
assign cout =  y + A >>> y;
assign D =  y >> 2;
assign E =  y + A >>> 2;
assign {B,C} =  {cout,A} << 1;

endmodule
