  cell $pmux $procmux$2
    parameter \S_WIDTH 8
    parameter \WIDTH 1
    connect \A 1'x
    connect \B { \D [0] \D [1] \D [2] \D [3] \D [4] \D [5] \D [6] \D [7] }
    connect \S { $procmux$10_CMP $procmux$9_CMP $procmux$8_CMP $procmux$7_CMP $procmux$6_CMP $procmux$5_CMP $procmux$4_CMP $procmux$3_CMP }
    connect \Y $procmux$2_Y
  end
