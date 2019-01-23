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
$(eval $(call template,read_json_mem,read_json))
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
.PHONY: all clean
