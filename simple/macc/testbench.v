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
    
endmodule
