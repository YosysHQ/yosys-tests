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


#issue_01091
$(eval $(call template,issue_01091,issue_01091))

#issue_01093
$(eval $(call template,issue_01093,issue_01093))

#issue_01115
$(eval $(call template,issue_01115,issue_01115))

#issue_01118
$(eval $(call template,issue_01118,issue_01118))

#issue_01128
$(eval $(call template,issue_01128,issue_01128))

#issue_01131
$(eval $(call template,issue_01131,issue_01131))

#issue_01132
$(eval $(call template,issue_01132,issue_01132))

#issue_01135
$(eval $(call template,issue_01135,issue_01135))

#issue_01144
$(eval $(call template,issue_01144,issue_01144))

#issue_01145
$(eval $(call template,issue_01145,issue_01145))

#issue_01220
$(eval $(call template,issue_01220,issue_01220))

#issue_01223
$(eval $(call template,issue_01223,issue_01223))

#issue_01231
$(eval $(call template,issue_01231,issue_01231))

#issue_01243
$(eval $(call template,issue_01243,issue_01243))

#issue_01273
$(eval $(call template,issue_01273,issue_01273))

#issue_01284
$(eval $(call template,issue_01284,issue_01284))

#issue_01329
$(eval $(call template,issue_01329,issue_01329))

#issue_01364
$(eval $(call template,issue_01364,issue_01364))

#issue_01372
$(eval $(call template,issue_01372,issue_01372))




#Still open bugs (should be failed):
#issue_01126
$(eval $(call template,issue_01126,issue_01126))

#issue_01161
$(eval $(call template,issue_01161,issue_01161))

#issue_01193
$(eval $(call template,issue_01193,issue_01193))

#issue_01206
$(eval $(call template,issue_01206,issue_01206))

#issue_01216
$(eval $(call template,issue_01216,issue_01216))

#issue_01217
$(eval $(call template,issue_01217,issue_01217))

#issue_01225
$(eval $(call template,issue_01225,issue_01225))

#issue_01259
$(eval $(call template,issue_01259,issue_01259))

#issue_01291
$(eval $(call template,issue_01291,issue_01291))

#issue_01360
$(eval $(call template,issue_01360,issue_01360))




.PHONY: all clean
