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

#test_abcloop
$(eval $(call template,test_abcloop,test_abcloop test_abcloop_n test_abcloop_s ))

#test_cell
#test_cell_map - takes a lot of time
# test_cell_mux, test_cell_pmux - is not supported
$(eval $(call template,test_cell,test_cell test_cell_aigmap test_cell_const test_cell_edges test_cell_f  test_cell_div test_cell_muxdiv test_cell_n test_cell_noeval test_cell_nosat test_cell_s test_cell_script test_cell_simlib test_cell_v test_cell_vlog test_cell_w test_cell_alu test_cell_sop test_cell_lut test_cell_macc test_cell_lcu test_cell_fa))

#torder
$(eval $(call template,torder,torder torder_stop torder_noautostop ))

#trace
$(eval $(call template,trace,trace ))
$(eval $(call template,trace_mem,trace_mem ))

#write_file
$(eval $(call template,write_file,write_file write_file_a ))

#stat
$(eval $(call template,stat, stat stat_top stat_width stat_liberty stat_tech_xilinx))

#show
# show_pause - skipped
$(eval $(call template,show, show show_colorattr show_colors show_color show_enum show_format show_label show_lib show_long show_notitle show_prefix show_signed show_stretch show_viewer show_width))

#scc
$(eval $(call template,scc, scc scc_all_cell_types scc_expect scc_max_depth scc_nofeedback scc_select scc_set_attr ))
$(eval $(call template,scc_feedback, scc scc_all_cell_types scc_expect1 scc_max_depth scc_nofeedback scc_select scc_set_attr ))
$(eval $(call template,scc_hier_feedback, scc scc_all_cell_types scc_expect scc_max_depth scc_nofeedback scc_select scc_set_attr ))


#scatter
$(eval $(call template,scatter, scatter ))

#rename
$(eval $(call template,rename, rename rename_top rename_src rename_hide rename_enumerate rename_enumerate_pat rename_wire rename_top_top rename_low))

#qwp
#qwp_v - exception (issue #923)
#+ yosys -ql yosys.log ../../scripts/qwp_v.ys
#run.sh: line 11: 28262 Floating point exception(core dumped) yosys -ql yosys.log ../../scripts/$2.ys
$(eval $(call template,qwp, qwp qwp_v qwp_ltr qwp_grid qwp_dump qwp_alpha))

#ltp
$(eval $(call template,ltp, ltp ltp_noff ))

#edgetypes
$(eval $(call template,edgetypes, edgetypes ))

#delete
$(eval $(call template,delete, delete delete_input delete_output delete_port delete_cell delete_wire delete_proc ))
$(eval $(call template,delete_mem, delete_mem ))

#cover
$(eval $(call template,cover, cover cover_q cover_o cover_dir cover_a ))

#insbuf
$(eval $(call template,insbuf,insbuf insbuf_cell))

#add
$(eval $(call template,add, add add_wire add_input add_output add_inout add_global_input ))

#blackbox
$(eval $(call template,blackbox, blackbox ))

# - issue #925
#bugpoint ERROR: No such command: autoidx (type 'help' for a command overview)
$(eval $(call template,bugpoint,bugpoint_yosys bugpoint_script bugpoint_grep bugpoint_fast bugpoint_clean bugpoint_modules bugpoint_ports bugpoint_cells bugpoint_connections  ))

#chformal
$(eval $(call template,chformal, chformal chformal_assert2assume chformal_assert chformal_assume2assert chformal_assume chformal_cover chformal_delay chformal_early chformal_proc_early chformal_fair2live_assert2assume chformal_fair2live chformal_fair chformal_live2fair chformal_live chformal_skip ))
$(eval $(call template,chformal_dff, chformal chformal_assert2assume chformal_assert chformal_assume2assert chformal_assume chformal_cover chformal_delay chformal_early chformal_proc_early chformal_fair2live_assert2assume chformal_fair2live chformal_fair chformal_live2fair chformal_live chformal_skip ))

