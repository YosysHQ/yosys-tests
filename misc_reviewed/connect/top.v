module top
    ( input d, d1, clk, output reg q );
	always @( posedge clk )
            q <= d;
endmodule
