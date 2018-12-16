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
	iverilog -o testbench ../testbench.v ../top.v
elif [ "$2" = "falsify" ]; then
	iverilog -DBUG -o testbench ../testbench.v ../top.v
else
	yosys -ql yosys.log ../../scripts/$2.ys
	iverilog -o testbench ../testbench.v synth.v
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
