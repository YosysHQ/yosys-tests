all: work
	touch .stamp

clean::
	rm -f .stamp

define template
$(foreach design,$(1),
$(foreach script,verify falsify $(2),
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

#attrmap
$(eval $(call template,attrmap,attrmap attrmap_modattr))

#dff2dffe -unmap
# dff2dffe_unmap_direct - skipped: ERROR: Found error in internal cell \dffe.$procdff$47 ($dffe) at
$(eval $(call template,dff2dffe_unmap,dff2dffe_unmap dff2dffe_unmap_mince))

#dff2dffs
$(eval $(call template,dff2dffs,dff2dffs))

#extract
$(eval $(call template,extract,extract_cell_attr extract_compat extract_constports extract_map_design extract_ignore_parameters extract_ignore_param  extract_map extract_mine_cells_span extract_mine_limit_matches_per_module extract_mine_max_fanout extract_mine_min_freq extract_mine_split extract_mine extract_nodefaultswaps extract_perm extract_swap extract_verbose extract_wire_attr ))

#extract_counter
$(eval $(call template,extract_counter,extract_counter extract_counter_maxwidth extract_counter_pout))
$(eval $(call template,extract_counter_down,extract_counter extract_counter_maxwidth extract_counter_pout))
$(eval $(call template,extract_counter_negative_reset,extract_counter extract_counter_maxwidth extract_counter_pout))
$(eval $(call template,extract_counter_no_reset,extract_counter extract_counter_maxwidth extract_counter_pout))
$(eval $(call template,extract_counter_sync_reset,extract_counter extract_counter_maxwidth extract_counter_pout))

#shregmap
$(eval $(call template,shregmap,shregmap shregmap_clkpol_any shregmap_clkpol_neg shregmap_clkpol_pos shregmap_enpol_any shregmap_enpol_any_or_none shregmap_enpol_neg shregmap_enpol_none shregmap_enpol_pos shregmap_init shregmap_keep_after shregmap_keep_before shregmap_match shregmap_maxlen shregmap_minlen shregmap_params shregmap_tech shregmap_zinit))
$(eval $(call template,shregmap_resetable,shregmap shregmap_clkpol_any shregmap_clkpol_neg shregmap_clkpol_pos shregmap_enpol_any shregmap_enpol_any_or_none shregmap_enpol_neg shregmap_enpol_none shregmap_enpol_pos shregmap_init shregmap_keep_after shregmap_keep_before shregmap_match shregmap_maxlen shregmap_minlen shregmap_params shregmap_tech shregmap_zinit))

#design_import
$(eval $(call template,design_import, design_import design_import_as ))

#async2sync
$(eval $(call template,async2sync,async2sync))

#flowmap
$(eval $(call template,flowmap,flowmap flowmap_cells flowmap_debug_relax flowmap_debug flowmap_maxlut flowmap_minlut flowmap_optarea flowmap_r_alpha flowmap_r_beta flowmap_r_gamma flowmap_relax flowmap_relax_debug flowmap_relax_debug_relax flowmap_top))
$(eval $(call template,flowmap_latch,flowmap flowmap_cells flowmap_debug_relax flowmap_debug flowmap_maxlut flowmap_minlut flowmap_optarea flowmap_r_alpha flowmap_r_beta flowmap_r_gamma flowmap_relax  flowmap_relax_debug flowmap_relax_debug_relax flowmap_top))
$(eval $(call template,flowmap_mem,flowmap flowmap_cells flowmap_debug_relax flowmap_debug flowmap_maxlut flowmap_minlut flowmap_optarea flowmap_r_alpha flowmap_r_beta flowmap_r_gamma flowmap_relax flowmap_relax_debug flowmap_relax_debug_relax flowmap_top))


.PHONY: all clean
