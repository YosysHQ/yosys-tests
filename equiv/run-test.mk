all:: equiv_add/work_equiv_add_cant_find_gate_cell_fail/.stamp
equiv_add/work_equiv_add_cant_find_gate_cell_fail/.stamp:
	@echo 'Skipping disabled test equiv_add..'
all:: equiv_add/work_equiv_add_try/.stamp
equiv_add/work_equiv_add_try/.stamp:
	@echo 'Running equiv_add_try..'
	@../run.sh equiv_add equiv_add_try
clean::
	@echo 'Cleaning equiv_add_try..'
	@rm -rf equiv_add/work_equiv_add_try
all:: equiv_add/work_equiv_add/.stamp
equiv_add/work_equiv_add/.stamp:
	@echo 'Running equiv_add..'
	@../run.sh equiv_add equiv_add
clean::
	@echo 'Cleaning equiv_add..'
	@rm -rf equiv_add/work_equiv_add
all:: equiv_add/work_equiv_add_invalid_number_of_args_fail/.stamp
equiv_add/work_equiv_add_invalid_number_of_args_fail/.stamp:
	@echo 'Skipping disabled test equiv_add..'
all:: equiv_add/work_equiv_add_cant_find_gold_cell_fail/.stamp
equiv_add/work_equiv_add_cant_find_gold_cell_fail/.stamp:
	@echo 'Skipping disabled test equiv_add..'
all:: equiv_add/work_equiv_add_module_context_fail/.stamp
equiv_add/work_equiv_add_module_context_fail/.stamp:
	@echo 'Running equiv_add_module_context_fail..'
	@../run.sh equiv_add equiv_add_module_context_fail
clean::
	@echo 'Cleaning equiv_add_module_context_fail..'
	@rm -rf equiv_add/work_equiv_add_module_context_fail
all:: equiv_induct/work_equiv_induct_undef/.stamp
equiv_induct/work_equiv_induct_undef/.stamp:
	@echo 'Running equiv_induct_undef..'
	@../run.sh equiv_induct equiv_induct_undef
clean::
	@echo 'Cleaning equiv_induct_undef..'
	@rm -rf equiv_induct/work_equiv_induct_undef
all:: equiv_induct/work_equiv_induct_seq/.stamp
equiv_induct/work_equiv_induct_seq/.stamp:
	@echo 'Running equiv_induct_seq..'
	@../run.sh equiv_induct equiv_induct_seq
clean::
	@echo 'Cleaning equiv_induct_seq..'
	@rm -rf equiv_induct/work_equiv_induct_seq
all:: equiv_induct/work_equiv_induct/.stamp
equiv_induct/work_equiv_induct/.stamp:
	@echo 'Running equiv_induct..'
	@../run.sh equiv_induct equiv_induct
clean::
	@echo 'Cleaning equiv_induct..'
	@rm -rf equiv_induct/work_equiv_induct
all:: equiv_make/work_equiv_make_cant_open_encfile_fail/.stamp
equiv_make/work_equiv_make_cant_open_encfile_fail/.stamp:
	@echo 'Running equiv_make_cant_open_encfile_fail..'
	@../run.sh equiv_make equiv_make_cant_open_encfile_fail
clean::
	@echo 'Cleaning equiv_make_cant_open_encfile_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_open_encfile_fail
all:: equiv_make/work_equiv_make_synth_error_fail/.stamp
equiv_make/work_equiv_make_synth_error_fail/.stamp:
	@echo 'Running equiv_make_synth_error_fail..'
	@../run.sh equiv_make equiv_make_synth_error_fail
clean::
	@echo 'Cleaning equiv_make_synth_error_fail..'
	@rm -rf equiv_make/work_equiv_make_synth_error_fail
all:: equiv_make/work_equiv_make_cant_find_gate_mod_fail/.stamp
equiv_make/work_equiv_make_cant_find_gate_mod_fail/.stamp:
	@echo 'Running equiv_make_cant_find_gate_mod_fail..'
	@../run.sh equiv_make equiv_make_cant_find_gate_mod_fail
clean::
	@echo 'Cleaning equiv_make_cant_find_gate_mod_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_find_gate_mod_fail
all:: equiv_make/work_equiv_make/.stamp
equiv_make/work_equiv_make/.stamp:
	@echo 'Running equiv_make..'
	@../run.sh equiv_make equiv_make
