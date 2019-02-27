#!/bin/bash

set -ex
test -d $1

if [ "$2" != "verify" -a "$2" != "falsify" ]; then
	test -f scripts/$2.ys
fi

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

if [ "$2" = "verify" ]; then
	iverilog -g 2012 -o testbench ../testbench.v ../../common.v ../top.v ../../../../../techlibs/xilinx/brams_bb.v
elif [ "$2" = "falsify" ]; then
	iverilog -DBUG -g 2012 -o testbench ../testbench.v ../../common.v ../top.v ../../../../../techlibs/xilinx/brams_bb.v
else
	yosys -ql yosys.log ../../scripts/$2.ys
	iverilog -o testbench ../testbench.v ../../common.v synth.v $(yosys-config --datdir/simcells.v) ../../../../../techlibs/xilinx/brams_bb.v
fi

if [ "$2" = "falsify" ]; then
	if vvp -N testbench > testbench.log 2>&1; then
		echo FAIL > ${1}_${2}.status
	elif ! grep 'ERROR' testbench.log || grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo pass > ${1}_${2}.status
	fi
else
	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo FAIL > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo pass > ${1}_${2}.status
	fi
fi

touch .stamp
