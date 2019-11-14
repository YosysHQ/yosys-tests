module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout
 );

 reg ASSERT = 1;
 (* anyconst *) reg foo;
 (* anyseq *) reg too;



 initial begin
    begin
        A = 0;
        cout = 0;
    end
 end

always @(posedge x) begin
    if ($initstate)
        A <= 0;
    A <=  y + cin + too;
end

endmodule

module top2
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout
 );

 reg ASSERT = 1;
 (* anyconst *) reg foo;
 (* anyseq *) reg too;



 initial begin
    begin
        A = 0;
        cout = 0;
    end
 end

always @(posedge x) begin
    if ($initstate)
        A <= 0;
    A <=  y + cin + too;

end
always @(posedge x) begin
    if ($initstate)
        cout <= 0;
        cout <=  y + A + foo;

end

endmodule

