module dffr
    ( input d, clk, rst, output reg q );
	always @( posedge clk )
		if ( rst )
			q <= 1'b0;
		else
            q <= d;
endmodule


module top (
input clk,
input a,
output b
);

dffr u_dffr (
        .clk (clk),
        .rst (1'b1),
        .d (a ),
        .q (b )
    );

endmodule

