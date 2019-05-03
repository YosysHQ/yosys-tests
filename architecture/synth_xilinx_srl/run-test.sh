#!/bin/bash

OPTIND=1
seed=""    # default to no seed specified
while getopts "S:" opt
do
    case "$opt" in
	S) arg="${OPTARG#"${OPTARG%%[![:space:]]*}"}" # remove leading space
	   seed="SEED=$arg" ;;
    esac
done
shift "$((OPTIND-1))"

# check for Icarus Verilog
if ! which iverilog > /dev/null ; then
  echo "$0: Error: Icarus Verilog 'iverilog' not found."
  exit 1
fi

wget https://raw.githubusercontent.com/YosysHQ/yosys-bench/master/verilog/benchmarks_small/lfsr/generate.py -O generate_lfsr.py -o /dev/null
python3 generate_lfsr.py
python3 generate.py
${MAKE:-make} -f ../../../tools/autotest.mk $seed *.v EXTRA_FLAGS="-f 'verilog -noblackbox -icells' -p 'synth_xilinx' -l ../../../../techlibs/xilinx/cells_sim.v"
