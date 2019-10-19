all: work
	touch .stamp

clean::
	rm -f .stamp

define template
$(foreach design,$(1),
$(foreach script,$(2),
work:: $(design)/work_$(script)/.stamp

$(design)/work_$(script)/.stamp:
	./run.sh $(design) $(script)

clean::
	rm -rf $(design)/work_$(script)
))
endef
.PHONY: all clean
