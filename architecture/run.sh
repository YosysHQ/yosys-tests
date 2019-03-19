#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2

run() {
    if ! vvp -N testbench > testbench.log 2>&1; then
    	grep 'ERROR' testbench.log
    	echo fail > ${1}_${2}.status
    elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
    	echo fail > ${1}_${2}.status
    else
    	echo pass > ${1}_${2}.status
    fi
}

if [ -f ../run.sh ]; then
    ../run.sh
fi
yosys -ql yosys.log ../../scripts/$2.ys
if [ "$1" = "synth_ecp5" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/ecp5/cells_sim.v
elif [ "$1" = "synth_achronix" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/achronix/speedster22i/cells_sim.v
elif [ "$1" = "synth_anlogic" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/anlogic/cells_sim.v
elif [ "$1" = "synth_anlogic_fulladder" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/anlogic/cells_sim.v
elif [ "$1" = "synth_coolrunner2" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/coolrunner2/cells_sim.v
elif [ "$1" = "synth_gowin" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/gowin/cells_sim.v
elif [ "$1" = "synth_ice40" ]; then
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
    iverilog -DTEST1 synth1.v -o testbench  ../testbench.v -I.. ../top.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/xilinx/cells_sim.v
    for i in {2..13}; do
        run
        iverilog -DTEST$i synth$i.v -o testbench  ../testbench.v -I.. ../top.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/xilinx/cells_sim.v
    done
elif [ "$1" = "synth_greenpak4" ]; then
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v ../../../../../techlibs/greenpak4/cells_sim_digital.v
else 
    iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v
fi

run

touch .stamp
