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

module adffn
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

module dffe
    ( input d, clk, en, output reg q );
    initial begin
      q = 0;
    end
	always @( posedge clk )
		if ( en )
			q <= d;
endmodule

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

module top (
input clk,
input clr,
input pre,
input a,
output b,b1,b2,b3,b4
);

dffsr u_dffsr (
        .clk (clk ),
        .clr (1'b1),
        .pre (pre),
        .d (1'b0 ),
        .q (b )
    );

ndffnsnr u_ndffnsnr (
        .clk (clk ),
        .clr (clr),
        .pre (1'b0),
        .d (1'b0 ),
        .q (b1 )
    );

adff u_adff (
        .clk (clk ),
        .clr (1'b1),
        .d (1'b0 ),
        .q (b2 )
    );

adffn u_adffn (
        .clk (clk ),
        .clr (1'b1),
        .d (a ),
        .q (b3 )
    );

dffe u_dffe (
        .clk (clk ),
        .en (clr),
        .d (1'b0 ),
        .q (b4 )
    );

endmodule
