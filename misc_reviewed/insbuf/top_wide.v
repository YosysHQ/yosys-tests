module top    (
out,
in
);
    output [7:0] out;
    input [7:0] in;

    wire [7:0] o;

	assign o  = in;

	assign out = o;

endmodule
