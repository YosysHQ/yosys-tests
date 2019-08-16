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


    reg [5:0] dinA = 0;
    wire [3:0] doutB,doutB1,doutB2,doutB3,doutB4;
	reg [3:0] dff,ndff,adff,adffn,dffe = 0;

    top uut (
        .clk (clk ),
        .a (dinA[3:0]),
        .pre (dinA[4] ),
        .clr (dinA[5] ),
        .b (doutB ),
        .b1 (doutB1 ),
        .b2 (doutB2 ),
        .b3 (doutB3 ),
        .b4 (doutB4 )
    );

    always @(posedge clk) begin
    #3;
    dinA <= dinA + 1;
    end

	always @( posedge clk, negedge dinA[4], posedge dinA[5] )
		if ( dinA[5] )
			dff <= 4'b0000;
		else if ( !dinA[4] )
			dff <= 4'b1111;
		else
            dff <= dinA[3:0];

    always @( negedge clk, posedge dinA[4], negedge dinA[5] )
		if ( !dinA[5] )
			ndff <= 4'b0000;
		else if ( dinA[4] )
			ndff <= 4'b1111;
		else
            ndff <= dinA[3:0];

    always @( posedge clk, posedge dinA[5] )
		if ( dinA[5] )
			adff <= 4'b0000;
		else
            adff <= dinA[3:0];

    always @( posedge clk, negedge dinA[5] )
		if ( !dinA[5] )
			adffn <= 4'b0000;
		else
            adffn <= dinA[3:0];

    always @( posedge clk )
		if ( dinA[5] )
            dffe <= dinA[3:0];

	check_dff dff_test(.clk(clk), .test(doutB), .pat(dff));
    check_dff ndff_test(.clk(clk), .test(doutB1), .pat(ndff));
    check_dff adff_test(.clk(clk), .test(doutB2), .pat(adff));
    check_dff adffn_test(.clk(clk), .test(doutB3), .pat(adffn));
    check_dff dffe_test(.clk(clk), .test(doutB4), .pat(dffe));

endmodule

module check_dff(input clk, input [3:0] test, input [3:0] pat);
    always @(posedge clk)
    begin
        #1;
        if (test !== pat)
        begin
            $display("ERROR: ASSERTION FAILED in %m:",$time," ",test," ",pat);
            $stop;
        end
    end
endmodule
