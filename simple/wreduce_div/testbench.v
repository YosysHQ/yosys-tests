module testbench;
    reg [2:0] in;

	wire patt_out,out;
	wire patt_carry_out,carryout;

    initial begin
         $dumpfile("testbench.vcd");
         $dumpvars(0, testbench);

        #5 in = 0;
        repeat (10000) begin
            #5 in = in + 1;
        end

        $display("OKAY");
    end

    top uut (
	.x(in[0]),
	.y(in[1]),
	.cin(in[2]),
	.A(out),
	.cout(carryout)
	);

	assert_X out_test(.clk(in[0]), .A(out));
	assert_X carry_test(.clk(in[0]), .A(carryout));

endmodule

