#!/usr/bin/python3

# Test 1: pos_clk_no_enable_no_init_not_inferred
for i in range(131):
    with open('test1_%d.v' % i, 'w') as fp:
        fp.write('''
module test1_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input [31:0] s, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[w][d]), .E(1'b0), .Q(int[w][w+1]));
        end
        assign q[w] = int[w][depth];
    end
endgenerate
endmodule
'''.format(i+1))
