module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout,
 output c
 );

 initial begin
    A = 0;
    cout = 0;
 end

 assign c = 1'b0;

always @(posedge x) begin
    A <=  y + cin;
end
always @(negedge x) begin
    cout <=  y + A;
end

endmodule