clean::
	@echo 'Cleaning equiv_make..'
	@rm -rf equiv_make/work_equiv_make
all:: equiv_make/work_equiv_make_invalid_num_of_args_fail/.stamp
equiv_make/work_equiv_make_invalid_num_of_args_fail/.stamp:
	@echo 'Running equiv_make_invalid_num_of_args_fail..'
	@../run.sh equiv_make equiv_make_invalid_num_of_args_fail
clean::
	@echo 'Cleaning equiv_make_invalid_num_of_args_fail..'
	@rm -rf equiv_make/work_equiv_make_invalid_num_of_args_fail
all:: equiv_make/work_equiv_make_redefenition_of_signal_fail/.stamp
equiv_make/work_equiv_make_redefenition_of_signal_fail/.stamp:
	@echo 'Running equiv_make_redefenition_of_signal_fail..'
	@../run.sh equiv_make equiv_make_redefenition_of_signal_fail
clean::
	@echo 'Cleaning equiv_make_redefenition_of_signal_fail..'
	@rm -rf equiv_make/work_equiv_make_redefenition_of_signal_fail
all:: equiv_make/work_equiv_make_inames/.stamp
equiv_make/work_equiv_make_inames/.stamp:
	@echo 'Running equiv_make_inames..'
	@../run.sh equiv_make equiv_make_inames
clean::
	@echo 'Cleaning equiv_make_inames..'
	@rm -rf equiv_make/work_equiv_make_inames
all:: equiv_make/work_equiv_make_cant_open_blacklist_fail/.stamp
equiv_make/work_equiv_make_cant_open_blacklist_fail/.stamp:
	@echo 'Running equiv_make_cant_open_blacklist_fail..'
	@../run.sh equiv_make equiv_make_cant_open_blacklist_fail
clean::
	@echo 'Cleaning equiv_make_cant_open_blacklist_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_open_blacklist_fail
all:: equiv_make/work_equiv_make_gold_mod_contains_proc_fail/.stamp
equiv_make/work_equiv_make_gold_mod_contains_proc_fail/.stamp:
	@echo 'Running equiv_make_gold_mod_contains_proc_fail..'
	@../run.sh equiv_make equiv_make_gold_mod_contains_proc_fail
clean::
	@echo 'Cleaning equiv_make_gold_mod_contains_proc_fail..'
	@rm -rf equiv_make/work_equiv_make_gold_mod_contains_proc_fail
all:: equiv_make/work_equiv_make_gate_mod_contains_proc_fail/.stamp
equiv_make/work_equiv_make_gate_mod_contains_proc_fail/.stamp:
	@echo 'Running equiv_make_gate_mod_contains_proc_fail..'
	@../run.sh equiv_make equiv_make_gate_mod_contains_proc_fail
clean::
	@echo 'Cleaning equiv_make_gate_mod_contains_proc_fail..'
	@rm -rf equiv_make/work_equiv_make_gate_mod_contains_proc_fail
all:: equiv_make/work_equiv_make_encfile/.stamp
equiv_make/work_equiv_make_encfile/.stamp:
	@echo 'Running equiv_make_encfile..'
	@../run.sh equiv_make equiv_make_encfile
clean::
	@echo 'Cleaning equiv_make_encfile..'
	@rm -rf equiv_make/work_equiv_make_encfile
all:: equiv_make/work_equiv_make_cant_match_fail/.stamp
equiv_make/work_equiv_make_cant_match_fail/.stamp:
	@echo 'Running equiv_make_cant_match_fail..'
	@../run.sh equiv_make equiv_make_cant_match_fail
clean::
	@echo 'Cleaning equiv_make_cant_match_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_match_fail
all:: equiv_make/work_equiv_make_blacklist/.stamp
equiv_make/work_equiv_make_blacklist/.stamp:
	@echo 'Running equiv_make_blacklist..'
	@../run.sh equiv_make equiv_make_blacklist
clean::
	@echo 'Cleaning equiv_make_blacklist..'
	@rm -rf equiv_make/work_equiv_make_blacklist
all:: equiv_make/work_equiv_make_encfile_fsm/.stamp
equiv_make/work_equiv_make_encfile_fsm/.stamp:
	@echo 'Running equiv_make_encfile_fsm..'
	@../run.sh equiv_make equiv_make_encfile_fsm
