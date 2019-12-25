module top
(
 input x0,x1,
 input y0,y1,
 input cin,

 output A0,A1,
 output cout
 );
 wire cout0;

assign {cout0,A0} =  cin + y0 + x0;
assign {cout,A1} =  cout0 + y1 + x1;

endmodule
