#!/bin/bash

set -x
test -d $1

if [ "$2" != "verify" -a "$2" != "falsify" ]; then
	test -f scripts/$2.ys
fi

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

if [ "$2" = "verify" ]; then
	iverilog -o testbench ../testbench.v ../../common.v ../top.v
	if [ $? != 0 ] ; then
    	echo FAIL > ${1}_${2}.status
    	touch .stamp
    	exit 0
	fi
elif [ "$2" = "falsify" ]; then
	iverilog -DBUG -o testbench ../testbench.v ../../common.v ../top.v
	if [ $? != 0 ] ; then
	    echo FAIL > ${1}_${2}.status
	    touch .stamp
	    exit 0
	fi
else
	yosys -ql yosys.log ../../scripts/$2.ys
	if [ $? != 0 ] ; then
	    echo FAIL > ${1}_${2}.status
	    touch .stamp
	    exit 0
	fi

	if [ -f "../../../../../techlibs/common/simcells.v" ]; then
		COMMON_PREFIX=../../../../../techlibs/common
	else
		COMMON_PREFIX=/usr/local/share/yosys
	fi	
	iverilog -o testbench ../testbench.v ../../common.v synth.v $COMMON_PREFIX/simcells.v
	if [ $? != 0 ] ; then
	    echo FAIL > ${1}_${2}.status
	    touch .stamp
	    exit 0
	fi
fi

if [ "$2" = "falsify" ]; then
	if vvp -N testbench > testbench.log 2>&1; then
		echo FAIL > ${1}_${2}.status
	elif ! grep 'ERROR' testbench.log || grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
else
	#cases where some object names are/aren't expected in output file (tee -o result.log in the test script)
	cell_failed="0"
	if test -f "result.log"; then
		expected_string=""
		expected="1"

		if [ "$1" = "aigmap" ]; then
			expected_string="\$mux"
			expected="0"
		elif [ "$1" = "async2sync" ] ||\
			 [ "$1" = "clk2fflogic" ] ||\
			 [ "$1" = "clk2fflogic_latch" ] ||\
			 [ "$1" = "clk2fflogic_mem" ]; then
			expected_string="\$adff"
			expected="0"
		elif [ "$1" = "dff2dffe_unmap" ]; then
			expected_string="\$dffe"
			expected="0"
		elif [ "$1" = "flowmap" ] ||\
			 [ "$1" = "flowmap_latch" ] ||\
			 [ "$1" = "flowmap_mem" ]; then
			expected_string="cell \$lut \$auto\$flowmap"
		elif [ "$1" = "fsm" ] ||\
			 [ "$1" = "fsm_expand" ] ||\
			 [ "$1" = "fsm_export" ] ||\
			 [ "$1" = "fsm_opt" ] ||\
			 [ "$1" = "fsm_recode" ] ||\
			 [ "$1" = "fsm_unreach" ]; then
			expected_string="cell \$fsm"
		elif [ "$1" = "full_adder" ]; then
			expected_string="\$fa"
		elif [ "$1" = "ice40_dsp_mult" ] ||\
			 [ "$1" = "ice40_dsp_mult_acc" ]; then
			expected_string="SB_MAC16"
		elif [ "$1" = "ice40_dsp_mult_a_larger" ] ||\
			 [ "$1" = "ice40_dsp_mult_b_larger" ] ||\
			 [ "$1" = "ice40_dsp_mult_out_larger" ] ||\
			 [ "$1" = "ice40_dsp_mult_signed" ]; then
			expected_string="\$mul"
		elif [ "$1" = "inout_port_demote" ]; then
			expected_string="inout"
			expected="0"
		elif [ "$1" = "iopadmap" ]; then
			expected_string="IBUF \$auto\$iopadmap"
		elif [ "$1" = "macc" ]; then
			expected_string="cell \$macc"
			expected="0"
		elif [ "$1" = "memory" ]; then
			expected_string="cell \$mem "
			expected="0"
		elif [ "$1" = "muxcover" ] ||\
			 [ "$1" = "muxcover_mux8" ]; then
			expected_string="\$_MUX_"
			expected="0"
		elif [ "$1" = "nlutmap" ]; then
			expected_string="\$lut"
			expected="0"
		elif [ "$1" = "nlutmap_opt" ]; then
			expected_string="\$lut"
		elif [ "$1" = "opt_demorgan_reduce" ]; then
			expected_string="cell \$not \$auto\$opt_demorgan"
		elif [ "$1" = "reduce" ]; then
			expected_string="cell \$reduce_"
		elif [ "$1" = "tribuf" ]; then
			expected_string="cell \$tribuf"
		elif [ "$1" = "tribuf_logic" ]; then
			expected_string="cell \$tribuf"
			expected="0"
		elif [ "$1" = "zinit" ]; then
			expected_string="cell \$_NOT_ \$auto\$zinit"
		fi
		if test -f "result.log"; then
			if grep "$expected_string" result.log; then
				if [ $expected = "1" ]; then
					cell_failed="0"
				else
					cell_failed="1"
				fi
			else
				if [ $expected = "1" ]; then
					cell_failed="1"
				else
					cell_failed="0"
				fi
			fi
		fi
	fi

	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo FAIL > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo FAIL > ${1}_${2}.status
	elif [ $cell_failed = '1' ]; then
		echo FAIL > ${1}_${2}.status
	else
		echo PASS > ${1}_${2}.status
	fi
fi

touch .stamp
