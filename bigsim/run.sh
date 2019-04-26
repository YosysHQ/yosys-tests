#!/bin/bash

set -x
source $1/config
mkdir $1/work_$2
cd $1/work_$2

iverilog_cmd="iverilog -o sim -s testbench -I../rtl -I../sim"

rtl_files=""
for fn in $RTL; do
	rtl_files="$rtl_files ../rtl/$fn"
done

case "$2" in
	sim)
		iverilog_cmd="$iverilog_cmd $rtl_files"
		;;
	falsify)
		iverilog_cmd="$iverilog_cmd -DBUG $rtl_files"
		;;
	cmos)
		yosys -ql synthlog.txt -p "synth -top $TOP; abc -g cmos4; write_verilog synth.v" $rtl_files
		iverilog_cmd="$iverilog_cmd synth.v"
		;;
	ice40)
		yosys -ql synthlog.txt -p "synth_ice40 -top $TOP; write_verilog synth.v" $rtl_files
		iverilog_cmd="$iverilog_cmd synth.v $(yosys-config --datdir/ice40/cells_sim.v)"
		;;
	*)
		exit 1
		;;
esac

for fn in $SIM; do
	iverilog_cmd="$iverilog_cmd ../sim/$fn"
done
$iverilog_cmd
if [ $? != 0 ] ; then
    echo FAIL > ${1}_${2}.status
    touch .stamp
    exit 0
fi

vvp -N sim | pv -l > output.txt
if [ $? != 0 ] ; then
    echo FAIL > ${1}_${2}.status
    touch .stamp
    exit 0
fi

if [ "$2" = "falsify" ]; then
	if cmp output.txt ../work_sim/output.txt; then
		echo FAIL > ../../${1}_${2}.status
	else
		echo PASS > ../../${1}_${2}.status
	fi
elif [ "$2" != "sim" ]; then
	if cmp output.txt ../work_sim/output.txt; then
		echo PASS > ../../${1}_${2}.status
	else
		echo FAIL > ../../${1}_${2}.status
	fi
fi
