#!/bin/bash

set -x
test -d $1
test -f $2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

#
if [ -f ../run-test.sh ]; then
	../run-test.sh
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
	touch .stamp
	exit
fi
if [[ $2 =~ "_fail" ]]; then
	#4 - An error expected
	if yosys -ql yosys.log ../$2.ys; then
		echo FAIL > ${1}_${2}.status
	else
		if [ -f "../$2.pat" ]; then
			expectation=$(<../$2.pat)
			if grep "$expectation" yosys.log; then
				echo PASS > ${1}_${2}.status
			else
				echo FAIL > ${1}_${2}.status
			fi
		else
			echo PASS > ${1}_${2}.status
		fi
	fi
else
	#2 - All asserts in .ys script
	yosys -ql yosys.log ../$2.ys
	if [ $? != 0 ] ; then
		echo FAIL > ${1}_${2}.status
		touch .stamp
		exit 0
	else
		#3 Output log check
		if [ -f "../$2.pat" ]; then # Expected behavior
			expectation=$(<../$2.pat)
			if grep "$expectation" result.out; then
				echo PASS > ${1}_${2}.status
			else
				echo FAIL > ${1}_${2}.status
			fi
		elif [ -f "../$2_n.pat" ]; then # Not expected behavior
			expectation=$(<../$2_n.pat)
			if grep "$expectation" result.out; then
				echo FAIL > ${1}_${2}.status
			else
				echo PASS > ${1}_${2}.status
			fi
		#1 Iverilog run when testbench exists
		elif [ -f "../testbench.v" ]; then
			if [ -f "../../../../../techlibs/common/simcells.v" ]; then
				COMMON_PREFIX=../../../../../techlibs/common
				TECHLIBS_PREFIX=../../../../../techlibs
			else
				COMMON_PREFIX=/usr/local/share/yosys
				TECHLIBS_PREFIX=/usr/local/share/yosys
			fi
			if [ -f "../iverilog_adds.txt" ]; then
				iverilog_adds=$TECHLIBS_PREFIX/$(<../iverilog_adds.txt)
			else
				iverilog_adds=""
			fi
			iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $COMMON_PREFIX/simlib.v $iverilog_adds
			if [ $? != 0 ] ; then
				echo FAIL > ${1}_${2}.status
				touch .stamp
				exit 0
			fi
			if ! vvp -N testbench > testbench.log 2>&1; then
				grep 'ERROR' testbench.log
				echo FAIL > ${1}_${2}.status
			elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
				echo FAIL > ${1}_${2}.status
			else
				echo PASS > ${1}_${2}.status
			fi
		else
			echo PASS > ${1}_${2}.status
		fi
	fi
fi
touch .stamp
