#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)(s?)_(\d+)(s?)_(A?B?M?P?)_A?B?M?P?\.v')

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    A,B = map(int, m.group(1,3))
    Asigned, Bsigned = m.group(2,4)
    Areg = 'A' in m.group(5)
    Breg = 'B' in m.group(5)
    Mreg = 'M' in m.group(5)
    Preg = 'P' in m.group(5)
    if A < B:
        A,B = B,A
        Asigned,Bsigned = Bsigned,Asigned
    if not (Asigned and Bsigned):
        A += 1
        B += 1
        Asigned = Bsigned = 1
    X = 1 + max(0,A-25+16) // 17
    Y = 1 + max(0,B-18+16) // 17
    count_MAC = X * Y

    count_DFF = 0
    if Mreg and (A > 25 or B > 18):
        count_DFF += A + B
    if Preg and (A > 25 or B > 18):
        count_DFF += A + B
    # TODO: More assert on number of CARRY and LUTs
    count_CARRY = ''
    if A <= 25 or B <= 18:
        count_CARRY = '; select t:XORCY -assert-none; select t:LUT* -assert-none';

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd {0}; select t:DSP48E1 -assert-count {1}; select t:FD* -assert-max {2}{3}";
endmodule
`endif
'''.format(os.path.splitext(fn)[0], count_MAC, count_DFF, count_CARRY), file=f)
