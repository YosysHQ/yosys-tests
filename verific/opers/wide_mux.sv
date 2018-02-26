module top (input [1:0] s, input [7:0] a, b, c, d, output reg [7:0] y);
  always @* begin
    case (s)
      0: y = a;
      1: y = b;
      2: y = c;
      3: y = d;
    endcase
  end
endmodule
