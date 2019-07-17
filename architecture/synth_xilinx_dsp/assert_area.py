#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)(s?)_(\d+)(s?)_A?B?P?_A?B?P?\.v')

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    A,B = map(int, m.group(1,3))
    if not m.group(2): A += 1
    if not m.group(4): B += 1

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd %s; select t:DSP48E1 -assert-count 1; select t:* t:DSP48E1 %%d -assert-none";
endmodule
`endif
''' % os.path.splitext(fn)[0], file=f)
