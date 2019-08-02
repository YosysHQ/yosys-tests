#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mul_(\d+)(s?)_(\d+)(s?)_(A?B?P?)_A?B?P?\.v')

maxwidth = 0
i = 0

body = ""

for fn in sorted(glob.glob('*.v')):
    m = re_mux.match(fn)
    if not m: continue
    A,B = map(int, m.group(1,3))
    Asigned, Bsigned = m.group(2,4)
    Areg = 'A' in m.group(5)
    Breg = 'B' in m.group(5)
    Preg = 'P' in m.group(5)
    maxwidth = max(maxwidth, (A+B+3))
    body += "    /**** DUT {0}: {1} ****/\n".format(i, m.group(0))
    body += "    wire [{0}:0] p_gate_{1}, p_gold_{1};\n".format(A+B-1, i)
    inst_list = ".clk(clk), .CEA(din[0]), .CEB(din[1]), .CEP(din[2]), .A(din[3+:{0}]), .B(din[{1}+:{2}]), .P(p_<REPLACE>_{3})".format(A, A+3, B, i)
    body += "    {0}_syn gate_inst_{1} ({2});\n".format(m.group(0)[:-2], i, inst_list.replace("<REPLACE>", "gate"))
    body += "    {0}     gold_inst_{1} ({2});\n".format(m.group(0)[:-2], i, inst_list.replace("<REPLACE>", "gold"))
    body += "    assign miter[{0}] = p_gate_{0} != p_gold_{0};\n".format(i)
    body += "\n"
    i += 1

with open("top.v", "w") as f:
    print("module top(input clk, input [{0}:0] din, output [{1}:0] miter);".format(maxwidth - 1, i - 1), file=f)
    print(body, file=f)
    print("endmodule", file=f)