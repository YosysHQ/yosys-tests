module test(input [1:0] addr, output [7:0] o);
	reg [7:0] rom [0:3];
	initial begin
		rom[0] <= 8'b 0100100x;
		rom[1] <= 8'b 00100x01;
		rom[2] <= 8'b 010x0010;
		rom[3] <= 8'b 0x010100;
	end
	assign o = rom[addr];
endmodule
