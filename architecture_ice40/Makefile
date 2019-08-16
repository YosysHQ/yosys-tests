all: work
	touch .stamp

clean::
	rm -f .stamp

define template1
$(foreach design,$(1),
$(foreach script,$(2),
work:: $(design)/work_$(script)/.stamp

$(design)/work_$(script)/.stamp:
	bash run.sh $(design) $(script)

clean::
	rm -rf $(design)/work_$(script)
))
endef

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

#ice40
$(eval $(call template,add_sub,synth_ice40))
$(eval $(call template,alu,synth_ice40))
$(eval $(call template,concat,synth_ice40))
$(eval $(call template,counter,synth_ice40))
$(eval $(call template,dffs,synth_ice40))
$(eval $(call template,dffs_wide,synth_ice40))
$(eval $(call template,div_mod,synth_ice40))
$(eval $(call template,fsm,synth_ice40))
$(eval $(call template,full_adder,synth_ice40))
$(eval $(call template,latches,synth_ice40))
$(eval $(call template,logic,synth_ice40))
$(eval $(call template,macc,synth_ice40))
$(eval $(call template,memory,synth_ice40))
$(eval $(call template,mul_pow,synth_ice40))
$(eval $(call template,mux,synth_ice40))
$(eval $(call template,pmux,synth_ice40))
$(eval $(call template,reduce,synth_ice40))
$(eval $(call template,shiftx,synth_ice40))
$(eval $(call template,shr,synth_ice40))
$(eval $(call template,tribuf,synth_ice40))

.PHONY: all clean
