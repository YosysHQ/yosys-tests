`include "../top.v"
`resetall

`define NBUG
`timescale 10ns/1ns
module mux ( S, D, Y );

input[2:0] S;
input[7:0] D;
output Y;

reg Y;
wire[2:0] S;
wire[7:0] D;

always @*
begin
   case( S )
       0 : Y = D[0];
       1 : Y = D[1];
       2 : Y = D[2];
       3 : Y = D[3];
`ifndef BUG
       4 : Y = D[4];
`else
       4 : Y = D[7];
`endif
       5 : Y = D[5];
       6 : Y = D[6];
       7 : Y = D[7];
   endcase
`ifdef NBUG
`elsif BUG
`endif
end

endmodule

`undef NBUG
