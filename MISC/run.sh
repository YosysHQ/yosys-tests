#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

yosys -ql yosys.log ../../scripts/$2.ys

if grep 'Assert' result.log || grep 'failed in' result.log || grep 'fail' result.log || grep 'ERROR' result.log; then
	echo fail > ${1}_${2}.status
else
	echo pass > ${1}_${2}.status
fi

touch .stamp
