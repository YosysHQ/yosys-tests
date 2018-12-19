module tristate (en, i, io, o);
    input en;
    input i;
    inout [1:0] io;    
    output [1:0] o;
`ifndef BUG 
    always @(en or i)
		io[0] <= (en)? i : 1'bZ;
		
    always @(en or i)
		io[1] <= (i)? en : 1'bZ;
		
    assign o = (en)? io : 2'bZZ;
`else
	always @(en or i)
		io[0] <= (en)? ~i : 1'bZ;
		
    always @(en or i)
		io[1] <= (i)? ~en : 1'bZ;
		
    assign o = (en)? ~io : 2'bZZ;
`endif
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
