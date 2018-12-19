#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

yosys -ql yosys.log ../../scripts/$2.ys
iverilog -o testbench ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v

if ! vvp -N testbench > testbench.log 2>&1; then
	grep 'ERROR' testbench.log
	echo fail > ${1}_${2}.status
elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
	echo fail > ${1}_${2}.status
else
	echo pass > ${1}_${2}.status
fi

touch .stamp
