`include "defines.vh"

module top(input clk, input [`N-1:0] a, input e, r, output [`N-1:0] z);
generate 
    genvar i;
`ifdef TEST1
    for (i = 0; i < `N; i=i+1) begin : pos_clk_no_enable_no_init_not_inferred
        template #(.depth(i+1)) sr(clk, a[i], 1'b1, z[i]);
    end
`elsif TEST2
    for (i = 0; i < `N; i=i+1) begin : pos_clk_with_enable_no_init_not_inferred
        template #(.depth(i+1)) sr(clk, a[i], e, z[i]);
    end
`elsif TEST3
    for (i = 0; i < `N; i=i+1) begin : pos_clk_with_enable_with_init_inferred
        template #(.depth(i+1), .inferred(1), .init(1)) sr(clk, a[i], e, z[i]);
    end
`elsif TEST4
    for (i = 0; i < `N; i=i+1) begin : neg_clk_no_enable_no_init_not_inferred
        template #(.depth(i+1), .neg_clk(1)) sr(clk, a[i], 1'b1, z[i]);
    end
`elsif TEST5
    for (i = 0; i < `N; i=i+1) begin : neg_clk_no_enable_no_init_inferred
        template #(.depth(i+1), .neg_clk(1), .inferred(1)) sr(clk, a[i], 1'b1, z[i]);
    end
`elsif TEST6
    for (i = 0; i < `N; i=i+1) begin : neg_clk_with_enable_with_init_inferred
        template #(.depth(i+1), .neg_clk(1), .inferred(1), .init(1)) sr(clk, a[i], e, z[i]);
    end
`elsif TEST7
    // Check that use of resets block shreg
    (* keep *)
    template #(.depth(`N), .er_is_reset(1)) pos_clk_no_enable_no_init_not_inferred_with_reset(clk, a[0], r, z[0]);
    (* keep *)
    template #(.depth(`N), .neg_clk(1), .inferred(1), .init(1), .er_is_reset(1)) neg_clk_no_enable_with_init_with_inferred_with_reset(clk, a[1], r, z[1]);
    assign z[`N-1:2] = 'b0; // Suppress no driver warning
`elsif TEST8
    // Check multi-bit works
    (* keep *)
    template #(.depth(`N), .width(`N)) pos_clk_no_enable_no_init_not_inferred_N_width(clk, a, r, z);
`elsif TEST9
    (* keep *)
    template #(.depth(`N), .width(`N), .neg_clk(1), .inferred(1), .init(1)) neg_clk_no_enable_with_init_with_inferred_N_width(clk, a, r, z);
`endif
endgenerate
endmodule

module template #(parameter width=1) (input clk, input [width-1:0] a, input er, output [width-1:0] z);
parameter inferred = 0;
parameter init = 0;
parameter neg_clk = 0;
parameter depth = 1;
parameter er_is_reset = 0;
generate 
    if (inferred == 0) begin
        wire [depth:0] int [width-1:0];

        genvar j;
        for (j = 0; j < width; j=j+1) begin
            assign int[j][0] = a[j];
            genvar i;
            for (i = 0; i < depth; i=i+1) begin
                if (neg_clk)
                    if (!er_is_reset)
                        \$_DFFE_NP_ r(.C(clk), .D(int[j][i]), .E(er), .Q(int[j][i+1]));
                    else
                        \$_DFF_NP0_ r(.C(clk), .D(int[j][i]), .R(er), .Q(int[j][i+1]));
                else
                    if (!er_is_reset)
                        \$_DFFE_PP_ r(.C(clk), .D(int[j][i]), .E(er), .Q(int[j][i+1]));
                    else
                        \$_DFF_PP0_ r(.C(clk), .D(int[j][i]), .R(er), .Q(int[j][i+1]));
            end
            assign z[j] = int[j][depth];
        end
    end
    else begin
        reg [depth-1:0] int [width-1:0];

        genvar j;
        for (j = 0; j < width; j=j+1) begin
            if (init) begin
                genvar i;
                for (i = 0; i < depth; i=i+1)
                    initial int[j][i] = ~((i+j) % 2);
            end

            if (depth == 1) begin
                if (neg_clk) begin
                    if (!er_is_reset) begin
                        always @(negedge clk) if (er) int[j] <= a[j];
                    end
                    else begin
                        always @(negedge clk or posedge er) if (er) int[j] <= 1'b0; else int[j] <= a[j];
                    end
                end
                else begin
                    if (!er_is_reset) begin
                        always @(posedge clk) if (er) int[j] <= a[j];
                    end
                    else begin
                        always @(posedge clk or posedge er) if (er) int[j] <= 1'b0; else int[j] <= a[j];
                    end
                end
                assign z[j] = int[j];
            end
            else begin
                if (neg_clk) begin
                    if (!er_is_reset) begin
                        always @(negedge clk) if (er) int[j] <= { int[j][depth-2:0], a[j] };
                    end
                    else begin
                        always @(negedge clk or posedge er) if (er) int[j] <= 'b0; else int[j] <= { int[j][depth-2:0], a[j] };
                    end
                end
                else begin
                    if (!er_is_reset) begin
                        always @(posedge clk) if (er) int[j] <= { int[j][depth-2:0], a[j] };
                    end
                    else begin
                        always @(posedge clk or posedge er) if (er) int[j] <= 'b0; else int[j] <= { int[j][depth-2:0], a[j] };
                    end
                end
                assign z[j] = int[j][depth-1];
            end
        end
    end
endgenerate
endmodule


