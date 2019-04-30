#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2


# cases where 'syntax error' or other errors are expected
if [ "$1" = "issue_00089" ] ||\
   [ "$1" = "issue_00093" ] ||\
   [ "$1" = "issue_00095" ] ||\
   [ "$1" = "issue_00096" ] ||\
   [ "$1" = "issue_00196" ] ||\
   [ "$1" = "issue_00362" ] ||\
   [ "$1" = "issue_00582" ] ||\
   [ "$1" = "issue_00594" ] ||\
   [ "$1" = "issue_00603" ] ||\
   [ "$1" = "issue_00635" ] ||\
   [ "$1" = "issue_00699" ] ||\
   [ "$1" = "issue_00763" ] ||\
   [ "$1" = "issue_00814" ]; then

	expected_string="syntax error"
    #Change checked string for check other errors
	if [ "$1" = "issue_00196" ]; then
		expected_string="Found posedge/negedge event"
	elif [ "$1" = "issue_00362" ]; then
		expected_string="is connected to constants:"
	elif [ "$1" = "issue_00582" ]; then
		expected_string="Failed to detect width for identifier"
	elif [ "$1" = "issue_00594" ]; then
		expected_string="Single range expected"
	elif [ "$1" = "issue_00763" ]; then
		expected_string="Invalid nesting"
	elif [ "$1" = "issue_00814" ]; then
		expected_string="is implicitly declared"
	fi

	if yosys -ql yosys.log ../../scripts/$2.ys; then
		echo fail > ${1}_${2}.status
	else
		if grep "$expected_string" yosys.log; then
			echo pass > ${1}_${2}.status
		else
			echo fail > ${1}_${2}.status
		fi
	fi

# cases where some object names are/aren't expected in output file (tee -o result.log in the test script)
elif [ "$1" = "issue_00502" ] ||\
     [ "$1" = "issue_00524" ] ||\
     [ "$1" = "issue_00527" ] ||\
     [ "$1" = "issue_00639" ] ||\
     [ "$1" = "issue_00642" ] ||\
     [ "$1" = "issue_00644" ] ||\
	 [ "$1" = "issue_00655" ] ||\
	 [ "$1" = "issue_00675" ] ||\
	 [ "$1" = "issue_00685" ] ||\
	 [ "$1" = "issue_00689" ] ||\
	 [ "$1" = "issue_00708" ] ||\
	 [ "$1" = "issue_00737" ] ||\
	 [ "$1" = "issue_00774" ] ||\
	 [ "$1" = "issue_00781" ] ||\
	 [ "$1" = "issue_00785" ] ||\
	 [ "$1" = "issue_00810" ] ||\
	 [ "$1" = "issue_00823" ] ||\
	 [ "$1" = "issue_00826" ] ||\
	 [ "$1" = "issue_00831" ] ||\
	 [ "$1" = "issue_00835" ] ||\
	 [ "$1" = "issue_00857" ] ||\
	 [ "$1" = "issue_00862" ] ||\
	 [ "$1" = "issue_00865" ]; then

	expected_string=""
	expected="1"
	if [ "$1" = "issue_00502" ]; then
		expected_string="\\SUM/N10"
	elif [ "$1" = "issue_00524" ]; then
		expected_string="GP_INV"
	elif [ "$1" = "issue_00527" ]; then
		expected_string="DFFSR"
		expected="0"
	elif [ "$1" = "issue_00639" ]; then
		expected_string="Found a total"
	elif [ "$1" = "issue_00642" ] ||\
		 [ "$1" = "issue_00644" ] ||\
		 [ "$1" = "issue_00689" ] ||\
		 [ "$1" = "issue_00708" ] ||\
		 [ "$1" = "issue_00826" ] ||\
		 [ "$1" = "issue_00862" ]; then
		expected_string="Successfully finished Verilog frontend"
	elif [ "$1" = "issue_00655" ]; then
		expected_string="Executing EDIF backend"
	elif [ "$1" = "issue_00675" ]; then
		expected_string="Presumably equivalent wires"
	elif [ "$1" = "issue_00685" ]; then
		expected_string="Imported 0 cell"
	elif [ "$1" = "issue_00737" ]; then
		expected_string="A:"
	elif [ "$1" = "issue_00774" ] ||\
		 [ "$1" = "issue_00781" ] ||\
		 [ "$1" = "issue_00785" ]; then
		expected_string="Executing BLIF backend"
	elif [ "$1" = "issue_00810" ]; then
		expected_string="Executing ILANG backend"
	elif [ "$1" = "issue_00823" ]; then
		expected_string="Executing Verilog backend"
	elif [ "$1" = "issue_00831" ]; then
		expected_string="Executing SMT2 backend"
	elif [ "$1" = "issue_00835" ]; then
		expected_string="Replacing memory"
	elif [ "$1" = "issue_00857" ]; then
		expected_string="_DFF_P_                        1"
	elif [ "$1" = "issue_00865" ]; then
		expected_string="FDRE                           14"
	fi

	yosys -ql yosys.log ../../scripts/$2.ys;
	if grep "$expected_string" result.log; then
		if [ $expected = "1" ]; then
			echo pass > ${1}_${2}.status
		else
			echo fail > ${1}_${2}.status
		fi
	else
		if [ $expected = "1" ]; then
			echo fail > ${1}_${2}.status
		else
			echo pass > ${1}_${2}.status
		fi
	fi


# cases with simulation checks
else

	iverilog_adds=""
	#Additional sources for iverilog simulation
	if [ "$1" = "issue_00084" ]; then
		iverilog_adds="../../../../../techlibs/xilinx/brams_bb.v"
	elif [ "$1" = "issue_00160" ] ||\
		 [ "$1" = "issue_00182" ] ||\
		 [ "$1" = "issue_00183" ] ||\
		 [ "$1" = "issue_00481" ] ||\
		 [ "$1" = "issue_00567" ] ||\
		 [ "$1" = "issue_00589" ] ||\
		 [ "$1" = "issue_00628" ]; then
		iverilog_adds="../../../../../techlibs/ice40/cells_sim.v"
	elif [ "$1" = "pr_00896" ]; then
		iverilog_adds="../../../../../techlibs/ecp5/cells_sim.v"
	fi

	yosys -ql yosys.log ../../scripts/$2.ys
	iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/common/simlib.v $iverilog_adds
	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo fail > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo fail > ${1}_${2}.status
	else
		echo pass > ${1}_${2}.status
	fi

fi


touch .stamp
