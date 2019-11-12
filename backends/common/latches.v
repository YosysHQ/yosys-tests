module top ( input d, clk, en, output reg q );
	always @*
		if ( en )
			q <= d;
endmodule
