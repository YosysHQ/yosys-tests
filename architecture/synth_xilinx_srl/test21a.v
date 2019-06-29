module test21a #(parameter width=130, depth=4) (input clk, input [width-1:0] i, output q);
    genvar d;
    wire [depth:0] int;
    assign int[0] = ^i[width-1:0];
    generate 
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[d]), .E(1'b1), .Q(int[d+1]));
        end
    endgenerate 
    assign q = int[depth];
endmodule
