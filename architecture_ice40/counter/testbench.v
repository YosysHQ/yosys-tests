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


    reg rst;
    wire [7:0] f;
    reg [7:0] pf;


    top uut ( .clk(clk),
              .reset(rst),
              .out(f));

    initial begin
        rst <= 1;
        #5
        rst <= 0;
    end

    always @(posedge clk, posedge rst)
		if (rst) begin
			pf <= 8'b0 ;
		end else
			pf <= pf + 1;


	assert_expr f_test(.clk(clk), .A(f), .B(pf));

endmodule


module assert_expr(input clk, input [7:0] A, input [7:0] B);
    always @(posedge clk)
    begin
        //#1;
        if (A !== B)
        begin
            $display("ERROR: ASSERTION FAILED in %m:",$time," ",A," ",B);
            $stop;
        end
    end
endmodule
