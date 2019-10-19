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


#issue_01259
$(eval $(call template,issue_01259,issue_01259))

#issue_01291
$(eval $(call template,issue_01291,issue_01291))

#issue_01360
$(eval $(call template,issue_01360,issue_01360))




.PHONY: all clean
