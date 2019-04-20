module top
(
 input x,
 input y,
 input cin,
 input clk,

 output A,
 output cout
 );

 initial begin
    A = 0;
    cout = 0;
 end

`ifndef BUG
 assign    A =  y + cin;
 assign   cout =  y + A;

`else
assign {cout,A} =  cin - y * x;
`endif

endmodule
