// Check inference even when keep attribute specified
module test17d (input clk, input i, input e, output q);
generate 
    reg a1, a2;
    (* keep *) reg a3;
    (* keep *) reg a4;
    reg a5, a6, a7, a8;
    always @(negedge clk) if (e) {a8,a7,a6,a5,a4,a3,a2,a1} <= {a7,a6,a5,a4,a3,a2,a1,i};
    assign q = a8;
endgenerate
endmodule
