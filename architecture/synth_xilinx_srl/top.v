module template(input clk, input a, input e, output z);
parameter icell = 1;
parameter init = 0;
parameter neg_clk = 0;
parameter len = 0;
generate 
    if (icell == 1) begin
        wire [len:0] int;
        assign int[0] = a;
        genvar i;
        for (i = 0; i < len; i++) begin
            if (neg_clk) begin
                $_DFFE_NP_ r(.C(clk), .D(int[i]), .E(e), .Q(int[i+1]));
                if (init) initial r.Q = ~(i % 2);
            end
            else begin
                $_DFFE_PP_ r(.C(clk), .D(int[i]), .E(e), .Q(int[i+1]));
                if (init) initial r.Q = ~(i % 2);
            end
        end
        assign z = int[len];
    end
    else begin
    end
endgenerate
endmodule

`define N 131
module top(input clk, input [`N-1:0] a, output [`N-1:0] z1, z2, z3, z4);
generate 
    genvar i;
    for (i = 0; i < `N; i++) begin : pos_clk_no_enable_no_init_icell
        template #(.len(i+1)) sr(clk, a[i], 1'b1, z1[i]);
    end
    for (i = 0; i < `N; i++) begin : pos_clk_no_enable_with_init_icell
        template #(.len(i+1), .init(1)) sr(clk, a[i], 1'b1, z2[i]);
    end
    for (i = 0; i < `N; i++) begin : neg_clk_no_enable_no_init_icell
        template #(.len(i+1), .neg_clk(1)) sr(clk, a[i], 1'b1, z3[i]);
    end
    for (i = 0; i < `N; i++) begin : neg_clk_no_enable_with_init_icell
        template #(.len(i+1), .neg_clk(1), .init(1)) sr(clk, a[i], 1'b1, z4[i]);
    end
endgenerate
endmodule
