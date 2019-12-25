module top (en, a, b);
    input en;
	input a;
	output reg b;

    (* keep = "true" *) wire  int_dat;

    always @(en or a)
		b <= (en)? a : 1'bZ;
endmodule
