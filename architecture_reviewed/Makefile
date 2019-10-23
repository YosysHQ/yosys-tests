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

#achronix
$(eval $(call template,synth_achronix,synth_achronix synth_achronix_top synth_achronix_vout synth_achronix_run synth_achronix_noflatten synth_achronix_retime synth_achronix_fail))

#anlogic
$(eval $(call template,synth_anlogic,synth_anlogic synth_anlogic_top synth_anlogic_edif synth_anlogic_json synth_anlogic_run synth_anlogic_noflatten synth_anlogic_retime synth_anlogic_fail synth_anlogic_fulladder anlogic_determine_init_eqn))

#coolrunner2
$(eval $(call template,synth_coolrunner2,synth_coolrunner2 synth_coolrunner2_top synth_coolrunner2_vout synth_coolrunner2_run synth_coolrunner2_noflatten synth_coolrunner2_retime synth_coolrunner2_fail synth_coolrunner2_for_lcov synth_coolrunner2_fulladder ))
$(eval $(call template,synth_coolrunner2_lcov,synth_coolrunner2 synth_coolrunner2_top synth_coolrunner2_vout synth_coolrunner2_run synth_coolrunner2_noflatten synth_coolrunner2_retime))

#easic - issue #920
# we do not have eTools anymore available, commented until aquired
#$(eval $(call template,synth_easic,synth_easic synth_easic_top synth_easic_vlog synth_easic_run synth_easic_noflatten synth_easic_retime synth_easic_fail))
$(eval $(call template,synth_easic, synth_easic_fail))

#ecp5
$(eval $(call template,synth_ecp5,synth_ecp5 synth_ecp5_top synth_ecp5_blif synth_ecp5_edif synth_ecp5_json synth_ecp5_run synth_ecp5_flatten synth_ecp5_noflatten synth_ecp5_retime synth_ecp5_noccu2 synth_ecp5_nodffe synth_ecp5_nobram synth_ecp5_nodram synth_ecp5_nomux synth_ecp5_abc2 synth_ecp5_vpr ecp5_ffinit synth_ecp5_abc9 synth_ecp5_abc9_nowidelut synth_ecp5_nodsp synth_ecp5_fail synth_ecp5_wide_ffs))

#efinix
$(eval $(call template,synth_efinix, synth_efinix synth_efinix_edif synth_efinix_json synth_efinix_noflatten synth_efinix_retime synth_efinix_run synth_efinix_top synth_efinix_fulladder))

#gowin
$(eval $(call template,synth_gowin,synth_gowin synth_gowin_top synth_gowin_vout synth_gowin_run synth_gowin_retime synth_gowin_nobram synth_gowin_noflatten synth_gowin_nodram synth_gowin_nodffe ))

.PHONY: all clean
