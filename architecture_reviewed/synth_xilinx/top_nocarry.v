module top
(
    input [2:0] x,
    input [2:0] y,

    output [5:0] A,
);
    assign A =  x * y;
endmodule
