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
   
    
    reg [24:0] dinA;
    reg [17:0] dinB;
    reg carryin;
    reg rst;
	wire [47:0] p;

    top uut (
        .p (p),
        .a (dinA),
        .b (dinB),
        .carryin (carryin ),
        .clk (clk),
        .rst (rst)
    );
    
    initial begin
        rst <= 0;
        #5
        rst <= 1;
        #5
        dinA <= 38;
        dinB <= 22;
        carryin <= 1;
        #50
        dinA <= 0;
        dinB <= 0;
        carryin <= 0;
        #50
        dinA <= 33;
        dinB <= 12;
        carryin <= 0;
        #50
        dinA <= 0;
        dinB <= 0;
        carryin <= 0;
    end
	
	assert macc_test(.clk(clk), .A(dinA), .B(dinB), .C(carryin), .P(p));
  
endmodule


module assert(input clk, input [24:0] A, input [17:0] B, input C, input [47:0] P);
	reg [47:0] p;
	always @(posedge clk)
    begin
        //#1;
		@(posedge clk);
		@(posedge clk);		
		@(posedge clk);
		@(posedge clk);
		assign p = (A * B) + C; 
        if (P != p)
        begin
            $display("ASSERTION FAILED in %m:",$time," ",P," ",p);
            //$finish;
        end
    end
endmodule
