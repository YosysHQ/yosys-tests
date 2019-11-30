module latch
    ( input d, clk, clr, output reg q );
    initial begin
      q = 0;
    end
	always @ (clk or clr)
		if ( clr )
			q <= 1'b0;
		else
            q <= d;
endmodule
