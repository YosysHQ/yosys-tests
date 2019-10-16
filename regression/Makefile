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

#issue_00826
$(eval $(call template,issue_00826,issue_00826))

#issue_00831
$(eval $(call template,issue_00831,issue_00831))

#issue_00835
$(eval $(call template,issue_00835,issue_00835))

#issue_00857
$(eval $(call template,issue_00857,issue_00857))

#issue_00862
$(eval $(call template,issue_00862,issue_00862))

#issue_00865 - test failed (should be ok after merge https://github.com/YosysHQ/yosys/pull/866)
$(eval $(call template,issue_00865,issue_00865))

#issue_00867
$(eval $(call template,issue_00867,issue_00867))

#issue_00870
$(eval $(call template,issue_00870,issue_00870))

#issue_00873
$(eval $(call template,issue_00873,issue_00873))

#issue_00888
$(eval $(call template,issue_00888,issue_00888))

#issue_00896
$(eval $(call template,issue_00896,issue_00896))

#issue_00922
$(eval $(call template,issue_00922,issue_00922))

#issue_00931
$(eval $(call template,issue_00931,issue_00931))

#issue_00935
$(eval $(call template,issue_00935,issue_00935))

#issue_00938
$(eval $(call template,issue_00938,issue_00938))

#issue_00940
$(eval $(call template,issue_00940,issue_00940))

#issue_00948
$(eval $(call template,issue_00948,issue_00948))

#issue_00954
$(eval $(call template,issue_00954,issue_00954))

#issue_00955
$(eval $(call template,issue_00955,issue_00955))

#issue_00956
$(eval $(call template,issue_00956,issue_00956))

#issue_00961
$(eval $(call template,issue_00961,issue_00961))

#issue_00968
$(eval $(call template,issue_00968,issue_00968))

#issue_00981
$(eval $(call template,issue_00981,issue_00981))

#issue_00982
$(eval $(call template,issue_00982,issue_00982))

#issue_00987
$(eval $(call template,issue_00987,issue_00987))

#issue_00993
$(eval $(call template,issue_00993,issue_00993))

#issue_00997
$(eval $(call template,issue_00997,issue_00997))

#issue_01002
$(eval $(call template,issue_01002,issue_01002))

#issue_01016
$(eval $(call template,issue_01016,issue_01016))

#issue_01022
$(eval $(call template,issue_01022,issue_01022))

#issue_01023
$(eval $(call template,issue_01023,issue_01023))

#issue_01033
$(eval $(call template,issue_01033,issue_01033))

#issue_01034
$(eval $(call template,issue_01034,issue_01034))

#issue_01040
$(eval $(call template,issue_01040,issue_01040))

#issue_01047
$(eval $(call template,issue_01047,issue_01047))

#issue_01063
$(eval $(call template,issue_01063,issue_01063))

#issue_01065
$(eval $(call template,issue_01065,issue_01065))

#issue_01070
$(eval $(call template,issue_01070,issue_01070))

#issue_01084
$(eval $(call template,issue_01084,issue_01084))

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
#issue_01014
$(eval $(call template,issue_01014,issue_01014))

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
