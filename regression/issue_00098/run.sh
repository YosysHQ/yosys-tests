#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

	#Yosys part
	yosys -ql yosys.log -p "read_verilog ../top.v;
synth -top top;
write_verilog synth.v"
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	fi

	#Simulation part
	iverilog -o testbench  ../testbench.v synth.v ../common.v
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	fi

	#check the simulation result
	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo FAIL > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi

touch .stamp
