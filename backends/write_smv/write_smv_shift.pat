    _$shl$###top_shift#v#15$4_Y := 0ub32_00000000000000000000000000000001[31:2] != 0ud30_0 ? 0ud2_0 : resize(resize(_$sshr$###top_shift#v#14$3_Y :: _$shr$###top_shift#v#13$1_Y, 3) << 0ub32_00000000000000000000000000000001[1:0], 2);
    _$sshr$###top_shift#v#14$3_Y := resize(unsigned(resize(signed(_$add$###top_shift#v#14$2_Y), 1) >> _y), 1);
