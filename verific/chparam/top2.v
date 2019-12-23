module top;
parameter ABCD = 0;
genvar i;
generate for (i = 1; i < 3; i++)
    foo #(.EDFG(i*2)) f();
endgenerate
endmodule

module foo #(parameter EDFG = 0);
bar #(EDFG+1) b[1:0] ();
endmodule

module bar;
parameter HIJK = 0;
wire w;
endmodule

package pack;
parameter ABCD = 0;
endpackage

module other_top;
endmodule

package other_pack;
endpackage
