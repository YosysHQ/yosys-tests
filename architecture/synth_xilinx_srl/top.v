module template(input clk, input a, output z);
parameter icell = 1;
parameter len = 0;
generate 
    if (icell == 1) begin
        wire [len:0] int;
        assign int[0] = a;
        genvar i;
        for (i = 0; i < len; i++)
            \$_DFF_P_ r( .C(clk), .D(int[i]), .Q(int[i+1]));
        assign z = int[len];
    end
    else begin
    end
endgenerate
endmodule

`define N 131
module top(input clk, input [`N-1:0] a, output [`N-1:0] z);
generate 
genvar i;
for (i = 0; i < `N; i++)
    template #(.len(i+1)) sr(clk, a[i], z[i]);
endgenerate
endmodule
