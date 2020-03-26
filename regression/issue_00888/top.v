module top (input clk, sel, di, output do);
        reg [0:1] data [0:0];
        always @(posedge clk)
                data[0] <= {di, data[0][0]};
        assign do = data[0][sel];
endmodule