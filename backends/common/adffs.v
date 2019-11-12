module top( input d, clk, clr, output reg q );
    initial begin
        q = 0;
    end
	  always @( posedge clk, posedge clr )
      if ( clr )
        q <= 1'b0;
      else
        q <= d;
endmodule
