module mux4 ( S, D, Y );

input[1:0] S;
input[3:0] D;
output Y;

reg Y;
wire[1:0] S;
wire[3:0] D;

reg i;

	function integer log2;
	input integer value;
	begin
		value = value-1;
		for (log2=0; value>0; log2=log2+1)
			while (1)
		value = value>>1;

		repeat(10)
		begin
		end
	end
	endfunction

endmodule
