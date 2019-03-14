`include "defines.vh"

module template(input clk, input a, input er, output z);
parameter inferred = 0;
parameter init = 0;
parameter neg_clk = 0;
parameter len = 1;
parameter er_is_reset = 0;
generate 
    if (inferred == 0) begin
        wire [len:0] int;
        assign int[0] = a;
        genvar i;
        for (i = 0; i < len; i=i+1) begin
            if (neg_clk)
                if (!er_is_reset)
                    \$_DFFE_NP_ r(.C(clk), .D(int[i]), .E(er), .Q(int[i+1]));
                else
                    \$_DFF_NP0_ r(.C(clk), .D(int[i]), .R(er), .Q(int[i+1]));
            else
                if (!er_is_reset)
                    \$_DFFE_PP_ r(.C(clk), .D(int[i]), .E(er), .Q(int[i+1]));
                else
                    \$_DFF_PP0_ r(.C(clk), .D(int[i]), .R(er), .Q(int[i+1]));
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
                if (!er_is_reset) begin
                    always @(negedge clk) if (er) int <= a;
                end
                else begin
                    always @(negedge clk or posedge er) if (er) int <= 1'b0; else int <= a;
                end
            end
            else begin
                if (!er_is_reset) begin
                    always @(posedge clk) if (er) int <= a;
                end
                else begin
                    always @(posedge clk or posedge er) if (er) int <= 1'b0; else int <= a;
                end
            end
            assign z = int;
        end
        else begin
            if (neg_clk) begin
                if (!er_is_reset) begin
                    always @(negedge clk) if (er) int <= { int[len-2:0], a };
                end
                else begin
                    always @(negedge clk or posedge er) if (er) int <= 'b0; else int <= { int[len-2:0], a };
                end
            end
            else begin
                if (!er_is_reset) begin
                    always @(posedge clk) if (er) int <= { int[len-2:0], a };
                end
                else begin
                    always @(posedge clk or posedge er) if (er) int <= 'b0; else int <= { int[len-2:0], a };
                end
            end
            assign z = int[len-1];
        end
    end
endgenerate
endmodule

module top(input clk, input [`N-1:0] a, input e, r, output [`N-1:0] z1, z2, z3, z4, z5, z6, z7, z8);
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

    // Check that use of resets block shreg
    (* keep *)
    template #(.len(`N), .er_is_reset(1)) pos_clk_no_enable_no_init_not_inferred_with_reset(clk, a[`N-1], r, z7[`N-1]);
    (* keep *)
    template #(.len(`N), .neg_clk(1), .inferred(1), .init(1), .er_is_reset(1)) neg_clk_no_enable_with_init_with_inferred_with_reset(clk, a[`N-1], r, z8[`N-1]);
endgenerate
endmodule
