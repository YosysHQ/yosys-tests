module testbench;
    reg [0:7] in;

	wire pB1,pB2,pB3,pB4,pB5,pB6,pB7,pB8,pB9,pB10;
	wire B1,B2,B3,B4,B5,B6,B7,B8,B9,B10;

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
	.in(in),
	.B1(B1),
	.B2(B2),
	.B3(B3),
	.B4(B4),
	.B5(B5),
	.B6(B6),
	.B7(B7),
	.B8(B8),
	.B9(B9),
	.B10(B10)
	);


   assign     pB1 =  in[0] & in[1];
   assign     pB2 =  in[0] | in[1];
   assign     pB3 =  in[0] ~& in[1];
   assign     pB4 =  in[0] ~| in[1];
   assign     pB5 =  in[0] ^ in[1];
   assign     pB6 =  in[0] ~^ in[1];
   assign     pB7 =  ~in[0];
   assign     pB8 =  in[0];
   assign     pB9 =  in[0:1] && in [2:3];
   assign     pB10 =  in[0:1] || in [2:3];

	assert_comb out1_test(.A(pB1), .B(B1));
	assert_comb out2_test(.A(pB2), .B(B2));
	assert_comb out3_test(.A(pB3), .B(B3));
	assert_comb out4_test(.A(pB4), .B(B4));
	assert_comb out5_test(.A(pB5), .B(B5));
	assert_comb out6_test(.A(pB6), .B(B6));
	assert_comb out7_test(.A(pB7), .B(B7));
	assert_comb out8_test(.A(pB8), .B(B8));
	assert_comb out9_test(.A(pB9), .B(B9));
	assert_comb out10_test(.A(pB10), .B(B10));

endmodule
