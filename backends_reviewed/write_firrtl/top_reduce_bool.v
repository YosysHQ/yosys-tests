module top(input clk,
		 input 	       rst,
		 input [31:0]  in_count,
		 input 	       in_valid,
		 output        in_ready,

		 input 	       out_ready,
		 output        out_valid);

   reg [31:0] 		       r_remaining_count;
   reg 			       r_valid;
   reg 			       r_ready;

   assign out_valid = r_valid;
   assign in_ready = r_ready;

   always @(posedge clk) begin
      if (rst) begin
	 r_remaining_count <= 0;
	 r_valid <= 0;
	 r_ready <= 0;
      end else begin
	 if (r_remaining_count == 0) begin
	    if (r_ready && in_valid) begin
	       r_remaining_count <= in_count;
	       r_valid <= in_count != 0;
	       r_ready <= 0;
	    end else begin
	       r_ready <= 1;
	       r_valid <= 0;
	    end
	 end else begin
	    r_valid <= !(r_remaining_count == 1 && out_ready && out_valid);
	    r_ready <= 0;

	    if (out_valid && out_ready) begin
	       r_remaining_count <= r_remaining_count - 1;
	    end
	 end
      end
   end

endmodule
