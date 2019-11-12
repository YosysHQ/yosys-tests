  cell $mux $ternary$../top_tri.v:10$2
    parameter \WIDTH 1
    connect \A 1'z
    connect \B \en
    connect \S \i
    connect \Y $ternary$../top_tri.v:10$2_Y
  end
  attribute \src "../top_tri.v:8"
  cell $mux $ternary$../top_tri.v:8$1
    parameter \WIDTH 1
    connect \A 1'z
    connect \B \i
    connect \S \en
    connect \Y $ternary$../top_tri.v:8$1_Y
  end
