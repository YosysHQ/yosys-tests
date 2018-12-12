module tristate (en, i, io, o);
    input en;
    input i;
    inout [1:0] io;    
    output [1:0] o;

    always @(en or i)
		io[0] <= (en)? i : 1'bZ;
		
    always @(en or i)
		io[1] <= (i)? en : 1'bZ;
		
    assign o = (en)? io : 2'bZZ;
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
        .io (b ),
        .o (c )
    );

endmodule
