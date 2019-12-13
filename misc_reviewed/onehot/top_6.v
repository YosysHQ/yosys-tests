module lshift (DI, SEL, SO);
input  [7:0] DI;
input  [1:0] SEL;
output [7:0] SO;
reg[7:0] SO;

  always @(DI or SEL)
  begin
    case (SEL)
      2'b00   : SO <= DI;
      2'b01   : SO <= DI << 1;
      2'b10   : SO <= DI << 3;
      default : SO <= DI << 2;
    endcase
  end
endmodule