#chtype
$(eval $(call template,chtype, chtype chtype_map chtype_selection chtype_set))

#connect
$(eval $(call template,connect, connect_nomap_set connect_nomap_unset connect_nounset_set connect_set connect_unset connect_port connect_nomap_port))

#connwrappers
$(eval $(call template,connwrappers, connwrappers connwrappers_signed connwrappers_unsigned connwrappers_port ))

#plugin
$(eval $(call template,plugin, plugin plugin_i plugin_a plugin_l ))

#select
$(eval $(call template,select, select select_all select_add select_add_all select_assert_any select_assert_count select_assert_max select_assert_min select_assert_none select_clear select_count select_del select_list select_module select_none select_read select_set select_write select_add_A_eq select_add_a_eq select_add_A_lesseq select_add_a_lesseq select_add_A_less select_add_a_less select_add_A_moreeq select_add_a_moreeq select_add_A_more select_add_a_more select_add_A select_add_a select_add_c select_add_i select_add_mid select_add_m select_add_n select_add_obj select_add_o select_add_p select_add_r_eq select_add_r_lesseq select_add_r_less select_add_r_moreeq select_add_r_more select_add_r select_add_ss select_add_s select_add_t select_add_w select_add_x ))
$(eval $(call template,select_mem, select select_all select_add select_add_all select_assert_any select_assert_count_mem select_assert_max_mem select_assert_min select_assert_none select_clear select_count select_del select_list select_module_mem ))
$(eval $(call template,select_ls, select_ls select_ls_top))
$(eval $(call template,select_cd, select_cd select_cd_up select_cd_module ))
$(eval $(call template,select_stack,select_%a select_%cie select_%ci select_%coe select_%co select_%C select_%c select_%i select_%M select_%m select_%n select_%R4 select_%R select_%s select_%u select_%x_%D select_%x_%d select_%xe select_%))

#setattr
$(eval $(call template,setattr, setattr setattr_mod setattr_set setattr_top setattr_unset setattr_set_proc ))
$(eval $(call template,setattr_mem, setattr setattr_mod setattr_set setattr_top setattr_unset setattr_set_proc ))
#setparam
#setparam_type - issue #926
#ERROR: Found error in internal cell \top.$procdff$4 ($dff) at kernel/rtlil.cc:715:
$(eval $(call template,setparam, setparam setparam_set  setparam_unset setparam_top setparam_type))
#chparam
$(eval $(call template,chparam, chparam chparam_set chparam_top chparam_list ))

#setundef
$(eval $(call template,setundef, setundef_one setundef_anyseq setundef_anyconst setundef_init setundef_random setundef_undef setundef_undriven setundef_expose))

#assertpmux
$(eval $(call template,assertpmux, assertpmux assertpmux_noinit assertpmux_always))

#eval
$(eval $(call template,eval, eval eval_set eval_set_undef eval_table eval_show eval_brute_force_equiv_checker eval_show_not_set eval_table_set eval_vloghammer_report eval_vloghammer_report_rtl))

#freduce
$(eval $(call template,freduce, freduce freduce_v freduce_vv freduce_inv freduce_stop freduce_dump ))
$(eval $(call template,freduce_dff, freduce freduce_v freduce_vv freduce_inv freduce_stop freduce_dump ))
$(eval $(call template,freduce_mem, freduce freduce_v freduce_vv freduce_inv freduce_stop freduce_dump ))

#miter -assert
$(eval $(call template,miter_assert, miter_assert miter_assert_flatten ))
$(eval $(call template,miter_assert_assume, miter_assert miter_assert_flatten ))

