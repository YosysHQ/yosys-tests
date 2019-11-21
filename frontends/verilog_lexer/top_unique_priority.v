module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

wire a,c,d,e,g;
reg b,h,f;

always @(*)
begin
	unique case (a)
	0: b = c;
	1: b = d;
	endcase


	unique case (g)
	0: h = c;
	1: h = d;
	endcase

	priority case (e)
	0: f = c;
	1: f = d;
	endcase
end

endmodule
