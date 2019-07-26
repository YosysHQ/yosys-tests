#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)(s?)_(\d+)(s?)_A?B?P?_A?B?P?\.v')

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    A,B = map(int, m.group(1,3))
    X = (A+15) // 16
    Y = (B+15) // 16
    count_MAC = X * Y
    count_CARRY = 0
    if X > 1 and Y > 1:
        count_CARRY = X + Y - 16

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd {0}; select t:SB_MAC16 -assert-count {1}; select t:SB_CARRY -assert-count {2}; select t:SB_LUT -assert-count {2}; select t:* t:SB_MAC16 t:SB_CARRY t:SB_LUT %D %D %D -assert-none";
endmodule
`endif
'''.format(os.path.splitext(fn)[0], count_MAC, count_CARRY), file=f)
