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


module pass_01 (
        input clock, reset,
        output reg [31:0] dout
);
        parameter p = 1;
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
        generate if (p)
                initial begin
                        assume (dout);
                end
        endgenerate
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule


module pass_02 (
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
        generate for (genvar i = 0; i < 1; i++)
                initial begin
                        assume (dout);
                end
        endgenerate
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule


module pass_03 (
        input clock, reset,
        output reg [31:0] dout
);
        parameter p = 1;
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
        generate case(p)
        default:
                initial begin
                        assume (dout);
                end
        endcase
        endgenerate
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule


module fail_00 (
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
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule


module fail_01 (
        input clock, reset,
        output reg [31:0] dout
);
        parameter p = 1;
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
        generate
        if (p)
                ;
        else
                initial begin
                        assume (dout);
                end
        endgenerate
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule


module fail_03 (
        input clock, reset,
        output reg [31:0] dout
);
        parameter p = 1;
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
        generate case(p)
        1:        ;
        default:
                initial begin
                        assume (dout);
                end
        endcase
        endgenerate
        always @(posedge clock) begin
                assert (dout);
        end
`endif
endmodule
