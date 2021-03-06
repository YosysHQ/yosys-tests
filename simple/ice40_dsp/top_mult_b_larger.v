module MACC (P, A, B, CARRYIN, CLK, RST);

  output reg [47:0] P;
  input [15:0] A;
  input [17:0] B;
  input CARRYIN;
  input CLK;
  input RST;

  reg [47:0] mult_reg;

  always @(posedge CLK)
    begin
    if(!RST)
        mult_reg <= 'b0;
    else
        mult_reg <= A * B;
    end

    always@(posedge CLK)
    begin
    if(!RST)
        P <= 'b0;
    else
        P <= mult_reg + CARRYIN;
    end

endmodule


module top (
input clk,
input rst,
input [15:0] a,
input [17:0] b,
input carryin,
output [47:0] p
);

MACC u_MACC (
        .P (p),
        .A (a),
        .B (b ),
        .CARRYIN (carryin ),
        .CLK (clk),
        .RST (rst)
    );

endmodule

