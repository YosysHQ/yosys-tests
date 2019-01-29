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

#write_file
$(eval $(call template,write_file,write_file write_file_a ))

#stat
$(eval $(call template,stat, stat stat_top stat_width stat_liberty ))

#show
# show_pause - skipped
$(eval $(call template,show, show show_colorattr show_colors show_color show_enum show_format show_label show_lib show_long show_notitle show_prefix show_signed show_stretch show_viewer show_width))

#scc
$(eval $(call template,scc, scc scc_all_cell_types scc_expect scc_max_depth scc_nofeedback scc_select scc_set_attr ))

#scatter
$(eval $(call template,scatter, scatter ))

#rename
$(eval $(call template,rename, rename rename_top rename_src rename_hide rename_enumerate rename_enumerate_pat))

#qwp
#qwp_v - exception
#+ yosys -ql yosys.log ../../scripts/qwp_v.ys
#run.sh: line 11: 28262 Floating point exception(core dumped) yosys -ql yosys.log ../../scripts/$2.ys
$(eval $(call template,qwp, qwp qwp_ltr qwp_grid qwp_dump qwp_alpha))

#ltp
$(eval $(call template,ltp, ltp ltp_noff ))

#edgetypes
$(eval $(call template,edgetypes, edgetypes ))

#delete
$(eval $(call template,delete, delete delete_input delete_output delete_port delete_cell delete_wire delete_proc ))
$(eval $(call template,delete_mem, delete_mem ))

#cover
$(eval $(call template,cover, cover cover_q cover_o cover_dir cover_a ))

.PHONY: all clean
