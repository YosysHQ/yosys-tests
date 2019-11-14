module tristate (en, i, o);
    input en;
    input i;
    output [1:0] o;

    wire [1:0] io;

	assign 	io[0] = (en)? i : 1'bZ;

    assign 	io[1] = (i)? o[1] : 1'bZ;

    assign o = io;

endmodule


module top (
input en,
input a,
inout [1:0] b,
output [1:0] c
);

tristate u_tri (
        .en (en ),
        .i (a ),
        .o (c )
    );

endmodule
