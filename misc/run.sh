#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

yosys -ql yosys.log ../../scripts/$2.ys
if [ $? != 0 ] ; then
    echo FAIL > ${1}_${2}.status
    touch .stamp
    exit 0
fi

if grep 'Assert' result.log || grep 'failed in' result.log || grep 'ERROR' result.log; then
	echo FAIL > ${1}_${2}.status
else
	echo PASS > ${1}_${2}.status
fi

touch .stamp
