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

#read_blif
$(eval $(call template,read_blif,read_blif read_blif_attr read_blif_buf read_blif_cname read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_and_or,read_blif read_blif_attr read_blif_buf read_blif_cname read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_fsm,read_blif read_blif_attr read_blif_buf read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_logic,read_blif read_blif_attr read_blif_buf read_blif_cname read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_mem,read_blif read_blif_attr read_blif_buf read_blif_cname read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_mux,read_blif read_blif_attr read_blif_buf read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_pmux,read_blif read_blif_attr read_blif_buf read_blif_cname read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_tri,read_blif read_blif_attr read_blif_buf read_blif_conn read_blif_param read_blif_sop read_blif_wideports))
$(eval $(call template,read_blif_eblif,read_blif_eblif))

#read_ilang
$(eval $(call template,read_ilang,read_ilang read_ilang_selected))
$(eval $(call template,read_ilang_fsm,read_ilang read_ilang_selected))
$(eval $(call template,read_ilang_mem,read_ilang read_ilang_selected))
$(eval $(call template,read_ilang_mux,read_ilang read_ilang_selected))
$(eval $(call template,read_ilang_tri,read_ilang read_ilang_selected))

#read_json
$(eval $(call template,read_json,read_json))
$(eval $(call template,read_json_fsm,read_json))
$(eval $(call template,read_json_logic,read_json))
$(eval $(call template,read_json_mem,read_json_mem))
$(eval $(call template,read_json_mux,read_json))
$(eval $(call template,read_json_tri,read_json))

#read_liberty  read_liberty_lib
$(eval $(call template,read_liberty,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_arith,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_ff,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_ff_n,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_ff_np,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_ff_pn,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_ff_pp,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_latch,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_latch_n,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_diff_inv,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))
$(eval $(call template,read_liberty_tri,read_liberty read_liberty_nooverwrite read_liberty_ignore_miss_func read_liberty_ignore_miss_dir read_liberty_ignore_miss_data_latch read_liberty_setattr ))

#read_aiger
$(eval $(call template,read_aiger,read_aiger read_aiger_proc read_aiger_ascii read_aiger_module read_aiger_clk read_aiger_clk_module ))
$(eval $(call template,read_aiger_latch,read_aiger_aig))
$(eval $(call template,read_aiger_logic,read_aiger_aig))
$(eval $(call template,read_aiger_ff,read_aiger_aig))
$(eval $(call template,read_aiger_mult,read_aiger_aig))

#read
# read_vhdl87 read_vhdl93 read_vhdl2k read_vhdl2008 read_vhdl - ERROR: This version of Yosys is built without Verific support.
$(eval $(call template,read,read_vlog95 read_vlog2k read_sv2005 read_sv2009 read_sv2012 read_sv read_formal read_define read_define_value read_undef read_incdir read_noverific))

#read_verilog
$(eval $(call template,read_verilog,read_verilog read_verilog_assert_assumes read_verilog_assume_asserts read_verilog_debug read_verilog_defer read_verilog_dname read_verilog_dname_value read_verilog_dump_ast1 read_verilog_dump_ast2 read_verilog_dump_rtlil read_verilog_dump_vlog1 read_verilog_dump_vlog2 read_verilog_formal read_verilog_icells read_verilog_idir read_verilog_i_dir read_verilog_lib read_verilog_mem2reg read_verilog_noassert read_verilog_noassume read_verilog_noautowire read_verilog_nodpi read_verilog_no_dump_ptr read_verilog_nolatches read_verilog_nomem2reg read_verilog_nomeminit read_verilog_noopt read_verilog_nooverwrite read_verilog_nopp read_verilog_norestrict read_verilog_overwrite read_verilog_ppdump read_verilog_setattr read_verilog_sv read_verilog_yydebug ))

#verilog_defaults
$(eval $(call template,verilog_defaults,verilog_defaults verilog_defaults_push verilog_defaults_pop verilog_defaults_clear))

#verilog_defines
$(eval $(call template,verilog_defines,verilog_defines verilog_defines_val verilog_defines_u verilog_defines_d verilog_defines_u_val))

#verilog_lexer
$(eval $(call template,verilog_lexer_specify_specparam,verilog_lexer))
$(eval $(call template,verilog_lexer_package,verilog_lexer))
$(eval $(call template,verilog_lexer_interface_logic,verilog_lexer))
$(eval $(call template,verilog_lexer_casez,verilog_lexer))
$(eval $(call template,verilog_lexer_automatic_task,verilog_lexer))
$(eval $(call template,verilog_lexer_unique_priority,verilog_lexer))
$(eval $(call template,verilog_lexer_always_ff_latch,verilog_lexer))
$(eval $(call template,verilog_lexer_assert_assume_restrict,verilog_lexer_assert))
#../top.v:88: ERROR: syntax error, unexpected TOK_TYPEDEF
#$(eval $(call template,verilog_lexer_enum_typedef,verilog_lexer))
#../top.v:90: ERROR: syntax error, unexpected TOK_SUPPLY1
#$(eval $(call template,verilog_lexer_supply,verilog_lexer))

.PHONY: all clean
