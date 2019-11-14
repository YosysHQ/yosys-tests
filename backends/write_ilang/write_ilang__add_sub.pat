  cell $add $add$../../common/add_sub.v:10$1
    parameter \A_SIGNED 0
    parameter \A_WIDTH 4
    parameter \B_SIGNED 0
    parameter \B_WIDTH 4
    parameter \Y_WIDTH 4
    connect \A \x
    connect \B \y
    connect \Y $add$../../common/add_sub.v:10$1_Y
  end
  attribute \src "../../common/add_sub.v:11"
  cell $sub $sub$../../common/add_sub.v:11$2
    parameter \A_SIGNED 0
    parameter \A_WIDTH 4
    parameter \B_SIGNED 0
    parameter \B_WIDTH 4
    parameter \Y_WIDTH 4
    connect \A \x
    connect \B \y
    connect \Y $sub$../../common/add_sub.v:11$2_Y
  end
