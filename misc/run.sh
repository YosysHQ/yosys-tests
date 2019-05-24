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


#cases where some object names are/aren't expected in output file (tee -o result.log in the test script)
cell_failed="0"
expected_string=""
expected="1"

if   [ "$2" = "add" ]; then
	expected_string="wire width 0 \\\w"
elif [ "$2" = "add_global_input" ]; then
	expected_string="wire width 32000 input 6 \\\gi"
elif [ "$2" = "add_input" ]; then
	expected_string="wire width 2 input 6 \\\i"
elif [ "$2" = "add_output" ]; then
	expected_string="wire width 3 output 6 \\\o"
elif [ "$2" = "add_inout" ]; then
	expected_string="wire width 3 inout 6 \\\34"
elif [ "$2" = "add_wire" ]; then
	expected_string="wire \\\w"
elif [ "$2" = "assertpmux" ]; then
	expected_string="cell \$assert"
elif [ "$2" = "assertpmux_always" ]; then
	expected_string="cell \$assert"
elif [ "$2" = "assertpmux_noinit" ]; then
	expected_string="cell \$assert"
elif [ "$1" = "blackbox" ]; then
	expected_string="attribute \\\blackbox 1"
elif [ "$2" = "chformal" ]; then
	expected_string="cell \$assert"
	expected="0"
elif [ "$2" = "chformal_assert" ]; then
	expected_string="cell \$assert"
	expected="0"
elif [ "$2" = "chformal_assert2assume" ]; then
	expected_string="cell \$assert"
	expected="0"
elif [ "$2" = "chformal_assume" ]; then
	expected_string="cell \$assume"
	expected="0"
elif [ "$2" = "chformal_assume2assert" ]; then
	expected_string="cell \$assume"
	expected="0"
elif [ "$2" = "chformal_fair" ]; then
	expected_string="cell \$fair"
	expected="0"
elif [ "$2" = "chformal_fair2live" ]; then
	expected_string="cell \$fair"
	expected="0"
elif [ "$2" = "chformal_fair2live_assert2assume" ]; then
	expected_string="cell \$fair"
	expected="0"
elif [ "$2" = "chformal_live" ]; then
	expected_string="cell \$live"
	expected="0"
elif [ "$2" = "chformal_live2fair" ]; then
	expected_string="cell \$live"
	expected="0"
elif [ "$2" = "delete" ]; then
	expected_string="module \\\middle"
	expected="0"
elif [ "$2" = "delete_proc" ]; then
	expected_string="process \$proc\$../top.v:13\$1"
	expected="0"
elif [ "$2" = "delete_input" ]; then
	expected_string="wire input 1 \\\x"
	expected="0"
elif [ "$2" = "delete_output" ]; then
	expected_string="wire output 3 \\\o"
	expected="0"
elif [ "$2" = "delete_port" ]; then
	expected_string="wire output 4 \\\A"
	expected="0"
elif [ "$2" = "delete_cell" ]; then
	expected_string="cell \$mux \$ternary\$../top.v:16\$2"
	expected="0"
elif [ "$2" = "delete_wire" ]; then
	expected_string="wire \\\o"
	expected="0"
elif [ "$2" = "delete_mem" ]; then
	expected_string="cell \$memrd \$memrd\$\ram\$../top.v:30\$7"
	expected="0"
elif [ "$2" = "edgetypes" ]; then
	expected_string="\$add"
elif [ "$1" = "fmcombine" ]; then
	expected_string="Combining cells "
elif [ "$1" = "insbuf" ]; then
	expected_string="cell \$_BUF_ \$auto\$insbuf"
elif [ "$1" = "ltp" ]; then
	expected_string="Longest topological path in"
elif [ "$1" = "mutate" ]; then
	if [ "$2" = "mutate_all" ] || \
	   [ "$2" = "mutate_cnot0" ] || \
	   [ "$2" = "mutate_cnot1" ] || \
	   [ "$2" = "mutate_const0" ] || \
	   [ "$2" = "mutate_const1" ] || \
	   [ "$2" = "mutate_inv" ]; then
	expected_string="\$auto\$mutate"
	fi
elif [ "$1" = "mutate_mem" ]; then
	if [ "$2" = "mutate_all" ]; then
	expected_string="\$auto\$mutate"
	fi
elif [ "$2" = "pmuxtree" ]; then
	expected_string="cell \$pmux"
	expected="0"
elif [ "$1" = "qwp" ]; then
	expected_string="attribute \\\qwp_position"
elif [ "$2" = "rename" ]; then
	expected_string="module \\\mid_module"
elif [ "$2" = "rename_low" ]; then
	expected_string="module \\\newlow"
elif [ "$2" = "rename_top" ]; then
	expected_string="module \\\new_top"
elif [ "$2" = "rmports" ]; then
	expected_string="wire output 5 \\\cout"
	expected="0"
elif [ "$2" = "scatter" ]; then
	expected_string="\$auto\$scatter"
elif [ "$1" = "scc" ] || \
	 [ "$1" = "scc_hier_feedback" ]; then
	expected_string="0 SCCs"
elif [ "$1" = "scc_feedback" ]; then
	expected_string="0 SCCs"
	expected="0"
elif [ "$1" = "setattr" ] || \
	 [ "$1" = "setattr_mem" ]; then
	if [ "$2" = "setattr" ] || \
	   [ "$2" = "setattr_top" ] || \
	   [ "$2" = "setattr_unset" ]; then
	expected_string="attribute \\\u 1"
	expected="0"
	else
	expected_string="attribute \\\u 1"
	fi
elif [ "$1" = "sim" ] || \
	 [ "$1" = "sim_mem" ]; then
	if [ "$2" != "sim_d" ]; then
	expected_string="Simulating cycle"
	fi
elif [ "$1" = "splice" ]; then
	expected_string="\$auto\$splice"
elif [ "$1" = "splitnets" ]; then
	if [ "$2" = "splitnets_dpf" ] || \
	   [ "$2" = "splitnets_driver" ]; then
	expected_string="wire width 8 \$memwr"
	else
	expected_string="wire width 8 \$memwr"
	expected="0"
	fi
elif [ "$1" = "stat" ]; then
	expected_string="middle                          1"
elif [ "$1" = "supercover" ]; then
	expected_string="cell \$cover \$auto\$supercover"
fi

if [ "$expected_string" != "" ]; then
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

if grep 'Assert' result.log || grep 'failed in' result.log || grep 'ERROR' result.log; then
	echo FAIL > ${1}_${2}.status
elif [ $cell_failed = '1' ]; then
	echo FAIL > ${1}_${2}.status
else
	echo PASS > ${1}_${2}.status
fi

touch .stamp
