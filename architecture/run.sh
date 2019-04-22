#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

if [ -f ../Makefile ]; then
    make -C ..
else
    yosys -ql yosys.log ../../scripts/$2.ys
fi
if [ "$1" = "synth_ecp5" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ecp5/cells_sim.v
elif [ "$1" = "synth_ecp5_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ecp5/cells_sim.v
elif [ "$1" = "synth_achronix" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/achronix/speedster22i/cells_sim.v
elif [ "$1" = "synth_anlogic" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/anlogic/cells_sim.v
elif [ "$1" = "synth_anlogic_fulladder" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/anlogic/cells_sim.v
elif [ "$1" = "synth_anlogic_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/anlogic/cells_sim.v  ../../../../../techlibs/anlogic/eagle_bb.v
elif [ "$1" = "synth_coolrunner2" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/coolrunner2/cells_sim.v
elif [ "$1" = "synth_coolrunner2_fulladder" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/coolrunner2/cells_sim.v
elif [ "$1" = "synth_gowin" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/gowin/cells_sim.v
elif [ "$1" = "synth_gowin_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/gowin/cells_sim.v
elif [ "$1" = "synth_ice40" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ice40/cells_sim.v
elif [ "$1" = "synth_ice40_mem" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ice40/cells_sim.v
elif [ "$1" = "synth_ice40_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ice40/cells_sim.v
elif [ "$1" = "synth_intel" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/max10/cells_sim.v
elif [ "$1" = "synth_intel_a10gx" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/a10gx/cells_sim.v
elif [ "$1" = "synth_intel_cycloneiv" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/cycloneiv/cells_sim.v
elif [ "$1" = "synth_intel_cycloneive" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/cycloneive/cells_sim.v
elif [ "$1" = "synth_intel_cyclone10" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/cyclone10/cells_sim.v
elif [ "$1" = "synth_intel_cyclonev" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/intel/cyclonev/cells_sim.v
elif [ "$1" = "synth_sf2" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/sf2/cells_sim.v
elif [ "$1" = "synth_xilinx" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/xilinx/cells_sim.v
elif [ "$1" = "synth_xilinx_srl" ]; then
    if grep 'fail' *.status; then
	    echo fail > ${1}_${2}.status
    else
        echo pass > ${1}_${2}.status
    fi
    exit
elif [ "$1" = "synth_greenpak4" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/greenpak4/cells_sim_digital.v
elif [ "$1" = "synth_greenpak4_wide_ffs" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/greenpak4/cells_sim_digital.v
else
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v
fi

if ! vvp -N testbench > testbench.log 2>&1; then
	grep 'ERROR' testbench.log
	echo fail > ${1}_${2}.status
elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
	echo fail > ${1}_${2}.status
else
	echo pass > ${1}_${2}.status
fi

touch .stamp
