#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start
expected_string="syntax error"
	#Yosys part
	if yosys -ql yosys.log -p "read_verilog ../top.v"; then
		echo FAIL > ${1}_${2}.status
	else
		if grep "$expected_string" yosys.log; then
			echo PASS > ${1}_${2}.status
		else
			echo FAIL > ${1}_${2}.status
		fi
	fi

touch .stamp
