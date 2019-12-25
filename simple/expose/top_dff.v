module dff
    ( input d, clk, output reg q );
	always @( posedge clk )
            q <= d;
endmodule


module top (
input clk,
input a,
output b
);

dff u_dff (
        .clk (clk),
        .d (a ),
        .q (b )
    );

endmodule

