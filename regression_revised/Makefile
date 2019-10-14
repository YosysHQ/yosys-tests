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

#issue_00018
$(eval $(call template,issue_00018,issue_00018))

#issue_00041
$(eval $(call template,issue_00041,issue_00041))

#issue_00059
$(eval $(call template,issue_00059,issue_00059))

#issue_00065
$(eval $(call template,issue_00065,issue_00065))

#issue_00067
$(eval $(call template,issue_00067,issue_00067))

#issue_00071
$(eval $(call template,issue_00071,issue_00071))

#issue_00078
$(eval $(call template,issue_00078,issue_00078))

#issue_00081
$(eval $(call template,issue_00081,issue_00081))

#issue_00082
#yosys> read_verilog top_fault.v
#1. Executing Verilog-2005 frontend.
#Parsing Verilog input from `top_fault.v' to AST representation.
#top_fault.v:4: ERROR: Internal error - should not happen - no AST_WIRE node.
#
$(eval $(call template,issue_00082,issue_00082_fail))

#issue_00083
#Warning: Deep recursion in AST simplifier.
#Does this design contain insanely long expressions?
#run.sh: line 21: 17264 Segmentation fault      (core dumped) yosys -ql yosys.log ../../scripts/$2.ys
#make: *** [Makefile:24: issue_00083/work_issue_00083/.stamp] Error 139
#
$(eval $(call template,issue_00083,issue_00083_fail))

#issue_00084
$(eval $(call template,issue_00084,issue_00084))

#issue_00085
$(eval $(call template,issue_00085,issue_00085))

#issue_00086
$(eval $(call template,issue_00086,issue_00086))

#issue_00088
$(eval $(call template,issue_00088,issue_00088))

#issue_00089
$(eval $(call template,issue_00089,issue_00089_fail))

#issue_00091
$(eval $(call template,issue_00091,issue_00091))

#issue_00093
$(eval $(call template,issue_00093,issue_00093_fail))

#issue_00095
$(eval $(call template,issue_00095,issue_00095_fail))

#issue_00096
$(eval $(call template,issue_00096,issue_00096_fail))

#issue_00098
$(eval $(call template,issue_00098,issue_00098))

#issue_00099
$(eval $(call template,issue_00099,issue_00099_fail))

.PHONY: all clean
