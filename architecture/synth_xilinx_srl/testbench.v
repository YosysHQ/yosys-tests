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
    wire [`N-1:0] y;
    wire [`N-1:0] z;

    top rtl (
        .clk (clk ),
        .a (a),
        .e (e),
        .z (y)
    );

    synth uut (
        .clk (clk ),
        .a (a),
        .e (e),
        .z (z)
    );

    always @(negedge clk)
        e <= $random;

    generate
        genvar i;
        // FIXME: https://github.com/YosysHQ/yosys/issues/873
        //for (i = 0; i < `N; i=i+1) begin
        for (i = 1; i < `N; i=i+1) begin
            always @(posedge clk)
                a[i] <= $random;
            assert_dff zp_test(.clk(clk), .test(z[i]), .pat(y[i]));
            assert_dff zn_test(.clk(~clk), .test(z[i]), .pat(y[i]));
        end
    endgenerate

endmodule
