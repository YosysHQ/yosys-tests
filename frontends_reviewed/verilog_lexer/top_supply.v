module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

wire y,a,b;

buf (supply1) g1 (y, a);
buf (supply0) g2 (y, b);


endmodule
