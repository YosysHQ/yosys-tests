module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

	reg b,c = 1.01;
	wire a;

endmodule

module concatenation_operator();
  reg [3:0]  r_VAL_1 = 4'b0111;
  reg [3:0]  r_VAL_2 = 4'b1100;
  wire [7:0] w_CAT;

  reg  [3:0]       r_UNSIGNED = 4'b0010;
  reg signed [3:0] r_SIGNED   = 4'b1110;
  wire [7:0]       w_CAT_2;
  wire [15:0]      w_CAT_3;

  reg              r_CLOCK = 1'b0;
  reg [7:0]        r_SHIFT_REG = 8'h01;

  // Demonstrates a common concatenation.
  assign w_CAT = {r_VAL_1, r_VAL_2};

  // Demonstrates concatenation of different types
  assign w_CAT_2 = {r_SIGNED, r_UNSIGNED};

  // Demonstrates Verilog padding upper bits with 0.
  assign w_CAT_3 = {r_VAL_1, r_VAL_2};

  // Generate a clock to drive shift register below
  always #1 r_CLOCK = !r_CLOCK;

  // Demonstrate Shifting of a 1 through an 8 bit register.
  always @(posedge r_CLOCK)
    begin
      r_SHIFT_REG[7:0] <= {r_SHIFT_REG[6:0], r_SHIFT_REG[7]};
    end

endmodule // concatenation_operator

module replication_operator();
  reg [3:0]  r_VAL_1 = 4'b0111;

  parameter c_MULTIPLIER = 4'b0010;

  parameter WIDTH = 1;
wire [WIDTH-1:0] connection;

generate
  if (WIDTH > 1) begin
    assign connection = { {WIDTH-1{1'b0}}, 1'b1 };
  end
  else begin
    assign connection = 1'b1 ;
  end
endgenerate


endmodule // replication_operator

module Shift (A, Y1, Y2);



                 input [7:0] A;

                 output [7:0] Y1, Y2;

                 parameter B=3; reg [7:0] Y1, Y2;



                 always @(A)

                 begin

                                  Y1=A<<B; //logical shift left

                                  Y2=A>>B; //logical shift right

                 end

endmodule

module SShift (A, Y1, Y2);



                 input [7:0] A;

                 output [7:0] Y1, Y2;

                 parameter B=3; reg [7:0] Y1, Y2;



                 always @(A)

                 begin

                                  Y1=A<<<B; //logical shift left

                                  Y2=A>>>B; //logical shift right

                 end

endmodule
