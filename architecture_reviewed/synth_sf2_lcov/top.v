module dff
    ( input d, clk, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk )
            q <= d;
endmodule
