  cell $mul $mul$../../common/mul.v:8$1
    parameter \A_SIGNED 0
    parameter \A_WIDTH 6
    parameter \B_SIGNED 0
    parameter \B_WIDTH 6
    parameter \Y_WIDTH 12
    connect \A \x
    connect \B \y
    connect \Y $mul$../../common/mul.v:8$1_Y
  end
