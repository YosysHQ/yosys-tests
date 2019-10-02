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
freduce"
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	else
		echo PASS > ${1}_${2}.status
	fi

touch .stamp
