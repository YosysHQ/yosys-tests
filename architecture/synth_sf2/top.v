module dff
    ( input d, clk, output reg q );
	always @( posedge clk )
            q <= d;
endmodule

module dffe
    ( input d, clk, en, output reg q );
	always @( posedge clk)
		if ( en )
			q <= d;
endmodule

module adff
    ( input d, clk, clr, output reg q );
	always @( posedge clk, posedge clr )
		if ( clr )
			q <= 1'b0;
		else
            q <= d;
endmodule
