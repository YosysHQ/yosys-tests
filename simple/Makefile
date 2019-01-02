all: work
	touch .stamp

clean::
	rm -f .stamp

define template
$(foreach design,$(1),
$(foreach script,$(2),
work:: $(design)/work_$(script)/.stamp

$(design)/work_$(script)/.stamp:
	bash run.sh $(design) $(script)

clean::
	rm -rf $(design)/work_$(script)
))
endef

$(eval $(call template,alu,gates luts))

# DFF with constant drivers
$(eval $(call template,dff_d0, dff))
$(eval $(call template,dffr, dff))
$(eval $(call template,dffc, dff))
$(eval $(call template,dffcp, dff))
$(eval $(call template,dffsr, dff))

# Tri-state buffers general use
$(eval $(call template,tristate, tristate))
$(eval $(call template,tristate_case, tristate))
$(eval $(call template,tristate_if, tristate))
$(eval $(call template,tristate_proc_asmt, tristate))

# Tri-state buffers with constant
$(eval $(call template,tristate_const_0, tristate))
$(eval $(call template,tristate_const_1, tristate))
$(eval $(call template,tristate_const_data, tristate))

# Demoting I/O port
$(eval $(call template,inout_port, tristate))
$(eval $(call template,inout_port_demote, tristate))

# MACC cells
$(eval $(call template,macc, macc))

#FSM with unreachable state
$(eval $(call template,fsm_unreach, fsm))
# Optimization of FSM when signal connected to input/input and output
$(eval $(call template,fsm, fsm))
$(eval $(call template,fsm_opt, fsm))

#Extract full and half adders
$(eval $(call template,full_adder,full_adder half_adder))

#Extract reduce
$(eval $(call template,reduce,reduce reduce_allow_off_chain))

#nlutmap
$(eval $(call template,nlutmap,nlutmap nlutmap_luts nlutmap_assert))

#zinit
$(eval $(call template,zinit,zinit zinit_singleton))

#clk2fflogic (104 - 144,180-195 is not reached)
$(eval $(call template,clk2fflogic,clk2fflogic))
$(eval $(call template,clk2fflogic_latch,clk2fflogic))
$(eval $(call template,clk2fflogic_mem,clk2fflogic_mem))
# ??? one loop isn't reached  $(eval $(call template,clk2fflogic_mem2,clk2fflogic_mem))

#muxcover
$(eval $(call template,muxcover,muxcover muxcover_nodecode muxcover_mux4 muxcover_mux4_nodecode muxcover_mux8 muxcover_mux8_nodecode muxcover_mux16 muxcover_mux16_nodecode muxcover_4_8_16_nodecode))

#aigmap
$(eval $(call template,aigmap,aigmap aigmap_nand))

#memory_memx, memory_nordff(75-101 not covered), memory_unpack(91-108 not covered)
$(eval $(call template,memory,memory_memx memory_nordff memory_unpack))

#uniquify
$(eval $(call template,uniquify,uniquify))

#hierarchy (44% increased to 61,3%)
$(eval $(call template,hierarchy,hierarchy hierarchy_top hierarchy_check hierarchy_simcheck hierarchy_purge_lib hierarchy_libdir hierarchy_keep_positionals hierarchy_keep_portwidths hierarchy_nokeep_asserts hierarchy_auto_top hierarchy_generate))

.PHONY: all clean
