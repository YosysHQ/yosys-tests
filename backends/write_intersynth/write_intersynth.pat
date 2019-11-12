node $procdff$7 $dff CLK x Q A D $add$../top.v:20$2_Y CLK_POLARITY '1 WIDTH 0x1
node $procdff$6 $dff CLK x Q cout D $add$../top.v:23$4_Y CLK_POLARITY '0 WIDTH 0x1
node $add$../top.v:23$4 $add Y $add$../top.v:23$4_Y B A A y Y_WIDTH 0x1 B_WIDTH 0x1 A_WIDTH 0x1 B_SIGNED 0x0 A_SIGNED 0x0
node $add$../top.v:20$2 $add Y $add$../top.v:20$2_Y B cin A y Y_WIDTH 0x1 B_WIDTH 0x1 A_WIDTH 0x1 B_SIGNED 0x0 A_SIGNED 0x0
# constant cells
node CONST_1_0x0 CONST_1 CONST CONST_1_0x0 VALUE 0x0
