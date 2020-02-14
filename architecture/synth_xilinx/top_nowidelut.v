module top
(
    input [7:0] x,
    output A,
);
    assign A = ^x;
endmodule
