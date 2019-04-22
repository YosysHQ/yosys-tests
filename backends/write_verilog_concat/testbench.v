module testbench;
    reg [4:0] in;

	wire [1:0] Ap = 0;
	wire [2:0] Bp = 0;
	wire [2:0] Cp = 0;
	wire [1:0] A = 0;
	wire [2:0] B = 0;
	wire [2:0] C = 0;

    initial begin
        // $dumpfile("testbench.vcd");
        // $dumpvars(0, testbench);

        #5 in = 0;
        repeat (10000) begin
            #5 in = in + 1;
        end

        $display("OKAY");
    end

    top uut (
	.x(in[0]),
	.y(in[2:1]),
	.z(in[3]),
	.A(A),
	.B(B),
	.C(C)
	);

	assign Ap =  {in[0],in[3]};
	assign Bp = {in[0],in[2:1]};
	assign Cp =  {in[0],in[2:1],in[3]};

	assert_comb A_test(.A(A[0]), .B(Ap[0]));
	assert_comb B_test(.A(B[0]), .B(Bp[0]));
	assert_comb C_test(.A(C[0]), .B(Cp[0]));

endmodule
