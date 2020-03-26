#!/bin/bash

#set -x
test -d $1
test -f $2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1
touch work_$2/.start
if [[ $2 =~ "_fail" ]]; then
	#4 - An error expected
	if yosys -ql work_$2/yosys.log $2.ys; then
		echo FAIL > work_$2/${2}.status
	else
		echo PASS > work_$2/${2}.status
	fi
else
	#2 - All asserts in .ys script
	yosys -ql work_$2/yosys.log $2.ys
	if [ $? != 0 ] ; then
		echo FAIL > work_$2/${2}.status
	else
		echo PASS > work_$2/${2}.status
	fi
fi
touch work_$2/.stamp