clean::
	@echo 'Cleaning equiv_make_encfile_fsm..'
	@rm -rf equiv_make/work_equiv_make_encfile_fsm
all:: equiv_make/work_equiv_make_cant_match_gold_to_gate_fail/.stamp
equiv_make/work_equiv_make_cant_match_gold_to_gate_fail/.stamp:
	@echo 'Running equiv_make_cant_match_gold_to_gate_fail..'
	@../run.sh equiv_make equiv_make_cant_match_gold_to_gate_fail
clean::
	@echo 'Cleaning equiv_make_cant_match_gold_to_gate_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_match_gold_to_gate_fail
all:: equiv_make/work_equiv_make_equiv_mod_already_exists_fail/.stamp
equiv_make/work_equiv_make_equiv_mod_already_exists_fail/.stamp:
	@echo 'Running equiv_make_equiv_mod_already_exists_fail..'
	@../run.sh equiv_make equiv_make_equiv_mod_already_exists_fail
clean::
	@echo 'Cleaning equiv_make_equiv_mod_already_exists_fail..'
	@rm -rf equiv_make/work_equiv_make_equiv_mod_already_exists_fail
all:: equiv_make/work_equiv_make_cant_find_gold_mod_fail/.stamp
equiv_make/work_equiv_make_cant_find_gold_mod_fail/.stamp:
	@echo 'Running equiv_make_cant_find_gold_mod_fail..'
	@../run.sh equiv_make equiv_make_cant_find_gold_mod_fail
clean::
	@echo 'Cleaning equiv_make_cant_find_gold_mod_fail..'
	@rm -rf equiv_make/work_equiv_make_cant_find_gold_mod_fail
all:: equiv_mark/work_equiv_mark/.stamp
equiv_mark/work_equiv_mark/.stamp:
	@echo 'Running equiv_mark..'
	@../run.sh equiv_mark equiv_mark
clean::
	@echo 'Cleaning equiv_mark..'
	@rm -rf equiv_mark/work_equiv_mark
all:: equiv_miter/work_equiv_miter_one_module_must_be_selected_fail/.stamp
equiv_miter/work_equiv_miter_one_module_must_be_selected_fail/.stamp:
	@echo 'Running equiv_miter_one_module_must_be_selected_fail..'
	@../run.sh equiv_miter equiv_miter_one_module_must_be_selected_fail
clean::
	@echo 'Cleaning equiv_miter_one_module_must_be_selected_fail..'
	@rm -rf equiv_miter/work_equiv_miter_one_module_must_be_selected_fail
all:: equiv_miter/work_equiv_miter_miter_module_already_exists_fail/.stamp
equiv_miter/work_equiv_miter_miter_module_already_exists_fail/.stamp:
	@echo 'Running equiv_miter_miter_module_already_exists_fail..'
	@../run.sh equiv_miter equiv_miter_miter_module_already_exists_fail
clean::
	@echo 'Cleaning equiv_miter_miter_module_already_exists_fail..'
	@rm -rf equiv_miter/work_equiv_miter_miter_module_already_exists_fail
all:: equiv_miter/work_equiv_miter/.stamp
equiv_miter/work_equiv_miter/.stamp:
	@echo 'Running equiv_miter..'
	@../run.sh equiv_miter equiv_miter
clean::
	@echo 'Cleaning equiv_miter..'
	@rm -rf equiv_miter/work_equiv_miter
all:: equiv_miter/work_equiv_miter_undef/.stamp
equiv_miter/work_equiv_miter_undef/.stamp:
	@echo 'Running equiv_miter_undef..'
	@../run.sh equiv_miter equiv_miter_undef
clean::
	@echo 'Cleaning equiv_miter_undef..'
	@rm -rf equiv_miter/work_equiv_miter_undef
all:: equiv_miter/work_equiv_miter_trigger/.stamp
equiv_miter/work_equiv_miter_trigger/.stamp:
	@echo 'Running equiv_miter_trigger..'
	@../run.sh equiv_miter equiv_miter_trigger
clean::
	@echo 'Cleaning equiv_miter_trigger..'
	@rm -rf equiv_miter/work_equiv_miter_trigger
all:: equiv_miter/work_equiv_miter_cmp/.stamp
equiv_miter/work_equiv_miter_cmp/.stamp:
	@echo 'Running equiv_miter_cmp..'
	@../run.sh equiv_miter equiv_miter_cmp
