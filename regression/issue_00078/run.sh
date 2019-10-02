#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

expected_string="\\\X\[0\] , \\\X\[1\] , \\\X\[2\] ,"

	#Yosys part
	yosys -ql yosys.log -p "read_verilog ../top.v
hierarchy
splitnets -ports
write_verilog output.v"
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	fi
	if grep "$expected_string" output.v; then
		echo PASS > ${1}_${2}.status
	else
		echo FAIL > ${1}_${2}.status
	fi

touch .stamp
