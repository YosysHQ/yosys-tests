module dffsr
    ( input d, clk, pre, clr, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk, posedge pre, posedge clr )
		if ( clr )
			q <= 1'b0;
		else if ( pre )
			q <= 1'b1;
		else
            q <= d;
endmodule

module ndffnsnr
    ( input d, clk, pre, clr, output reg q );
    initial begin
      q = 0;
    end
	always @( negedge clk, negedge pre, negedge clr )
		if ( !clr )
			q <= 1'b0;
		else if ( !pre )
			q <= 1'b1;
		else
            q <= d;
endmodule
