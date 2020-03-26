module top(input clk, enable, output reg y);

wire [1:0] foo [1:0];
integer i;

always @(posedge clk)
    if (enable)
        for (i = 0; i < 2; i=i+1)
            y <= foo[0][0];

endmodule
