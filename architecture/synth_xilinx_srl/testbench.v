`include "defines.vh"

module testbench;
    reg clk;

    initial begin
        // $dumpfile("testbench.vcd");
        // $dumpvars(0, testbench);

        #5 clk = 0;
        repeat (`N*3) begin
            #5 clk = 1;
            #5 clk = 0;
        end

        $display("OKAY");
    end

    reg [`N-1:0] a;
    reg e;
    wire [`N-1:0] y1, y2, y3, y4;
    wire [`N-1:0] z1, z2, z3, z4;

    top rtl (
        .clk (clk ),
        .a (a),
        .e (e),
        .z1 (y1),
        .z2 (y2),
        .z3 (y3),
        .z4 (y4)
    );

    synth uut (
        .clk (clk ),
        .a (a),
        .e (e),
        .z1 (z1),
        .z2 (z2),
        .z3 (z3),
        .z4 (z4)
    );

    always @(negedge clk)
        e <= $random;

    generate
        genvar i;
        for (i = 1; i < `N; i=i+1) begin
            always @(posedge clk)
                a[i] <= $random;
            assert_dff z1p_test(.clk(clk), .test(z1[i]), .pat(y1[i]));
            assert_dff z1n_test(.clk(~clk), .test(z1[i]), .pat(y1[i]));
            assert_dff z2p_test(.clk(clk), .test(z2[i]), .pat(y2[i]));
            assert_dff z2n_test(.clk(~clk), .test(z2[i]), .pat(y2[i]));
            assert_dff z3p_test(.clk(clk), .test(z3[i]), .pat(y3[i]));
            assert_dff z3n_test(.clk(~clk), .test(z3[i]), .pat(y3[i]));
            assert_dff z4p_test(.clk(clk), .test(z4[i]), .pat(y4[i]));
            assert_dff z4n_test(.clk(~clk), .test(z4[i]), .pat(y4[i]));
        end
    endgenerate

endmodule
