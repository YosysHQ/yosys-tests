module top    (
out,
clk,
in
);
    output [7:0] out;
    input clk, in;
    reg [7:0] out;

    always @(posedge clk)
	begin
		out    <= out << 1;
		out[0] <= in;
	end

endmodule
