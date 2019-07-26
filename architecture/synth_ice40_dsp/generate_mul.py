#!/usr/bin/env python3

from common_mul import gen_mul

ARange = ['16','16s','24','24s','32','32s', '48', '48s']
BRange = ['16','16s','24','24s','32','32s']

if __name__ == "__main__":
    gen_mul(ARange, BRange)
