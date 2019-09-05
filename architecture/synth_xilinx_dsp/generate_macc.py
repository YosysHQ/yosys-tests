#!/usr/bin/env python3

from common_macc import gen_macc

ARange = ['17','17s','18','18s','19','19s','24','24s']
BRange = ['17','17s']

if __name__ == "__main__":
    gen_macc(ARange, BRange, reg="ABM")
