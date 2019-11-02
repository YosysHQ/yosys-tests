// Single-Port Block RAM Read-First Mode
// rams_sp_rf.v
module top (clk, en, we, addr, di, dout);

input clk;
input we;
input en;
input [8:0] addr;
input [7:0] di;
output [7:0] dout;

reg [7:0] RAM [511:0];
reg [7:0] dout;

always @(posedge clk)
begin
  if (en)
    begin
      if (we)
        RAM[addr]<=di;
      dout <= RAM[addr];
    end
end

endmodule

