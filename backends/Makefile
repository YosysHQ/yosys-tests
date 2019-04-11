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

#write_aiger
$(eval $(call template,write_aiger,write_aiger write_aiger_ascii write_aiger_zinit write_aiger_miter write_aiger_symbols write_aiger_map write_aiger_vmap write_aiger_I write_aiger_O write_aiger_B ))

#write_blif
$(eval $(call template,write_blif,write_blif write_blif_top write_blif_buf write_blif_unbuf write_blif_true  write_blif_false  write_blif_undef  write_blif_noalias  write_blif_icells  write_blif_gates  write_blif_conn  write_blif_attr  write_blif_param  write_blif_cname  write_blif_iname  write_blif_iattr  write_blif_blackbox  write_blif_impltf))

#write_btor
$(eval $(call template,write_btor,write_btor write_btor_v write_btor_s))
$(eval $(call template,write_btor_shift,write_btor write_btor_v write_btor_s))
$(eval $(call template,write_btor_div_mod,write_btor write_btor_v write_btor_s))
$(eval $(call template,write_btor_fsm,write_btor write_btor_v write_btor_s))
$(eval $(call template,write_btor_logic,write_btor write_btor_v write_btor_s))
$(eval $(call template,write_btor_mem,write_btor_mem write_btor_mem_v write_btor_mem_s))
$(eval $(call template,write_btor_pmux,write_btor_pmux))
$(eval $(call template,write_btor_and_or,write_btor_and_or))

#write_edif
$(eval $(call template,write_edif,write_edif write_edif_top write_edif_nogndvcc write_edif_pvector_par write_edif_pvector_bra write_edif_pvector_ang write_edif_attrprop ))

#write_firrtl
$(eval $(call template,write_firrtl,write_firrtl ))
# - issue #922
#ERROR: Unclocked write port 0 on memory top.ram.
#$(eval $(call template,write_firrtl_mem,write_firrtl_mem ))

#write_ilang
$(eval $(call template,write_ilang,write_ilang write_ilang_selected))
$(eval $(call template,write_ilang_mem,write_ilang write_ilang_selected))
$(eval $(call template,write_ilang_mux,write_ilang write_ilang_selected))
$(eval $(call template,write_ilang_fsm,write_ilang write_ilang_selected))
$(eval $(call template,write_ilang_tri,write_ilang write_ilang_selected))

#write_intersynth
$(eval $(call template,write_intersynth,write_intersynth write_intersynth_selected write_intersynth_lib write_intersynth_notypes))

#write_json
$(eval $(call template,write_json,write_json write_json_aig json json_o json_o_aig json_aig))

#write_simplec
$(eval $(call template,write_simplec,write_simplec write_simplec_cmos3 write_simplec_cmos4 write_simplec_verbose write_simplec_i8 write_simplec_i16 write_simplec_i32 write_simplec_i64))
$(eval $(call template,write_simplec_mux,write_simplec write_simplec_cmos3 write_simplec_cmos4 write_simplec_verbose write_simplec_i8 write_simplec_i16 write_simplec_i32 write_simplec_i64))
$(eval $(call template,write_simplec_logic,write_simplec write_simplec_cmos3 write_simplec_cmos4 write_simplec_verbose write_simplec_i8 write_simplec_i16 write_simplec_i32 write_simplec_i64))

#write_smt2
$(eval $(call template,write_smt2,write_smt2 write_smt2_synth write_smt2_verbose write_smt2_stbv write_smt2_stdt write_smt2_nomem write_smt2_wires write_smt2_tpl write_smt2_bv write_smt2_mem write_smt2_nobv))
$(eval $(call template,write_smt2_logic,write_smt2 write_smt2_synth write_smt2_verbose write_smt2_stbv write_smt2_stdt write_smt2_nomem write_smt2_wires write_smt2_tpl write_smt2_bv write_smt2_mem write_smt2_nobv))
$(eval $(call template,write_smt2_mem,write_smt2 write_smt2_verbose write_smt2_stbv write_smt2_stdt write_smt2_nomem write_smt2_wires write_smt2_tpl write_smt2_bv write_smt2_mem write_smt2_mem_memtest write_smt2_memtest write_smt2_stbv_memtest))
$(eval $(call template,write_smt2_fsm,write_smt2 write_smt2_synth write_smt2_verbose write_smt2_stbv write_smt2_stdt write_smt2_nomem write_smt2_wires write_smt2_tpl write_smt2_bv write_smt2_mem write_smt2_nobv))
$(eval $(call template,write_smt2_init_assert,write_smt2_init_assert))
$(eval $(call template,write_smt2_reduce,write_smt2 write_smt2_synth write_smt2_verbose write_smt2_stbv write_smt2_stdt write_smt2_nomem write_smt2_wires write_smt2_tpl write_smt2_bv write_smt2_mem write_smt2_nobv))

#write_smv
$(eval $(call template,write_smv,write_smv write_smv_synth write_smv_noproc write_smv_verbose write_smv_tpl))
$(eval $(call template,write_smv_wide,write_smv write_smv_synth write_smv_noproc write_smv_verbose write_smv_tpl))
$(eval $(call template,write_smv_shift,write_smv write_smv_synth write_smv_noproc write_smv_verbose write_smv_tpl))
$(eval $(call template,write_smv_fsm,write_smv write_smv_noproc write_smv_verbose write_smv_tpl))
$(eval $(call template,write_smv_reduce,write_smv_noproc))
$(eval $(call template,write_smv_logic,write_smv write_smv_synth write_smv_noproc write_smv_verbose write_smv_tpl))
$(eval $(call template,write_smv_init_assert,write_smv_init_assert))
$(eval $(call template,write_smv_cmos4,write_smv_cmos4))

#write_spice
$(eval $(call template,write_spice,write_spice write_spice_top write_spice_big_endian write_spice_neg_i write_spice_pos_i write_spice_nc_prefix write_spice_inames ))

#write_table
$(eval $(call template,write_table,write_table ))

#write_verilog
$(eval $(call template,write_verilog,write_verilog write_verilog_nostr write_verilog_siminit write_verilog_v ))
$(eval $(call template,write_verilog_tri,write_verilog write_verilog_nostr write_verilog_siminit write_verilog_v ))
$(eval $(call template,write_verilog_ffs,write_verilog write_verilog_nostr write_verilog_siminit write_verilog_v ))
$(eval $(call template,write_verilog_latch,write_verilog write_verilog_nostr write_verilog_siminit write_verilog_v ))
$(eval $(call template,write_verilog_concat,write_verilog write_verilog_nostr write_verilog_siminit write_verilog_v ))



.PHONY: all clean
