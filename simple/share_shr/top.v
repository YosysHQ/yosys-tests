module top    (
out,
clk,
in
);
    output [7:0] out;
    input clk, in;
    reg signed [7:0] out;

    always @(posedge clk)
	begin
		out    <= out >> 1;
		out[7] <= in;
	end

endmodule
