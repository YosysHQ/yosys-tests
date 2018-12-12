module testbench;
    reg en;

    initial begin
        // $dumpfile("testbench.vcd");
        // $dumpvars(0, testbench);

        #5 en = 0;
        repeat (10000) begin
            #5 en = 1;
            #5 en = 0;
        end

        $display("OKAY");    
    end
   
    
    reg dinA;
    wire dinB;

    top uut (
        .en (en ),
        .a (dinA ),
        .b (dinB )
    );
    
    initial begin
		dinA <= 0;
		
		repeat (20000) #3 dinA = !dinA;
	end
	
	assert b_test(.en(en), .A(dinA), .B(dinB));
  
endmodule


module assert(input en, input A, input B);
    always @(posedge en)
    begin
        //#1;
        if (A !== B)
        begin
            $display("ASSERTION FAILED in %m:",$time," ",A," ",B);
            //$finish;
        end
    end
endmodule
