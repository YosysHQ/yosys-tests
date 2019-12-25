module dff (clk, d, q);
    input clk;
    input d;
    output reg q;

    always @(posedge clk)
         q <= d;
endmodule


module top (
input clk,
input a,
output b
);

dff u_dff (
        .clk (clk ),
        .d (1'b0 ),
        .q (b )
    );

endmodule
