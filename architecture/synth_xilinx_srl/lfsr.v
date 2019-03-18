module lfsr #(parameter len=0) (input clk, output dout);
generate
         if (len == 1) lfsr_1 sr(clk, dout);
    else if (len == 2) lfsr_2 sr(clk, dout);
    else if (len == 3) lfsr_3 sr(clk, dout);
    else if (len == 4) lfsr_4 sr(clk, dout);
    else if (len == 5) lfsr_5 sr(clk, dout);
    else if (len == 6) lfsr_6 sr(clk, dout);
    else if (len == 7) lfsr_7 sr(clk, dout);
    else if (len == 8) lfsr_8 sr(clk, dout);
    else if (len == 9) lfsr_9 sr(clk, dout);
    else if (len == 10) lfsr_10 sr(clk, dout);
    else if (len == 11) lfsr_11 sr(clk, dout);
    else if (len == 12) lfsr_12 sr(clk, dout);
    else if (len == 13) lfsr_13 sr(clk, dout);
    else if (len == 14) lfsr_14 sr(clk, dout);
    else if (len == 15) lfsr_15 sr(clk, dout);
    else if (len == 16) lfsr_16 sr(clk, dout);
    else if (len == 17) lfsr_17 sr(clk, dout);
    else if (len == 18) lfsr_18 sr(clk, dout);
    else if (len == 19) lfsr_19 sr(clk, dout);
    else if (len == 20) lfsr_20 sr(clk, dout);
    else if (len == 21) lfsr_21 sr(clk, dout);
    else if (len == 22) lfsr_22 sr(clk, dout);
    else if (len == 23) lfsr_23 sr(clk, dout);
    else if (len == 24) lfsr_24 sr(clk, dout);
    else if (len == 25) lfsr_25 sr(clk, dout);
    else if (len == 26) lfsr_26 sr(clk, dout);
    else if (len == 27) lfsr_27 sr(clk, dout);
    else if (len == 28) lfsr_28 sr(clk, dout);
    else if (len == 29) lfsr_29 sr(clk, dout);
    else if (len == 30) lfsr_30 sr(clk, dout);
    else if (len == 31) lfsr_31 sr(clk, dout);
    else if (len == 32) lfsr_32 sr(clk, dout);
    else if (len == 33) lfsr_33 sr(clk, dout);
    else if (len == 34) lfsr_34 sr(clk, dout);
    else if (len == 35) lfsr_35 sr(clk, dout);
    else if (len == 36) lfsr_36 sr(clk, dout);
    else if (len == 37) lfsr_37 sr(clk, dout);
    else if (len == 38) lfsr_38 sr(clk, dout);
    else if (len == 39) lfsr_39 sr(clk, dout);
    else if (len == 40) lfsr_40 sr(clk, dout);
    else if (len == 41) lfsr_41 sr(clk, dout);
    else if (len == 42) lfsr_42 sr(clk, dout);
    else if (len == 43) lfsr_43 sr(clk, dout);
    else if (len == 44) lfsr_44 sr(clk, dout);
    else if (len == 45) lfsr_45 sr(clk, dout);
    else if (len == 46) lfsr_46 sr(clk, dout);
    else if (len == 47) lfsr_47 sr(clk, dout);
    else if (len == 48) lfsr_48 sr(clk, dout);
    else if (len == 49) lfsr_49 sr(clk, dout);
    else if (len == 50) lfsr_50 sr(clk, dout);
    else if (len == 51) lfsr_51 sr(clk, dout);
    else if (len == 52) lfsr_52 sr(clk, dout);
    else if (len == 53) lfsr_53 sr(clk, dout);
    else if (len == 54) lfsr_54 sr(clk, dout);
    else if (len == 55) lfsr_55 sr(clk, dout);
    else if (len == 56) lfsr_56 sr(clk, dout);
    else if (len == 57) lfsr_57 sr(clk, dout);
    else if (len == 58) lfsr_58 sr(clk, dout);
    else if (len == 59) lfsr_59 sr(clk, dout);
    else if (len == 60) lfsr_60 sr(clk, dout);
    else if (len == 61) lfsr_61 sr(clk, dout);
    else if (len == 62) lfsr_62 sr(clk, dout);
    else if (len == 63) lfsr_63 sr(clk, dout);
    else if (len == 64) lfsr_64 sr(clk, dout);
    else if (len == 65) lfsr_65 sr(clk, dout);
    else if (len == 66) lfsr_66 sr(clk, dout);
    else if (len == 67) lfsr_67 sr(clk, dout);
    else if (len == 68) lfsr_68 sr(clk, dout);
    else if (len == 69) lfsr_69 sr(clk, dout);
    else if (len == 70) lfsr_70 sr(clk, dout);
    else if (len == 71) lfsr_71 sr(clk, dout);
    else if (len == 72) lfsr_72 sr(clk, dout);
    else if (len == 73) lfsr_73 sr(clk, dout);
    else if (len == 74) lfsr_74 sr(clk, dout);
    else if (len == 75) lfsr_75 sr(clk, dout);
    else if (len == 76) lfsr_76 sr(clk, dout);
    else if (len == 77) lfsr_77 sr(clk, dout);
    else if (len == 78) lfsr_78 sr(clk, dout);
    else if (len == 79) lfsr_79 sr(clk, dout);
    else if (len == 80) lfsr_80 sr(clk, dout);
    else if (len == 81) lfsr_81 sr(clk, dout);
    else if (len == 82) lfsr_82 sr(clk, dout);
    else if (len == 83) lfsr_83 sr(clk, dout);
    else if (len == 84) lfsr_84 sr(clk, dout);
    else if (len == 85) lfsr_85 sr(clk, dout);
    else if (len == 86) lfsr_86 sr(clk, dout);
    else if (len == 87) lfsr_87 sr(clk, dout);
    else if (len == 88) lfsr_88 sr(clk, dout);
    else if (len == 89) lfsr_89 sr(clk, dout);
    else if (len == 90) lfsr_90 sr(clk, dout);
    else if (len == 91) lfsr_91 sr(clk, dout);
    else if (len == 92) lfsr_92 sr(clk, dout);
    else if (len == 93) lfsr_93 sr(clk, dout);
    else if (len == 94) lfsr_94 sr(clk, dout);
    else if (len == 95) lfsr_95 sr(clk, dout);
    else if (len == 96) lfsr_96 sr(clk, dout);
    else if (len == 97) lfsr_97 sr(clk, dout);
    else if (len == 98) lfsr_98 sr(clk, dout);
    else if (len == 99) lfsr_99 sr(clk, dout);
    else if (len == 100) lfsr_100 sr(clk, dout);
    else if (len == 101) lfsr_101 sr(clk, dout);
    else if (len == 102) lfsr_102 sr(clk, dout);
    else if (len == 103) lfsr_103 sr(clk, dout);
    else if (len == 104) lfsr_104 sr(clk, dout);
    else if (len == 105) lfsr_105 sr(clk, dout);
    else if (len == 106) lfsr_106 sr(clk, dout);
    else if (len == 107) lfsr_107 sr(clk, dout);
    else if (len == 108) lfsr_108 sr(clk, dout);
    else if (len == 109) lfsr_109 sr(clk, dout);
    else if (len == 110) lfsr_110 sr(clk, dout);
    else if (len == 111) lfsr_111 sr(clk, dout);
    else if (len == 112) lfsr_112 sr(clk, dout);
    else if (len == 113) lfsr_113 sr(clk, dout);
    else if (len == 114) lfsr_114 sr(clk, dout);
    else if (len == 115) lfsr_115 sr(clk, dout);
    else if (len == 116) lfsr_116 sr(clk, dout);
    else if (len == 117) lfsr_117 sr(clk, dout);
    else if (len == 118) lfsr_118 sr(clk, dout);
    else if (len == 119) lfsr_119 sr(clk, dout);
    else if (len == 120) lfsr_120 sr(clk, dout);
    else if (len == 121) lfsr_121 sr(clk, dout);
    else if (len == 122) lfsr_122 sr(clk, dout);
    else if (len == 123) lfsr_123 sr(clk, dout);
    else if (len == 124) lfsr_124 sr(clk, dout);
    else if (len == 125) lfsr_125 sr(clk, dout);
    else if (len == 126) lfsr_126 sr(clk, dout);
    else if (len == 127) lfsr_127 sr(clk, dout);
    else if (len == 128) lfsr_128 sr(clk, dout);
    else if (len == 129) lfsr_129 sr(clk, dout);
    else if (len == 130) lfsr_130 sr(clk, dout);
    else if (len == 131) lfsr_131 sr(clk, dout);
    else if (len == 132) lfsr_132 sr(clk, dout);
    else if (len == 133) lfsr_133 sr(clk, dout);
    else if (len == 134) lfsr_134 sr(clk, dout);
    else if (len == 135) lfsr_135 sr(clk, dout);
    else if (len == 136) lfsr_136 sr(clk, dout);
    else if (len == 137) lfsr_137 sr(clk, dout);
    else if (len == 138) lfsr_138 sr(clk, dout);
    else if (len == 139) lfsr_139 sr(clk, dout);
    else if (len == 140) lfsr_140 sr(clk, dout);
    else if (len == 141) lfsr_141 sr(clk, dout);
    else if (len == 142) lfsr_142 sr(clk, dout);
    else if (len == 143) lfsr_143 sr(clk, dout);
    else if (len == 144) lfsr_144 sr(clk, dout);
    else if (len == 145) lfsr_145 sr(clk, dout);
    else if (len == 146) lfsr_146 sr(clk, dout);
    else if (len == 147) lfsr_147 sr(clk, dout);
    else if (len == 148) lfsr_148 sr(clk, dout);
    else if (len == 149) lfsr_149 sr(clk, dout);
    else if (len == 150) lfsr_150 sr(clk, dout);
    else if (len == 151) lfsr_151 sr(clk, dout);
    else if (len == 152) lfsr_152 sr(clk, dout);
    else if (len == 153) lfsr_153 sr(clk, dout);
    else if (len == 154) lfsr_154 sr(clk, dout);
    else if (len == 155) lfsr_155 sr(clk, dout);
    else if (len == 156) lfsr_156 sr(clk, dout);
    else if (len == 157) lfsr_157 sr(clk, dout);
    else if (len == 158) lfsr_158 sr(clk, dout);
    else if (len == 159) lfsr_159 sr(clk, dout);
    else if (len == 160) lfsr_160 sr(clk, dout);
    else if (len == 161) lfsr_161 sr(clk, dout);
    else if (len == 162) lfsr_162 sr(clk, dout);
    else if (len == 163) lfsr_163 sr(clk, dout);
    else if (len == 164) lfsr_164 sr(clk, dout);
    else if (len == 165) lfsr_165 sr(clk, dout);
    else if (len == 166) lfsr_166 sr(clk, dout);
    else if (len == 167) lfsr_167 sr(clk, dout);
    else if (len == 168) lfsr_168 sr(clk, dout);
    else if (len == 169) lfsr_169 sr(clk, dout);
    else if (len == 170) lfsr_170 sr(clk, dout);
