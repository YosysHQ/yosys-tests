// Check inference even when not in vector
module test17a (input clk, input i, input e, output q);
generate 
   reg a1, a2, a3, a4, a5, a6, a7, a8;
   always @(posedge clk) if (e) {a8,a7,a6,a5,a4,a3,a2,a1} <= {a7,a6,a5,a4,a3,a2,a1,i};
   assign q = a8;
endgenerate
endmodule
