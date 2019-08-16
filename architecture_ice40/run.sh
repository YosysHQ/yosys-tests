#!/bin/bash

set -x
test -d $1

if [ "$2" != "verify" -a "$2" != "falsify" ]; then
	test -f scripts/$2.ys
fi

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start


if [ -f ../run-test.sh ]; then
	../run-test.sh
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
	touch .stamp
	exit
else
	if [ "$2" != "verify" -a "$2" != "falsify" ]; then
		test -f scripts/$2.ys
		yosys -ql yosys.log ../../scripts/$2.ys
		if [ $? != 0 ] ; then
			echo FAIL > ${1}_${2}.status
			touch .stamp
			exit 0
		fi
	fi
fi
if [ -f "../../../../../techlibs/common/simcells.v" ]; then
	COMMON_PREFIX=../../../../../techlibs/common
	TECHLIBS_PREFIX=../../../../../techlibs
else
	COMMON_PREFIX=/usr/local/share/yosys
	TECHLIBS_PREFIX=/usr/local/share/yosys
fi


if [ "$2" = "verify" ]; then
	iverilog -o testbench ../testbench.v ../../common.v ../top.v
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
		touch .stamp
		exit 0
	fi
elif [ "$2" = "falsify" ]; then
	iverilog -DBUG -o testbench ../testbench.v ../../common.v ../top.v
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
		touch .stamp
		exit 0
	fi
else
	iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ice40/cells_sim.v
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
		touch .stamp
		exit 0
	fi
fi


if [ "$2" = "falsify" ]; then
	if vvp -N testbench > testbench.log 2>&1; then
		echo FAIL > ${1}_${2}.status
	elif ! grep 'ERROR' testbench.log || grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
else
	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo FAIL > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
fi

touch .stamp
