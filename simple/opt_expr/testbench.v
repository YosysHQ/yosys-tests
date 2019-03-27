module testbench;
    reg clk;

    initial begin
        // $dumpfile("testbench.vcd");
        // $dumpvars(0, testbench);

        #5 clk = 0;
        repeat (10000) begin
            #5 clk = 1;
            #5 clk = 0;
        end

        $display("OKAY");
    end


    reg dinA = 0;
    wire doutB;

    top uut (
        .clk (clk ),
        .clr (1'b0 ),
        .pre (1'b0 ),
        .a (dinA ),
        .b (doutB )
    );

    always @(negedge clk) begin
    #3;
    dinA <= !dinA;
    end

	assert_dff ff_test(.clk(clk), .test(doutB), .pat(1'b1));

endmodule
