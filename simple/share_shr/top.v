module top    (
out,
out1,
clk,
in
);
    output [7:0] out;
    output [7:0] out1;
    input signed clk, in;
    reg signed [7:0] out;
    reg signed [7:0] out1;

    always @(posedge clk)
	begin
		out    <= out >> 1;
		out[7] <= in;
	end

	always @(posedge clk)
	begin
		out1    <= out1 >> 1;
		out1[7] <= in;
	end

endmodule
