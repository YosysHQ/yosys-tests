%.v: FORCE
	$(YOSYS) -p "$(SYN_COMMAND); rename $* $*_syn; write_verilog -norename postsyn_$*.v" $@

FORCE: