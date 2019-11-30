module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

specify
  specparam TRise = 10,
  TFall = 15;
  (S => M2) = (TRise, TFall) ;
endspecify

endmodule
