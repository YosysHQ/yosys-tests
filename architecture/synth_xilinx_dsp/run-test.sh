#!/bin/bash
set -e

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

#wget https://raw.githubusercontent.com/YosysHQ/yosys-bench/master/verilog/benchmarks_small/mul/generate.py -O generate_mul.py -o /dev/null

EXTRA_FLAGS="\
    -p 'design -copy-to __test __test; \
        synth_xilinx; \
        design -copy-from __test *; \
        select -assert-any __test; \
        script -scriptwire __test/w:assert_area'\
    -l ../../../../../techlibs/xilinx/cells_sim.v"

cp ../*.v .
${MAKE:-make} -f ../../../../tools/autotest.mk $seed *.v EXTRA_FLAGS="$EXTRA_FLAGS"

cp ~/yosys/yosys-bench/verilog/benchmarks_small/mul/common.py common_mul.py
cp ~/yosys/yosys-bench/verilog/benchmarks_small/macc/common.py common_macc.py
cp ~/yosys/yosys-bench/verilog/benchmarks_small/muladd/common.py common_muladd.py
PYTHONPATH=".:$PYTHONPATH" python3 ../generate_mul.py
PYTHONPATH=".:$PYTHONPATH" python3 ../generate_macc.py
PYTHONPATH=".:$PYTHONPATH" python3 ../generate_muladd.py
python3 ../assert_area.py

${MAKE:-make} -f ../../../../tools/autotest.mk $seed mul_*.v EXTRA_FLAGS="$EXTRA_FLAGS"
${MAKE:-make} -f ../../../../tools/autotest.mk $seed macc_*.v EXTRA_FLAGS="$EXTRA_FLAGS"
${MAKE:-make} -f ../../../../tools/autotest.mk $seed muladd_*.v EXTRA_FLAGS="$EXTRA_FLAGS"
