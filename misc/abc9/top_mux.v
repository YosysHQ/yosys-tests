module top (
input [7:0] S,
input [255:0] D,
output M256
);
parameter i = 3;

assign M256 = D[S];

endmodule
