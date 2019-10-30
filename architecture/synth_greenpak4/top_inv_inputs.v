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

module top (
input clk,
input clr,
input pre,
input [3:0] a,
output [3:0] b
);

adff u_adff (
        .clk (~clk ),
        .clr (~clr),
        .d (~a ),
        .q (b )
    );

endmodule
