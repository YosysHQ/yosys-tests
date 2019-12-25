module latsr
    ( input d, clk, pre, clr, output reg q );
	always @(*)
		if ( pre )
			q <= 1'b1;
		else if ( clr )
			q <= 1'b0;
		else
            q <= d;
endmodule

module top (
input clk,
input a,
output b
);

latsr u_latsr (
        .clk (clk ),
        .clr (1'b1),
        .pre (1'b1),
        .d (a ),
        .q (b )
    );

endmodule
