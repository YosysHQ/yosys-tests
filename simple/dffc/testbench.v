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
   
    
    reg dinA;
    reg dinC;
    wire dinB;

    top uut (
        .clk (clk ),
        .a (dinA ),
        .c (dinC),
        .b (dinB )
    );
    
    initial begin
        dinC <= 1;
        #5
        dinC <= 0;
        #10
        dinC <= 1;
        #10
        dinC <= 0;
    end
    
    initial begin
		dinA <= 0;
		
		repeat (20000) #3 dinA = !dinA;
	end
	
	assert ff_test(.clk(clk), .test(dinB));
    
endmodule


module assert(input clk, input test);
    always @(posedge clk)
    begin
        if (test == 0)
        begin
            $display("ASSERTION FAILED in %m:",$time);
            //$finish;
        end
    end
endmodule
