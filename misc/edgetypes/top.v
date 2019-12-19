module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout
 );

 initial begin
    begin
        A = 0;
        cout = 0;
    end
 end

always @(posedge x) begin
    A <=  y + cin;
end
always @(negedge x) begin
        cout <=  y + A;
end

endmodule
