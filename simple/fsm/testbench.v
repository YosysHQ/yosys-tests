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
   
    
    reg a;
    reg b;
    reg rst;
    wire g0;
    wire g1;
    
    top uut (
        .a (a),
        .b (b),
        .clk (clk),
        .rst (rst),
        .g0(g0),
        .g1(g1)
    );
    
    initial begin
        rst <= 1;
        #5
        rst <= 0;
    end
	
	initial begin
		a <= 0;
		repeat (20000) #3 a = !a;
	end
	
	initial begin
		b <= 0;
		repeat (20000) #4 b = !b;
	end
	
    assert g0_test(.clk(clk), .A(g0));
	assert g1_test(.clk(clk), .A(g1));
  
endmodule


module assert(input clk, input A);
    always @(posedge clk)
    begin
        //#1;
        if (A == 1'bZ)
        begin
            $display("ASSERTION FAILED in %m:",$time," ",A);
            //$finish;
        end
    end
endmodule
