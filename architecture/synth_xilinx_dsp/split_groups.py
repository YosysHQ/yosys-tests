#!/usr/bin/python3

import glob
import re
import os
import shutil

for dirname in glob.glob('miter_group*/'):
    shutil.rmtree(dirname)

groupsize = 25
i = 0
curdir = ""
for fn in list(sorted(glob.glob('*.v'))):
    if i % groupsize == 0:
        curdir = "miter_group_{0}".format(i // groupsize)
        os.mkdir(curdir)
    os.rename(fn, curdir + "/" + fn)
    i += 1