clean::
	@echo 'Cleaning equiv_miter_cmp..'
	@rm -rf equiv_miter/work_equiv_miter_cmp
all:: equiv_miter/work_equiv_miter_invalid_num_of_args/.stamp
equiv_miter/work_equiv_miter_invalid_num_of_args/.stamp:
	@echo 'Skipping disabled test equiv_miter..'
all:: equiv_miter/work_equiv_miter_assert/.stamp
equiv_miter/work_equiv_miter_assert/.stamp:
	@echo 'Running equiv_miter_assert..'
	@../run.sh equiv_miter equiv_miter_assert
clean::
	@echo 'Cleaning equiv_miter_assert..'
	@rm -rf equiv_miter/work_equiv_miter_assert
all:: equiv_opt/work_equiv_opt_undef/.stamp
equiv_opt/work_equiv_opt_undef/.stamp:
	@echo 'Running equiv_opt_undef..'
	@../run.sh equiv_opt equiv_opt_undef
clean::
	@echo 'Cleaning equiv_opt_undef..'
	@rm -rf equiv_opt/work_equiv_opt_undef
all:: equiv_opt/work_equiv_opt_no_opt_fail/.stamp
equiv_opt/work_equiv_opt_no_opt_fail/.stamp:
	@echo 'Running equiv_opt_no_opt_fail..'
	@../run.sh equiv_opt equiv_opt_no_opt_fail
clean::
	@echo 'Cleaning equiv_opt_no_opt_fail..'
	@rm -rf equiv_opt/work_equiv_opt_no_opt_fail
all:: equiv_opt/work_equiv_opt/.stamp
equiv_opt/work_equiv_opt/.stamp:
	@echo 'Running equiv_opt..'
	@../run.sh equiv_opt equiv_opt
clean::
	@echo 'Cleaning equiv_opt..'
	@rm -rf equiv_opt/work_equiv_opt
all:: equiv_opt/work_equiv_opt_assert_fail/.stamp
equiv_opt/work_equiv_opt_assert_fail/.stamp:
	@echo 'Running equiv_opt_assert_fail..'
	@../run.sh equiv_opt equiv_opt_assert_fail
clean::
	@echo 'Cleaning equiv_opt_assert_fail..'
	@rm -rf equiv_opt/work_equiv_opt_assert_fail
all:: equiv_opt/work_equiv_opt_run/.stamp
equiv_opt/work_equiv_opt_run/.stamp:
	@echo 'Running equiv_opt_run..'
	@../run.sh equiv_opt equiv_opt_run
clean::
	@echo 'Cleaning equiv_opt_run..'
	@rm -rf equiv_opt/work_equiv_opt_run
all:: equiv_opt/work_equiv_opt_map/.stamp
equiv_opt/work_equiv_opt_map/.stamp:
	@echo 'Running equiv_opt_map..'
	@../run.sh equiv_opt equiv_opt_map
clean::
	@echo 'Cleaning equiv_opt_map..'
	@rm -rf equiv_opt/work_equiv_opt_map
all:: equiv_opt/work_equiv_opt_fully_selected_des_fail/.stamp
equiv_opt/work_equiv_opt_fully_selected_des_fail/.stamp:
	@echo 'Running equiv_opt_fully_selected_des_fail..'
	@../run.sh equiv_opt equiv_opt_fully_selected_des_fail
clean::
	@echo 'Cleaning equiv_opt_fully_selected_des_fail..'
	@rm -rf equiv_opt/work_equiv_opt_fully_selected_des_fail
all:: equiv_opt/work_equiv_opt_unknown_option_fail/.stamp
equiv_opt/work_equiv_opt_unknown_option_fail/.stamp:
	@echo 'Running equiv_opt_unknown_option_fail..'
	@../run.sh equiv_opt equiv_opt_unknown_option_fail
clean::
	@echo 'Cleaning equiv_opt_unknown_option_fail..'
	@rm -rf equiv_opt/work_equiv_opt_unknown_option_fail
all:: equiv_purge/work_equiv_purge/.stamp
equiv_purge/work_equiv_purge/.stamp:
	@echo 'Running equiv_purge..'
	@../run.sh equiv_purge equiv_purge
