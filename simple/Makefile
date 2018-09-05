all: work
	touch .stamp

clean::
	rm -f .stamp

define template
work:: $(1)/work_$(2)/.stamp

$(1)/work_$(2)/.stamp:
	bash run.sh $(1) $(2)

clean::
	rm -rf $(1)/work_$(2)
endef

$(eval $(call template,alu,gates))
$(eval $(call template,alu,luts))

.PHONY: all clean