endgenerate
endmodule

`include "lfsr_3.v"
`include "lfsr_4.v"
`include "lfsr_5.v"
`include "lfsr_6.v"
`include "lfsr_7.v"
`include "lfsr_8.v"
`include "lfsr_9.v"
`include "lfsr_10.v"
`include "lfsr_11.v"
`include "lfsr_12.v"
`include "lfsr_13.v"
`include "lfsr_14.v"
`include "lfsr_15.v"
`include "lfsr_16.v"
`include "lfsr_17.v"
`include "lfsr_18.v"
`include "lfsr_19.v"
`include "lfsr_20.v"
`include "lfsr_21.v"
`include "lfsr_22.v"
`include "lfsr_23.v"
`include "lfsr_24.v"
`include "lfsr_25.v"
`include "lfsr_26.v"
`include "lfsr_27.v"
`include "lfsr_28.v"
`include "lfsr_29.v"
`include "lfsr_30.v"
`include "lfsr_31.v"
`include "lfsr_32.v"
`include "lfsr_33.v"
`include "lfsr_34.v"
`include "lfsr_35.v"
`include "lfsr_36.v"
`include "lfsr_37.v"
`include "lfsr_38.v"
`include "lfsr_39.v"
`include "lfsr_40.v"
`include "lfsr_41.v"
`include "lfsr_42.v"
`include "lfsr_43.v"
`include "lfsr_44.v"
`include "lfsr_45.v"
`include "lfsr_46.v"
`include "lfsr_47.v"
`include "lfsr_48.v"
`include "lfsr_49.v"
`include "lfsr_50.v"
`include "lfsr_51.v"
`include "lfsr_52.v"
`include "lfsr_53.v"
`include "lfsr_54.v"
`include "lfsr_55.v"
`include "lfsr_56.v"
`include "lfsr_57.v"
`include "lfsr_58.v"
`include "lfsr_59.v"
`include "lfsr_60.v"
`include "lfsr_61.v"
`include "lfsr_62.v"
`include "lfsr_63.v"
`include "lfsr_64.v"
`include "lfsr_65.v"
`include "lfsr_66.v"
`include "lfsr_67.v"
`include "lfsr_68.v"
`include "lfsr_69.v"
`include "lfsr_70.v"
`include "lfsr_71.v"
`include "lfsr_72.v"
`include "lfsr_73.v"
`include "lfsr_74.v"
`include "lfsr_75.v"
`include "lfsr_76.v"
`include "lfsr_77.v"
`include "lfsr_78.v"
`include "lfsr_79.v"
`include "lfsr_80.v"
`include "lfsr_81.v"
`include "lfsr_82.v"
`include "lfsr_83.v"
`include "lfsr_84.v"
`include "lfsr_85.v"
`include "lfsr_86.v"
`include "lfsr_87.v"
`include "lfsr_88.v"
`include "lfsr_89.v"
`include "lfsr_90.v"
`include "lfsr_91.v"
`include "lfsr_92.v"
`include "lfsr_93.v"
`include "lfsr_94.v"
`include "lfsr_95.v"
`include "lfsr_96.v"
`include "lfsr_97.v"
`include "lfsr_98.v"
`include "lfsr_99.v"
`include "lfsr_100.v"
`include "lfsr_101.v"
`include "lfsr_102.v"
`include "lfsr_103.v"
`include "lfsr_104.v"
`include "lfsr_105.v"
`include "lfsr_106.v"
`include "lfsr_107.v"
`include "lfsr_108.v"
`include "lfsr_109.v"
`include "lfsr_110.v"
`include "lfsr_111.v"
`include "lfsr_112.v"
`include "lfsr_113.v"
`include "lfsr_114.v"
`include "lfsr_115.v"
`include "lfsr_116.v"
`include "lfsr_117.v"
`include "lfsr_118.v"
`include "lfsr_119.v"
`include "lfsr_120.v"
`include "lfsr_121.v"
`include "lfsr_122.v"
`include "lfsr_123.v"
`include "lfsr_124.v"
`include "lfsr_125.v"
`include "lfsr_126.v"
`include "lfsr_127.v"
`include "lfsr_128.v"
`include "lfsr_129.v"
`include "lfsr_130.v"
`include "lfsr_131.v"
`include "lfsr_132.v"
`include "lfsr_133.v"
`include "lfsr_134.v"
`include "lfsr_135.v"
`include "lfsr_136.v"
`include "lfsr_137.v"
`include "lfsr_138.v"
`include "lfsr_139.v"
`include "lfsr_140.v"
`include "lfsr_141.v"
`include "lfsr_142.v"
`include "lfsr_143.v"
`include "lfsr_144.v"
`include "lfsr_145.v"
`include "lfsr_146.v"
`include "lfsr_147.v"
`include "lfsr_148.v"
`include "lfsr_149.v"
`include "lfsr_150.v"
`include "lfsr_151.v"
`include "lfsr_152.v"
`include "lfsr_153.v"
`include "lfsr_154.v"
`include "lfsr_155.v"
`include "lfsr_156.v"
`include "lfsr_157.v"
`include "lfsr_158.v"
`include "lfsr_159.v"
`include "lfsr_160.v"
`include "lfsr_161.v"
`include "lfsr_162.v"
`include "lfsr_163.v"
`include "lfsr_164.v"
`include "lfsr_165.v"
`include "lfsr_166.v"
`include "lfsr_167.v"
`include "lfsr_168.v"
