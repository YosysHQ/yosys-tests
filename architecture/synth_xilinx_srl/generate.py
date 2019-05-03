#!/usr/bin/python3

N = 131

# Test 1: pos_clk_no_enable_no_init_not_inferred
for i in range(1,N+1):
    with open('test1_%d.v' % i, 'w') as fp:
        fp.write('''
module test1_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[w][d]), .E(1'b1), .Q(int[w][d+1]));
        end
        assign q[w] = int[w][depth];
    end
endgenerate
endmodule
'''.format(i))

# Test 2: pos_clk_with_enable_no_init_not_inferred
for i in range(1,N+1):
    with open('test2_%d.v' % i, 'w') as fp:
        fp.write('''
module test2_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input e, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[w][d]), .E(e), .Q(int[w][d+1]));
        end
        assign q[w] = int[w][depth];
    end
endgenerate
endmodule
'''.format(i))

# Test 3: pos_clk_with_enable_with_init_inferred
for i in range(1,N+1):
    with open('test3_%d.v' % i, 'w') as fp:
        fp.write('''
module test3_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input e, output [width-1:0] q);
generate 
    reg [depth-1:0] int [width-1:0];

    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        for (d = 0; d < depth; d=d+1)
            initial int[w][d] <= ~((d+w) % 2);

        if (depth == 1) begin
            always @(posedge clk) if (e) int[w] <= i[w];
            assign q[w] = int[w];
        end
        else begin
            always @(posedge clk) if (e) int[w] <= {{ int[w][depth-2:0], i[w] }};
            assign q[w] = int[w][depth-1];
        end
    end
endgenerate
endmodule
'''.format(i))

# Test 4: neg_clk_no_enable_no_init_not_inferred
for i in range(1,N+1):
    with open('test4_%d.v' % i, 'w') as fp:
        fp.write('''
module test4_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_NP_ r(.C(clk), .D(int[w][d]), .E(1'b1), .Q(int[w][d+1]));
        end
        assign q[w] = int[w][depth];
    end
endgenerate
endmodule
'''.format(i))

# Test 5: neg_clk_no_enable_no_init_inferred
for i in range(1,N+1):
    with open('test5_%d.v' % i, 'w') as fp:
        fp.write('''
module test5_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, output [width-1:0] q);
generate 
    reg [depth-1:0] int [width-1:0];

    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        if (depth == 1) begin
            always @(negedge clk) int[w] <= i[w];
            assign q[w] = int[w];
        end
        else begin
            always @(negedge clk) int[w] <= {{ int[w][depth-2:0], i[w] }};
            assign q[w] = int[w][depth-1];
        end
    end
endgenerate
endmodule
'''.format(i))

# Test 6: neg_clk_with_enable_with_init_inferred
for i in range(1,N+1):
    with open('test6_%d.v' % i, 'w') as fp:
        fp.write('''
module test6_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input e, output [width-1:0] q);
generate 
    reg [depth-1:0] int [width-1:0];

    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        for (d = 0; d < depth; d=d+1)
            initial int[w][d] <= ~((d+w) % 2);

        if (depth == 1) begin
            always @(negedge clk) if (e) int[w] <= i[w];
            assign q[w] = int[w];
        end
        else begin
            always @(negedge clk) if (e) int[w] <= {{ int[w][depth-2:0], i[w] }};
            assign q[w] = int[w][depth-1];
        end
    end
endgenerate
endmodule
'''.format(i))

# Test 10: pos_clk_no_enable_no_init_not_inferred_var_len
for i in range(1,N+1):
    with open('test10_%d.v' % i, 'w') as fp:
        fp.write('''
module test10_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input [31:0] l, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[w][d]), .E(1'b1), .Q(int[w][d+1]));
        end
        wire [depth-1:0] t;
        assign t = int[w][depth:1];
        assign q[w] = t[l];
    end
endgenerate
endmodule
'''.format(i))

# Test 11: neg_clk_with_enable_with_init_inferred_var_len
for i in range(1,N+1):
    with open('test11_%d.v' % i, 'w') as fp:
        fp.write('''
module test11_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input e, input [31:0] l, output [width-1:0] q);
generate 
    reg [depth-1:0] int [width-1:0];

    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        for (d = 0; d < depth; d=d+1)
            initial int[w][d] <= ~((d+w) % 2);

        if (depth == 1) begin
            always @(negedge clk) if (e) int[w] <= i[w];
            assign q[w] = int[w];
        end
        else begin
            always @(negedge clk) if (e) int[w] <= {{ int[w][depth-2:0], i[w] }};
            assign q[w] = int[w][l];
        end
    end
endgenerate
endmodule
'''.format(i))

# Test 15: pos_clk_no_enable_no_init_not_inferred
for i in range(128+1,128+N+1):
    with open('test15_%d.v' % i, 'w') as fp:
        fp.write('''
module test15_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, output [width-1:0] q);
generate 
    wire [depth:0] int [width-1:0];
    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        assign int[w][0] = i[w];
        for (d = 0; d < depth; d=d+1) begin
            \$_DFFE_PP_ r(.C(clk), .D(int[w][d]), .E(1'b1), .Q(int[w][d+1]));
        end
        assign q[w] = int[w][depth];
    end
endgenerate
endmodule
'''.format(i))

# Test 16: neg_clk_with_enable_with_init_inferred_var_len
for i in range(128+1,128+N+1):
    with open('test16_%d.v' % i, 'w') as fp:
        fp.write('''
module test16_{0} #(parameter width=1, depth={0}) (input clk, input [width-1:0] i, input e, input [31:0] l, output [width-1:0] q);
generate 
    reg [depth-1:0] int [width-1:0];

    genvar w, d;
    for (w = 0; w < width; w=w+1) begin
        for (d = 0; d < depth; d=d+1)
            initial int[w][d] <= ~((d+w) % 2);

        if (depth == 1) begin
            always @(negedge clk) if (e) int[w] <= i[w];
            assign q[w] = int[w];
        end
        else begin
            always @(negedge clk) if (e) int[w] <= {{ int[w][depth-2:0], i[w] }};
            assign q[w] = int[w][l];
        end
    end
endgenerate
endmodule
'''.format(i))

