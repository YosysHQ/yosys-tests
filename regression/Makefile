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

#case_stmt_assertion
$(eval $(call template,case_stmt_assertion,case_stmt_assertion))

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
#$(eval $(call template,issue_00082,issue_00082))

#issue_00083
#Warning: Deep recursion in AST simplifier.
#Does this design contain insanely long expressions?
#run.sh: line 21: 17264 Segmentation fault      (core dumped) yosys -ql yosys.log ../../scripts/$2.ys
#make: *** [Makefile:24: issue_00083/work_issue_00083/.stamp] Error 139
#
#$(eval $(call template,issue_00083,issue_00083))

#issue_00084
$(eval $(call template,issue_00084,issue_00084))

#issue_00085
$(eval $(call template,issue_00085,issue_00085))

#issue_00086
$(eval $(call template,issue_00086,issue_00086))

#issue_00088
$(eval $(call template,issue_00088,issue_00088))

#issue_00089
$(eval $(call template,issue_00089,issue_00089))

#issue_00091
$(eval $(call template,issue_00091,issue_00091))

#issue_00093
$(eval $(call template,issue_00093,issue_00093))

#issue_00095
$(eval $(call template,issue_00095,issue_00095))

#issue_00096
$(eval $(call template,issue_00096,issue_00096))

#issue_00098
$(eval $(call template,issue_00098,issue_00098))

#issue_00099
$(eval $(call template,issue_00099,issue_00099))

#issue_00102
$(eval $(call template,issue_00102,issue_00102))

#issue_00111
$(eval $(call template,issue_00111,issue_00111))

#issue_00114
$(eval $(call template,issue_00114,issue_00114))

#issue_00126
$(eval $(call template,issue_00126,issue_00126))

#issue_00128
$(eval $(call template,issue_00128,issue_00128))

#issue_00132
$(eval $(call template,issue_00132,issue_00132))

#issue_00133
$(eval $(call template,issue_00133,issue_00133))

#issue_00134
$(eval $(call template,issue_00134,issue_00134))

#issue_00160
$(eval $(call template,issue_00160,issue_00160))

#issue_00171
$(eval $(call template,issue_00171,issue_00171))

#issue_00173
$(eval $(call template,issue_00173,issue_00173))

#issue_00174
$(eval $(call template,issue_00174,issue_00174))

#issue_00175
$(eval $(call template,issue_00175,issue_00175))

#issue_00182
$(eval $(call template,issue_00182,issue_00182))

#issue_00183
$(eval $(call template,issue_00183,issue_00183))

#issue_00186
$(eval $(call template,issue_00186,issue_00186))

#issue_00194
$(eval $(call template,issue_00194,issue_00194))

#issue_00195
$(eval $(call template,issue_00195,issue_00195))

#issue_00196
$(eval $(call template,issue_00196,issue_00196))

#issue_00210
$(eval $(call template,issue_00210,issue_00210))

#issue_00253
$(eval $(call template,issue_00253,issue_00253))

#issue_00282
$(eval $(call template,issue_00282,issue_00282))

#issue_00283
$(eval $(call template,issue_00283,issue_00283))

#issue_00287
$(eval $(call template,issue_00287,issue_00287))

#issue_00289
$(eval $(call template,issue_00289,issue_00289))

#issue_00291
$(eval $(call template,issue_00291,issue_00291))

#issue_00300
$(eval $(call template,issue_00300,issue_00300))

#issue_00306
$(eval $(call template,issue_00306,issue_00306))

#issue_00314
$(eval $(call template,issue_00314,issue_00314))

#issue_00317
$(eval $(call template,issue_00317,issue_00317))

#issue_00341
$(eval $(call template,issue_00341,issue_00341))

#issue_00342
$(eval $(call template,issue_00342,issue_00342))

#issue_00349
$(eval $(call template,issue_00349,issue_00349))

#issue_00350
$(eval $(call template,issue_00350,issue_00350))

#issue_00361
$(eval $(call template,issue_00361,issue_00361))

#issue_00362
$(eval $(call template,issue_00362,issue_00362))

#issue_00372
$(eval $(call template,issue_00372,issue_00372))

#issue_00391
$(eval $(call template,issue_00391,issue_00391))

#issue_00432
$(eval $(call template,issue_00432,issue_00432))

#issue_00444
$(eval $(call template,issue_00444,issue_00444))

#issue_00449
$(eval $(call template,issue_00449,issue_00449))

#issue_00457
$(eval $(call template,issue_00457,issue_00457))

#issue_00474
$(eval $(call template,issue_00474,issue_00474))

#issue_00481
$(eval $(call template,issue_00481,issue_00481))

#issue_00502
$(eval $(call template,issue_00502,issue_00502))

#issue_00524
$(eval $(call template,issue_00524,issue_00524))

#issue_00527
$(eval $(call template,issue_00527,issue_00527))


.PHONY: all clean
