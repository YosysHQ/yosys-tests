all: work
	touch .stamp

clean::
	rm -f .stamp

define template
work:: $(addprefix $(1)/.stamp_,sim $(2))

$(1)/.stamp_sim:
	bash run.sh $(1) sim
	touch $$@

$(1)/.stamp_cmos: $(1)/.stamp_sim
	bash run.sh $(1) cmos
	touch $$@

$(1)/.stamp_ice40: $(1)/.stamp_sim
	bash run.sh $(1) ice40
	touch $$@

clean::
	rm -rf $(1)/.stamp_* $(1)/work_*
endef

$(eval $(call template,navre,cmos ice40))

.PHONY: all clean
