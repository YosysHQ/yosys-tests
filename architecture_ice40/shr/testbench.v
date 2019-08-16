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


    reg in = 0;
    wire [7:0] f;
    reg [7:0] pf = 0;


    top uut ( .clk(clk),
              .in(in),
              .out(f));

    always @(posedge clk) begin
    #3
    in <= ~in;
    end

    always @(posedge clk)
	begin
		pf    <= pf >> 1;
		pf[7] <= in;
	end



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
