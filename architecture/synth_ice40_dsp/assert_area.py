#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)(s?)_(\d+)(s?)_(A?B?P?)_A?B?P?\.v')

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    A,B = map(int, m.group(1,3))
    Asigned, Bsigned = m.group(2,4)
    Areg = 'A' in m.group(5)
    Breg = 'B' in m.group(5)
    Preg = 'P' in m.group(5)
    X = (A+14) // 16
    Y = (B+14) // 16
    count_MAC = X * Y
    count_DFF = 0
    if A % 16 > 1 and B % 16 > 1 and (A % 16 + B % 16) < 11:
        count_MAC -= 1
        if Areg or Breg:
            count_DFF += A%16 + B%16
    else:
        # TODO: Tighter bounds on count_DFF
        if (Areg or Breg) and (A % 16 == 1 or B % 16 == 1):
            count_DFF += A + B
    if Preg and (A > 16 or B > 16):
        count_DFF += A + B
    # TODO: Assert on number of SB_CARRY and SB_LUT too

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd {0}; select t:SB_MAC16 -assert-count {1}; select t:SB_DFF* -assert-max {2}";
endmodule
`endif
'''.format(os.path.splitext(fn)[0], count_MAC, count_DFF), file=f)
