module top
(
 input x,
 input y,
 input cin,
 output cout
 );

assign cout =  cin? y : x;

endmodule
