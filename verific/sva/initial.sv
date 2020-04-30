module pass_00 (
        input clock, reset,
        output reg [31:0] dout
);
        reg [31:0] next_dout;
        always @* begin
                next_dout = dout ^ (dout << 13);
                next_dout = next_dout ^ (next_dout >> 17);
                next_dout = next_dout ^ (next_dout << 5);
        end
        always @(posedge clock, posedge reset) begin
                if (reset)
                        dout <= 1;
                else
                        dout <= next_dout;
        end
`ifdef FORMAL
        initial begin
                assume (dout);
        end
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule
