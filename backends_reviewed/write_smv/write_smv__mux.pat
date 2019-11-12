  DEFINE
    _$procmux$10_CMP := resize(word1(resize(_S, 3) = resize(0ub3_000, 3)), 1);
    _$procmux$9_CMP := resize(word1(resize(_S, 3) = resize(0ub3_001, 3)), 1);
    _$procmux$8_CMP := resize(word1(resize(_S, 3) = resize(0ub3_010, 3)), 1);
    _$procmux$7_CMP := resize(word1(resize(_S, 3) = resize(0ub3_011, 3)), 1);
    _$procmux$6_CMP := resize(word1(resize(_S, 3) = resize(0ub3_100, 3)), 1);
    _$procmux$5_CMP := resize(word1(resize(_S, 3) = resize(0ub3_101, 3)), 1);
    _$procmux$4_CMP := resize(word1(resize(_S, 3) = resize(0ub3_110, 3)), 1);
    _$procmux$2_Y := bool(_$procmux$3_CMP) ? _D[7:7] : bool(_$procmux$4_CMP) ? _D[6:6] : bool(_$procmux$5_CMP) ? _D[5:5] : bool(_$procmux$6_CMP) ? _D[4:4] : bool(_$procmux$7_CMP) ? _D[3:3] : bool(_$procmux$8_CMP) ? _D[2:2] : bool(_$procmux$9_CMP) ? _D[1:1] : bool(_$procmux$10_CMP) ? _D[0:0] : 0ub1_0;
    _$procmux$3_CMP := resize(word1(resize(_S, 3) = resize(0ub3_111, 3)), 1);
