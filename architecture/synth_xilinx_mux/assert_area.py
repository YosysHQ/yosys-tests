#!/usr/bin/python3

import glob
import re
import os

re_mux = re.compile(r'mux_(index|case|if_bal|if_unbal)_(\d+)_(\d+)\.v')

area = {}
#              1  2  3  4  5  6 F7 F8
area[2]   = ([ 0, 0, 1, 0, 0, 0, 0, 0 ],)
area[3]   = ([ 0, 0, 0, 0, 1, 0, 0, 0 ],)
area[4]   = ([ 0, 0, 0, 0, 0, 1, 0, 0 ],)
area[5]   = ([ 0, 0, 0, 0, 0, 0, 1, 0 ], *area[4])
area[7]   = ([ 0, 0, 0, 0, 0, 0, 1, 0 ], *area[4], *area[3])
area[8]   = ([ 0, 0, 0, 0, 0, 0, 1, 0 ], *area[4], *area[4])
area[9]   = ([ 0, 0, 0, 0, 0, 0, 1, 1 ], *area[8])
area[15]  = ([ 0, 0, 0, 0, 0, 0, 0, 1 ], *area[8], *area[7])
area[16]  = ([ 0, 0, 0, 0, 0, 0, 0, 1 ], *area[8], *area[8])
area[17]  = (*area[16], *area[2])
area[31]  = (*area[16], *area[15], *area[2])
area[32]  = (*area[16], *area[16], *area[2])
area[33]  = (*area[16], *area[16], *area[3])
area[63]  = (*area[15], *(area[16] * 3), *area[4])
area[64]  = (*(area[16] * 4), *area[4])
area[65]  = (*(area[16] * 4), *area[5])
area[127] = ([ 0, 0, 0, 0, 0, 0, 1, 0 ], *area[63], *area[64])
area[128] = ([ 0, 0, 0, 0, 0, 0, 1, 0 ], *area[64], *area[64])
area[129] = ([ 0, 0, 0, 0, 0, 0, 1, 1 ], *area[64], *area[65])
area[255] = (*area[15], *(area[16] * 15), *area[16])
area[256] = (*(area[16] * 16), *area[16])
area[257] = ([ 0, 0, 1, 0, 0,68,34,17 ],)

for N in area:
    area[N] = [sum(i) for i in zip(*area[N])]

for fn in glob.glob('*.v'):
    m = re_mux.match(fn)
    if not m: continue

    N,W = map(int, m.group(2,3))
    assert N in area

    bn,_ = os.path.splitext(fn)
    
    print('design -reset')
    print('read_verilog {0}.out/{0}_syn0.v'.format(bn))
    for r,v in zip(['LUT1','LUT2','LUT3','LUT4','LUT5','LUT6','MUXF7','MUXF8'], area[N]):
        print('select t:{0} -assert-count {1}'.format(r,v*W))

