OUTDIR := work_synth_xilinx_srl
YS := $(wildcard *.ys)
TARGETS := $(patsubst %.ys,$(OUTDIR)/%.status,$(YS))

.PHONY: all
all: $(TARGETS)
	echo ALL PASSED!

$(OUTDIR)/test%.status: test%.ys
	cd $(OUTDIR) && yosys -ql yosys$*.log ../$<
	iverilog -DTEST$* $(OUTDIR)/synth$*.v -o $(OUTDIR)/testbench$*  testbench.v top.v ../common.v ../../../../techlibs/common/simcells.v ../../../../techlibs/xilinx/cells_sim.v
	if ! vvp -N $(OUTDIR)/testbench$* > $(OUTDIR)/testbench$*.log 2>&1; then \
		grep 'ERROR' $(OUTDIR)/testbench$*.log; \
		echo fail > $@; \
	elif grep 'ERROR' $(OUTDIR)/testbench$*.log || ! grep 'OKAY' $(OUTDIR)/testbench$*.log; then \
		echo fail > $@; \
	else \
		echo pass > $@; \
	fi

$(OUTDIR)/test12.status:
	wget https://raw.githubusercontent.com/YosysHQ/yosys-bench/master/verilog/benchmarks_small/lfsr/generate.py -O lfsr_generate.py
	python3 lfsr_generate.py
	cd $(OUTDIR) && yosys -ql yosys12.log ../test12.ys
	iverilog -DTEST12 $(OUTDIR)/synth12.v -o $(OUTDIR)/testbench12  testbench.v top.v lfsr.v ../common.v ../../../../techlibs/common/simcells.v ../../../../techlibs/xilinx/cells_sim.v
	if ! vvp -N $(OUTDIR)/testbench12 > $(OUTDIR)/testbench12.log 2>&1; then \
		grep 'ERROR' $(OUTDIR)/testbench12.log; \
		echo fail > $(OUTDIR)/test12.status; \
	elif grep 'ERROR' $(OUTDIR)/testbench12.log || ! grep 'OKAY' $(OUTDIR)/testbench12.log; then \
		echo fail > $(OUTDIR)/test12.status; \
	else \
		echo pass > $(OUTDIR)/test12.status; \
	fi
