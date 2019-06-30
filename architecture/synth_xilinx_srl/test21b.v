module test21b #(parameter width=130, depth=4) (input clk, input [width-1:0] i, input e, output q);
    reg [depth-1:0] int;

    genvar d;
    for (d = 0; d < depth; d=d+1)
        initial int[d] <= ~(d % 2);

    if (depth == 1) begin
        always @(negedge clk) if (e) int <= ~^i[width-1:0];
        assign q = int;
    end
    else begin
        always @(negedge clk) if (e) int <= { int[depth-2:0], ~^i[width-1:0] };
        assign q = int[depth-1];
    end
endmodule
