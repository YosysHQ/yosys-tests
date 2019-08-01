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
    if not (Asigned and Bsigned):
        A += 1
        B += 1
        Asigned = Bsigned = 1
    if A < B:
        A,B = B,A
        Asigned,Bsigned = Bsigned,Asigned
    if A == 25:
        X = 1 # No headroom needed on single multiplier
    else:
        X = (A + 23) // 24
    if B == 18:
        Y = 1 # No headroom needed on single multiplier
    else:
        Y = (B+16) // 17
    count_MAC = X * Y
    count_DFF = 0
    if Preg:
        count_DFF += A + B
    # TODO: Assert on number of CARRY4s too

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd {0}; select t:DSP48E1 -assert-count {1}; select t:FD* -assert-max {2}";
    // {3} {4} {5} {6} X={7} Y={8}
endmodule
`endif
'''.format(os.path.splitext(fn)[0], count_MAC, count_DFF, A,B,Asigned,Bsigned,X,Y), file=f)
