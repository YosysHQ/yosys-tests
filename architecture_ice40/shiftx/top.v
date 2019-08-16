
// VERIFIC-SKIP

module top(a, y);
input [4:0] a;
output y;

integer i = 0, j = 0;
reg [31:0] lut;

initial begin
	for (i = 0; i < 32; i = i+1) begin
		lut[i] = i > 1;
		for (j = 2; j*j <= i; j = j+1)
			if (i % j == 0)
			`ifndef BUG
				lut[i] = 0;
`else
				lut[i] = 1;
`endif
	end
end
`ifndef BUG
assign y = lut[a];
`else
assign y = lut[!a];
`endif

endmodule
