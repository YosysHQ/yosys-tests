VERILATOR=verilator
CFLAGS="-O3"

all: example_tb

example_tb: example/top.v miter_testbench.cc
	$(VERILATOR) -O3 -CFLAGS $(CFLAGS) -o ../$@ -cc --exe $^
	$(MAKE) -C obj_dir -f Vtop.mk
