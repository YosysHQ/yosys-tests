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
        rst <= 0;
        #5
        rst <= 1;
        #5
        a <= 1;
        b <= 0;
        #50
        a <= 0;
        b <= 0;
        #50
        a <= 0;
        b <= 1;
        #50
        a <= 1;
        b <= 1;
    end
    
endmodule