#sat
#sat_tempinduct_def  sat_tempinduct_tempinduct_def - issue #883
#ERROR: Assert `!undef_mode || model_undef' failed in ./kernel/satgen.h:90.
$(eval $(call template,sat, sat_dump_cnf sat_dump_json sat_dump_vcd sat_initsteps sat_maxsteps sat_max sat_prove_x sat_set_all_undef_at sat_set_all_undef sat_set_any_undef_at sat_set_any_undef sat_set_def_at sat_set_def sat_set_init sat_set sat_show sat_stepsize sat_tempinduct_skip sat_unset_at sat_set_at sat_seq sat_prove_skip sat_timeout sat_prove sat_tempinduct sat sat_all sat_ignore_unknown_cells sat_enable_undef sat_max_undef sat_show_inputs sat_show_outputs sat_show_ports sat_show_regs sat_show_public sat_show_all sat_set_assumes sat_set_init_undef sat_set_init_def sat_set_init_zero  sat_tempinduct_baseonly sat_tempinduct_inductonly sat_verify sat_verify_no_timeout sat_falsify sat_falsify_no_timeout sat_prove_asserts sat_tempinduct_tempinduct_baseonly sat_set_def_inputs sat_tempinduct_baseonly_maxsteps ))

#sim
$(eval $(call template,sim,sim sim_a sim_clock sim_d sim_n sim_rstlen sim_vcd sim_w sim_zinit ))
$(eval $(call template,sim_mem,sim sim_a sim_clockn sim_clock_mem sim_d sim_n sim_resetn sim_reset sim_rstlen sim_vcd sim_w sim_zinit_mem ))

#splitnets
$(eval $(call template,splitnets, splitnets splitnets_format splitnets_ports splitnets_driver splitnets_dpf ))
$(eval $(call template,splitnets_logic, splitnets splitnets_format splitnets_ports splitnets_driver splitnets_dpf ))

#splice
$(eval $(call template,splice, splice splice_sel_by_cell splice_sel_by_wire splice_sel_any_bit splice_wires splice_no_outputs splice_port splice_no_port ))

#supercover
$(eval $(call template,supercover, supercover))

#rmports
$(eval $(call template,rmports, rmports))

#check
$(eval $(call template,check, check check_noinit check_initdrv check_assert))

#design
$(eval $(call template,design, design_import design_copy_from design_copy_to design_as))

#log
$(eval $(call template,log, log log_stdout log_stderr log_nolog log_n))

#tee
$(eval $(call template,tee, tee))

#test_autotb
$(eval $(call template,test_autotb, test_autotb test_autotb_file test_autotb_n test_autotb_seed))

#abc
$(eval $(call template,abc, abc_D abc_g_aig abc_g_cmos2 abc_g_simple abc_mux16 abc_mux4 abc_mux8 abc_S))
$(eval $(call template,abc_dff, abc_D abc_g_aig abc_g_cmos2 abc_g_simple abc_mux16 abc_mux4 abc_mux8 abc_S))
$(eval $(call template,abc_mux, abc_D abc_g_aig abc_g_cmos2 abc_g_simple abc_mux16 abc_mux4 abc_mux8 abc_S))

#hilomap
$(eval $(call template,hilomap, hilomap hilomap_hicell hilomap_locell hilomap_singleton hilomap_hicell_singleton hilomap_locell_singleton hilomap_hicell_locell_singleton))

#cutpoint
$(eval $(call template,cutpoint, cutpoint cutpoint_undef))

#mutate
$(eval $(call template,mutate, mutate_list mutate_cnot1 mutate_cnot0 mutate_const1 mutate_const0 mutate_inv mutate_all mutate_list_cfg mutate_list_ctrl mutate_list_none mutate_list_o mutate_list_seed mutate_list_s))
$(eval $(call template,mutate_mem, mutate_list mutate_all))

#fmconbine
$(eval $(call template,fmcombine, fmcombine fmcombine_fwd fmcombine_bwd fmcombine_nop fmcombine_bwd_fwd fmcombine_anyeq fmcombine_initeq))

#pmuxtree
$(eval $(call template,pmuxtree, pmuxtree))


.PHONY: all clean
