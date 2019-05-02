#!/bin/bash

set -x
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

touch .start

if [ -f ../Makefile ]; then
    make -C ..
else
    yosys -ql yosys.log ../../scripts/$2.ys
fi
if [ $? != 0 ] ; then
    echo FAIL > ${1}_${2}.status
    touch .stamp
    exit 0
fi
if [ -f "../../../../../techlibs/common/simcells.v" ]; then
    COMMON_PREFIX=../../../../../techlibs/common
    TECHLIBS_PREFIX=../../../../../techlibs
else
    COMMON_PREFIX=/usr/local/share/yosys
    TECHLIBS_PREFIX=/usr/local/share/yosys
fi

if [ "$1" = "synth_ecp5" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ecp5/cells_sim.v
elif [ "$1" = "synth_ecp5_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ecp5/cells_sim.v
elif [ "$1" = "synth_achronix" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/achronix/speedster22i/cells_sim.v
elif [ "$1" = "synth_anlogic" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/anlogic/cells_sim.v
elif [ "$1" = "synth_anlogic_fulladder" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/anlogic/cells_sim.v
elif [ "$1" = "synth_anlogic_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/anlogic/cells_sim.v  $TECHLIBS_PREFIX/anlogic/eagle_bb.v
elif [ "$1" = "synth_coolrunner2" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/coolrunner2/cells_sim.v
elif [ "$1" = "synth_coolrunner2_fulladder" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/coolrunner2/cells_sim.v
elif [ "$1" = "synth_gowin" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/gowin/cells_sim.v
elif [ "$1" = "synth_gowin_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/gowin/cells_sim.v
elif [ "$1" = "synth_ice40" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ice40/cells_sim.v
elif [ "$1" = "synth_ice40_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ice40/cells_sim.v
elif [ "$1" = "synth_ice40_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/ice40/cells_sim.v
elif [ "$1" = "synth_intel" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/max10/cells_sim.v
elif [ "$1" = "synth_intel_a10gx" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/a10gx/cells_sim.v
elif [ "$1" = "synth_intel_cycloneiv" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/cycloneiv/cells_sim.v
elif [ "$1" = "synth_intel_cycloneive" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/cycloneive/cells_sim.v
elif [ "$1" = "synth_intel_cyclone10" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/cyclone10/cells_sim.v
elif [ "$1" = "synth_intel_cyclonev" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/intel/cyclonev/cells_sim.v
elif [ "$1" = "synth_sf2" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/sf2/cells_sim.v
elif [ "$1" = "synth_xilinx" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/xilinx/cells_sim.v
elif [ "$1" = "synth_xilinx_srl" ]; then
    if grep 'fail' *.status; then
	    echo fail > ${1}_${2}.status
    else
        echo pass > ${1}_${2}.status
    fi
    exit
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/xilinx/cells_sim.v
elif [ "$1" = "synth_greenpak4" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/greenpak4/cells_sim_digital.v
elif [ "$1" = "synth_greenpak4_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v $TECHLIBS_PREFIX/greenpak4/cells_sim_digital.v
else
    iverilog -o testbench  ../testbench.v synth.v ../../common.v $COMMON_PREFIX/simcells.v
fi
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

touch .stamp
