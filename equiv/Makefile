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

#equiv_make
$(eval $(call template,equiv_make,equiv_make equiv_make_inames equiv_make_blacklist equiv_make_encfile))
$(eval $(call template,equiv_make_fsm,equiv_make_encfile equiv_make_encfile_fsm))

#equiv_simple
$(eval $(call template,equiv_simple,equiv_simple equiv_simple_v equiv_simple_undef equiv_simple_short equiv_simple_seq equiv_simple_nogroup))
$(eval $(call template,equiv_simple_fsm,equiv_simple equiv_simple_v equiv_simple_undef equiv_simple_short equiv_simple_seq equiv_simple_nogroup))

#equiv_status
$(eval $(call template,equiv_status,equiv_status))

#equiv_struct
$(eval $(call template,equiv_struct,equiv_struct equiv_struct_fwd equiv_struct_fwonly equiv_struct_icells equiv_struct_maxiter))

#equiv_remove
$(eval $(call template,equiv_remove,equiv_remove equiv_remove_gold equiv_remove_gate ))

#equiv_purge
$(eval $(call template,equiv_purge,equiv_purge ))

#equiv_miter
$(eval $(call template,equiv_miter,equiv_miter equiv_miter_trigger equiv_miter_cmp equiv_miter_assert equiv_miter_undef))

#equiv_mark
$(eval $(call template,equiv_mark,equiv_mark ))

#equiv_induct
$(eval $(call template,equiv_induct,equiv_induct equiv_induct_undef equiv_induct_seq ))

#equiv_add
#$(eval $(call template,equiv_add,equiv_add equiv_add_try ))

#equiv_opt
$(eval $(call template,equiv_opt,equiv_opt equiv_opt_run equiv_opt_map))

.PHONY: all clean
