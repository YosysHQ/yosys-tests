module mux16 (D, S, Y);
 	input  [15:0] D;
 	input  [3:0] S;
 	output Y;

parameter D_WIDTH = 8;
parameter S_WIDTH = 3;

localparam L = 6;

assign Y = D[S];

endmodule




module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

mux16 u_mux16 (
        .S (S[3:0]),
        .D (D[15:0]),
        .Y (M16)
    );

defparam u_mux16.D_WIDTH = 16;
defparam u_mux16.S_DEPTH = 4;

endmodule
