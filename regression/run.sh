#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

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
		echo FAIL > ${1}_${2}.status
	else
		if grep "$expected_string" yosys.log; then
			echo PASS > ${1}_${2}.status
		else
			echo FAIL > ${1}_${2}.status
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
	 [ "$1" = "issue_00699" ] ||\
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
	 [ "$1" = "issue_00865" ] ||\
	 [ "$1" = "issue_00867" ] ||\
	 [ "$1" = "issue_00870" ] ||\
	 [ "$1" = "issue_00873" ] ||\
	 [ "$1" = "issue_00888" ] ||\
	 [ "$1" = "issue_00922" ] ||\
	 [ "$1" = "issue_00931" ] ||\
	 [ "$1" = "issue_00935" ] ||\
	 [ "$1" = "issue_00938" ] ||\
	 [ "$1" = "issue_00940" ] ||\
	 [ "$1" = "issue_00948" ] ||\
	 [ "$1" = "issue_00954" ] ||\
	 [ "$1" = "issue_00955" ] ||\
	 [ "$1" = "issue_00956" ] ||\
	 [ "$1" = "issue_00961" ] ||\
	 [ "$1" = "issue_00968" ] ||\
	 [ "$1" = "issue_00981" ] ||\
	 [ "$1" = "issue_00982" ] ||\
	 [ "$1" = "issue_00987" ] ||\
	 [ "$1" = "issue_00993" ] ||\
	 [ "$1" = "issue_00997" ]; then

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
		 [ "$1" = "issue_00699" ] ||\
		 [ "$1" = "issue_00708" ] ||\
		 [ "$1" = "issue_00826" ] ||\
		 [ "$1" = "issue_00862" ] ||\
		 [ "$1" = "issue_00870" ] ||\
		 [ "$1" = "issue_00948" ] ||\
		 [ "$1" = "issue_00987" ]; then
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
	elif [ "$1" = "issue_00867" ]; then
		expected_string="RAMB36E1                        1"
	elif [ "$1" = "issue_00873" ]; then
		expected_string="has an unprocessed 'init' attribute."
		expected="0"
	elif [ "$1" = "issue_00888" ]; then
		expected_string="FDRE                            4"
	elif [ "$1" = "issue_00922" ]; then
		expected_string="ERROR: Unclocked write port 0 on memory top.ram."
		expected="0"
	elif [ "$1" = "issue_00931" ]; then
		expected_string="Number of cells:                  5"
	elif [ "$1" = "issue_00935" ]; then
		expected_string="Found logic loop in module"
		expected="0"
	elif [ "$1" = "issue_00938" ]; then
		expected_string="terminate called after throwing"
		expected="0"
	elif [ "$1" = "issue_00940" ]; then
		expected_string="failed: return code 134"
		expected="0"
	elif [ "$1" = "issue_00954" ]; then
		expected_string="out = 4'1000"
	elif [ "$1" = "issue_00955" ]; then
		expected_string="out = 8'00001000"
	elif [ "$1" = "issue_00956" ]; then
		expected_string="Wire inivalue.r_val has an unprocessed 'init' attribute"
		expected="0"
	elif [ "$1" = "issue_00961" ]; then
		expected_string="Executing PROC_DFF pass"
	elif [ "$1" = "issue_00968" ]; then
		expected_string="assign o_value = { 4'hx, i_value }"
	elif [ "$1" = "issue_00981" ]; then
		expected_string="Executing CHECK pass"
	elif [ "$1" = "issue_00982" ]; then
		expected_string="INIT 1'0"
	elif [ "$1" = "issue_00993" ]; then
		expected_string="_DFF_P_                        1"
	elif [ "$1" = "issue_00997" ]; then
		expected_string="h0"
	fi

	yosys -ql yosys.log ../../scripts/$2.ys;
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	fi
	if grep "$expected_string" result.log; then
		if [ $expected = "1" ]; then
			echo PASS > ${1}_${2}.status
		else
			echo FAIL > ${1}_${2}.status
		fi
	else
		if [ $expected = "1" ]; then
			echo FAIL > ${1}_${2}.status
		else
			echo PASS > ${1}_${2}.status
		fi
	fi


# cases with simulation checks
else
	if [ -f "../../../../../techlibs/common/simcells.v" ]; then
		COMMON_PREFIX=../../../../../techlibs/common
		TECHLIBS_PREFIX=../../../../../techlibs
	else
		COMMON_PREFIX=/usr/local/share/yosys
		TECHLIBS_PREFIX=/usr/local/share/yosys
	fi

	iverilog_adds=""
	#Additional sources for iverilog simulation
	if [ "$1" = "issue_00084" ]; then
		iverilog_adds="$TECHLIBS_PREFIX/xilinx/brams_bb.v"
	elif [ "$1" = "issue_00160" ] ||\
		 [ "$1" = "issue_00182" ] ||\
		 [ "$1" = "issue_00183" ] ||\
		 [ "$1" = "issue_00481" ] ||\
		 [ "$1" = "issue_00567" ] ||\
		 [ "$1" = "issue_00589" ] ||\
		 [ "$1" = "issue_00628" ]; then
		iverilog_adds="$TECHLIBS_PREFIX/ice40/cells_sim.v"
	elif [ "$1" = "pr_00896" ]; then
		iverilog_adds="$TECHLIBS_PREFIX/ecp5/cells_sim.v"
	fi

	yosys -ql yosys.log ../../scripts/$2.ys
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
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

fi


touch .stamp
