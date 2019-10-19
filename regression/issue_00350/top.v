module test
  ( input clk
  , input in
  , output out
  );

reg [1:0] state = 0;

always @(posedge clk)
  case (state)
    0:
      if (!in || in)
        state <= 1;
      else
        state <= state;

    1:
      if (in)
        state <= 1;
      else
        if (!in)
          state <= 1;
        else
          state <= state;
  endcase

always @(*)
  case (state)
    0:
      out = 0;

    1:
      begin
         if (in)
           out = 1;

         if (!in)
           out = 0;
      end
  endcase

endmodule
