#!/bin/bash
set -e

cp ~/yosys/yosys-bench/verilog/benchmarks_small/mul/generate.py generate_mul.py
PYTHONPATH=".:$PYTHONPATH" python3 generate_mul.py
PYTHONPATH=".:$PYTHONPATH" python3 ../create_miter.py
${MAKE:-make} -f ../../../common/syn.mk YOSYS=../../../../yosys SYN_COMMAND=synth_xilinx mul*.v
${VERILATOR:-verilator} -Wno-unoptflat -Wno-lint -Wno-combdly -CFLAGS "-O3 -march=native" -o ../mul_tb -cc --top-module top --exe *.v ../../../../techlibs/xilinx/cells_sim.v ../../../common/verilator/miter_testbench.cc
${MAKE:-make} -C obj_dir -f Vtop.mk
./mul_tb