clean::
	@echo 'Cleaning equiv_purge..'
	@rm -rf equiv_purge/work_equiv_purge
all:: equiv_remove/work_equiv_remove/.stamp
equiv_remove/work_equiv_remove/.stamp:
	@echo 'Running equiv_remove..'
	@../run.sh equiv_remove equiv_remove
clean::
	@echo 'Cleaning equiv_remove..'
	@rm -rf equiv_remove/work_equiv_remove
all:: equiv_remove/work_equiv_remove_gold_gate_fail/.stamp
equiv_remove/work_equiv_remove_gold_gate_fail/.stamp:
	@echo 'Running equiv_remove_gold_gate_fail..'
	@../run.sh equiv_remove equiv_remove_gold_gate_fail
clean::
	@echo 'Cleaning equiv_remove_gold_gate_fail..'
	@rm -rf equiv_remove/work_equiv_remove_gold_gate_fail
all:: equiv_remove/work_equiv_remove_gate/.stamp
equiv_remove/work_equiv_remove_gate/.stamp:
	@echo 'Running equiv_remove_gate..'
	@../run.sh equiv_remove equiv_remove_gate
clean::
	@echo 'Cleaning equiv_remove_gate..'
	@rm -rf equiv_remove/work_equiv_remove_gate
all:: equiv_remove/work_equiv_remove_gold/.stamp
equiv_remove/work_equiv_remove_gold/.stamp:
	@echo 'Running equiv_remove_gold..'
	@../run.sh equiv_remove equiv_remove_gold
clean::
	@echo 'Cleaning equiv_remove_gold..'
	@rm -rf equiv_remove/work_equiv_remove_gold
all:: equiv_simple/work_equiv_simple_short_fsm/.stamp
equiv_simple/work_equiv_simple_short_fsm/.stamp:
	@echo 'Running equiv_simple_short_fsm..'
	@../run.sh equiv_simple equiv_simple_short_fsm
clean::
	@echo 'Cleaning equiv_simple_short_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_short_fsm
all:: equiv_simple/work_equiv_simple_undef_fsm/.stamp
equiv_simple/work_equiv_simple_undef_fsm/.stamp:
	@echo 'Running equiv_simple_undef_fsm..'
	@../run.sh equiv_simple equiv_simple_undef_fsm
clean::
	@echo 'Cleaning equiv_simple_undef_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_undef_fsm
all:: equiv_simple/work_equiv_simple_seq/.stamp
equiv_simple/work_equiv_simple_seq/.stamp:
	@echo 'Running equiv_simple_seq..'
	@../run.sh equiv_simple equiv_simple_seq
clean::
	@echo 'Cleaning equiv_simple_seq..'
	@rm -rf equiv_simple/work_equiv_simple_seq
all:: equiv_simple/work_equiv_simple_undef/.stamp
equiv_simple/work_equiv_simple_undef/.stamp:
	@echo 'Running equiv_simple_undef..'
	@../run.sh equiv_simple equiv_simple_undef
clean::
	@echo 'Cleaning equiv_simple_undef..'
	@rm -rf equiv_simple/work_equiv_simple_undef
all:: equiv_simple/work_equiv_simple_v_fsm/.stamp
equiv_simple/work_equiv_simple_v_fsm/.stamp:
	@echo 'Running equiv_simple_v_fsm..'
	@../run.sh equiv_simple equiv_simple_v_fsm
clean::
	@echo 'Cleaning equiv_simple_v_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_v_fsm
all:: equiv_simple/work_equiv_simple_seq_fsm/.stamp
equiv_simple/work_equiv_simple_seq_fsm/.stamp:
	@echo 'Running equiv_simple_seq_fsm..'
	@../run.sh equiv_simple equiv_simple_seq_fsm
clean::
	@echo 'Cleaning equiv_simple_seq_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_seq_fsm
all:: equiv_simple/work_equiv_simple/.stamp
equiv_simple/work_equiv_simple/.stamp:
	@echo 'Running equiv_simple..'
	@../run.sh equiv_simple equiv_simple
clean::
	@echo 'Cleaning equiv_simple..'
	@rm -rf equiv_simple/work_equiv_simple
all:: equiv_simple/work_equiv_simple_nogroup_fsm/.stamp
equiv_simple/work_equiv_simple_nogroup_fsm/.stamp:
	@echo 'Running equiv_simple_nogroup_fsm..'
	@../run.sh equiv_simple equiv_simple_nogroup_fsm
