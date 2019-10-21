module top(input clk,input in, output out);

        always @(posedge clk)
                out<=in;
endmodule
