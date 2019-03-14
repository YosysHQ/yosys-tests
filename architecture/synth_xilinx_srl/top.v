`include "defines.vh"

module template(input clk, input a, input e, output z);
parameter inferred = 0;
parameter init = 0;
parameter neg_clk = 0;
parameter len = 1;
generate 
    if (inferred == 0) begin
        wire [len:0] int;
        assign int[0] = a;
        genvar i;
        for (i = 0; i < len; i=i+1) begin
            if (neg_clk)
                \$_DFFE_NP_ r(.C(clk), .D(int[i]), .E(e), .Q(int[i+1]));
            else
                \$_DFFE_PP_ r(.C(clk), .D(int[i]), .E(e), .Q(int[i+1]));
        end
        assign z = int[len];
    end
    else begin
        reg [len-1:0] int;

        if (init) begin
            genvar i;
            for (i = 0; i < len; i=i+1)
                initial int[i] = ~(i % 2);
        end

        if (len == 1) begin
            if (neg_clk) begin
                always @(negedge clk) if (e) int <= a;
            end
            else begin
                always @(posedge clk) if (e) int <= a;
            end
            assign z = int;
        end
        else begin
            if (neg_clk) begin
                always @(negedge clk) if (e) int <= { int[len-2:0], a };
            end
            else begin
                always @(posedge clk) if (e) int <= { int[len-2:0], a };
            end
            assign z = int[len-1];
        end
    end
endgenerate
endmodule

module top(input clk, input [`N-1:0] a, input e, output [`N-1:0] z1, z2, z3, z4, z5, z6);
generate 
    genvar i;
    for (i = 0; i < `N; i=i+1) begin : pos_clk_no_enable_no_init_not_inferred
        template #(.len(i+1)) sr(clk, a[i], 1'b1, z1[i]);
    end
    for (i = 0; i < `N; i=i+1) begin : pos_clk_with_enable_no_init_not_inferred
        template #(.len(i+1)) sr(clk, a[i], e, z2[i]);
    end
    for (i = 0; i < `N; i=i+1) begin : pos_clk_with_enable_with_init_inferred
        template #(.len(i+1), .inferred(1), .init(1)) sr(clk, a[i], e, z3[i]);
    end
    for (i = 0; i < `N; i=i+1) begin : neg_clk_no_enable_no_init_not_inferred
        template #(.len(i+1), .neg_clk(1)) sr(clk, a[i], 1'b1, z4[i]);
    end
    for (i = 0; i < `N; i=i+1) begin : neg_clk_no_enable_no_init_inferred
        template #(.len(i+1), .neg_clk(1), .inferred(1)) sr(clk, a[i], 1'b1, z5[i]);
    end
    for (i = 0; i < `N; i=i+1) begin : neg_clk_with_enable_with_init_inferred
        template #(.len(i+1), .neg_clk(1), .inferred(1), .init(1)) sr(clk, a[i], e, z6[i]);
    end
endgenerate
endmodule
