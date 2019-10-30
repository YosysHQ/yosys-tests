module dff
    ( input [3:0] d, input clk, clr, output reg [3:0] q );
    initial begin
      q = 4'b0000;
    end
	always @( posedge clk )
		if ( clr )
			q <= 4'b0110;
		else
            q <= d;
endmodule

module adff
    ( input [3:0] d, input clk, clr, output reg [3:0] q );
    initial begin
      q = 4'b0000;
    end
	always @( posedge clk, posedge clr )
		if ( clr )
			q <= 4'b0110;
		else
            q <= d;
endmodule

module dffe
    ( input [3:0] d, input clk, en, output reg [3:0] q );
    initial begin
      q = 4'b0010;
    end
	always @( posedge clk)
		if ( en )
			q <= d;
endmodule

module dffse
    ( input [3:0] d, input clk, en, pre, output reg [3:0] q );
    initial begin
      q = 1;
    end
	always @( posedge clk )
		if ( !pre )
			q <= 4'b0101;
		else
			if ( en )
				q <= d;
endmodule
