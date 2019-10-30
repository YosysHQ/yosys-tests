module dffs
    ( input d, clk, pre, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk, negedge pre )
		if ( !pre )
			q <= 1'b1;
		else
            q <= d;
endmodule

module dffr
    ( input d, clk, clr, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk, negedge clr )
		if ( !clr )
			q <= 1'b0;
		else
            q <= d;
endmodule