clean::
	@echo 'Cleaning equiv_simple_nogroup_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_nogroup_fsm
all:: equiv_simple/work_equiv_simple_nogroup/.stamp
equiv_simple/work_equiv_simple_nogroup/.stamp:
	@echo 'Running equiv_simple_nogroup..'
	@../run.sh equiv_simple equiv_simple_nogroup
clean::
	@echo 'Cleaning equiv_simple_nogroup..'
	@rm -rf equiv_simple/work_equiv_simple_nogroup
all:: equiv_simple/work_equiv_simple_fsm/.stamp
equiv_simple/work_equiv_simple_fsm/.stamp:
	@echo 'Running equiv_simple_fsm..'
	@../run.sh equiv_simple equiv_simple_fsm
clean::
	@echo 'Cleaning equiv_simple_fsm..'
	@rm -rf equiv_simple/work_equiv_simple_fsm
all:: equiv_simple/work_equiv_simple_short/.stamp
equiv_simple/work_equiv_simple_short/.stamp:
	@echo 'Running equiv_simple_short..'
	@../run.sh equiv_simple equiv_simple_short
clean::
	@echo 'Cleaning equiv_simple_short..'
	@rm -rf equiv_simple/work_equiv_simple_short
all:: equiv_simple/work_equiv_simple_v/.stamp
equiv_simple/work_equiv_simple_v/.stamp:
	@echo 'Running equiv_simple_v..'
	@../run.sh equiv_simple equiv_simple_v
clean::
	@echo 'Cleaning equiv_simple_v..'
	@rm -rf equiv_simple/work_equiv_simple_v
all:: equiv_status/work_equiv_status/.stamp
equiv_status/work_equiv_status/.stamp:
	@echo 'Running equiv_status..'
	@../run.sh equiv_status equiv_status
clean::
	@echo 'Cleaning equiv_status..'
	@rm -rf equiv_status/work_equiv_status
all:: equiv_status/work_equiv_status_assert_fail/.stamp
equiv_status/work_equiv_status_assert_fail/.stamp:
	@echo 'Running equiv_status_assert_fail..'
	@../run.sh equiv_status equiv_status_assert_fail
clean::
	@echo 'Cleaning equiv_status_assert_fail..'
	@rm -rf equiv_status/work_equiv_status_assert_fail
all:: equiv_struct/work_equiv_struct/.stamp
equiv_struct/work_equiv_struct/.stamp:
	@echo 'Running equiv_struct..'
	@../run.sh equiv_struct equiv_struct
clean::
	@echo 'Cleaning equiv_struct..'
	@rm -rf equiv_struct/work_equiv_struct
all:: equiv_struct/work_equiv_struct_icells/.stamp
equiv_struct/work_equiv_struct_icells/.stamp:
	@echo 'Running equiv_struct_icells..'
	@../run.sh equiv_struct equiv_struct_icells
clean::
	@echo 'Cleaning equiv_struct_icells..'
	@rm -rf equiv_struct/work_equiv_struct_icells
all:: equiv_struct/work_equiv_struct_maxiter/.stamp
equiv_struct/work_equiv_struct_maxiter/.stamp:
	@echo 'Running equiv_struct_maxiter..'
	@../run.sh equiv_struct equiv_struct_maxiter
clean::
	@echo 'Cleaning equiv_struct_maxiter..'
	@rm -rf equiv_struct/work_equiv_struct_maxiter
all:: equiv_struct/work_equiv_struct_fwonly/.stamp
equiv_struct/work_equiv_struct_fwonly/.stamp:
	@echo 'Running equiv_struct_fwonly..'
	@../run.sh equiv_struct equiv_struct_fwonly
clean::
	@echo 'Cleaning equiv_struct_fwonly..'
	@rm -rf equiv_struct/work_equiv_struct_fwonly
all:: equiv_struct/work_equiv_struct_fwd/.stamp
equiv_struct/work_equiv_struct_fwd/.stamp:
	@echo 'Running equiv_struct_fwd..'
	@../run.sh equiv_struct equiv_struct_fwd
clean::
	@echo 'Cleaning equiv_struct_fwd..'
	@rm -rf equiv_struct/work_equiv_struct_fwd
.PHONY: all clean
