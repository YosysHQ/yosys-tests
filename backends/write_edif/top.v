module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout
 );
 
 initial begin
    A = 0;
    cout = 0;
 end

`ifndef BUG
always @(posedge x) begin
    A <=  y + cin;
end
always @(negedge x) begin
    cout <=  y + A;
end
`else
assign {cout,A} =  cin - y * x;
`endif

bb ubb (cin,y,x);

endmodule

(* black_box *) module bb(in1, in2, clk);
 input in1;
 input in2;
 input clk;
endmodule
