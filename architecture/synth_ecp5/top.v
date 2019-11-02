module dff
    ( input d, clk, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk )
            q <= d;
endmodule

module dffe
    ( input d, clk, en, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk)
		if ( en )
			q <= d;
endmodule

module adff
    ( input d, clk, clr, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk, posedge clr )
		if ( clr )
			q <= 1'b0;
		else
            q <= d;
endmodule
