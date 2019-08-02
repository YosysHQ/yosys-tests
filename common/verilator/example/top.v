module top(input clk, input [127:0] din, output [1:0] miter);
	assign miter[0] = ~(din[127:64] & din[63:0]) != ((~din[127:64]) | (~din[63:0]));

	wire [127:0] mul_gold = din[127:64] * din[63:0];
	wire [95:0] mul_temp = din[127:64] * din[63:32];
	wire [127:0] mul_gate = din[127:64] * din[31:0] + {mul_temp, 32'd0};
	assign miter[1] = mul_gate != mul_gold;
endmodule