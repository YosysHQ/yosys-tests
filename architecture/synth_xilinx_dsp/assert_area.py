#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)_(\d+)\.v')

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    A,B = map(int, m.group(1,2))

    bn,_ = os.path.splitext(fn)

    with open(fn, 'a') as f:
        print('''
`ifndef _AUTOTB
module __test ;
    wire [4095:0] assert_area = "cd; select t:DSP48E1 -assert-count 1";
endmodule
`endif
''', file=f)
