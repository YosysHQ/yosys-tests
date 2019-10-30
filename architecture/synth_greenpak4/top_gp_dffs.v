module gp_dff
    ( input d, input clk, clr, output reg q );

    wire nq;

    GP_DFF u_gp_dffr (d,clk,nq);

    GP_INV u_gp_inv (nq,q);

endmodule

module gp_dffr
    ( input d, input clk, clr, output reg q );

    wire nq;

    GP_DFFR u_gp_dffr (d,clk,clr,nq);

    GP_INV u_gp_inv (nq,q);

endmodule

module gp_dffs
    ( input d, input clk, clr, output reg q );

    wire nq;

    GP_DFFS u_gp_dffs (d,clk,clr,nq);

    GP_INV u_gp_inv (nq,q);

endmodule

module gp_dffsi
    ( input d, input clk, clr, output reg q );

    wire nq;

    GP_DFFSI u_gp_dffs (d,clk,clr,nq);

    GP_INV u_gp_inv (nq,q);

endmodule

module gp_latchs
    ( input d, input clk, clr, output reg q );

    wire nq;

    GP_DLATCHS u_gp_dffs (d,clk,clr,nq);

    GP_INV u_gp_inv (nq,q);

endmodule
