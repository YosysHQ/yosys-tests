
define template
$(foreach design,$(1),
all: $(design)/work_sim/.stamp
$(design)/work_sim/.stamp:
	@echo 'Running $(design)/sim..'
	@bash run.sh $(design) sim
clean::
	@echo 'Cleaning $(design)/sim..'
	@rm -rf $(design)/work_sim

all: $(design)/work_falsify/.stamp
$(design)/work_falsify/.stamp:
	@echo 'Running $(design)/falsify..'
	@bash run.sh $(design) falsify
clean::
	@echo 'Cleaning $(design)/falsify..'
	@rm -rf $(design)/work_falsify
$(foreach script,$(2),
all: $(design)/work_$(script)/.stamp
$(design)/work_$(script)/.stamp: $(design)/work_sim/.stamp
	@echo 'Running $(design)/$(script)..'
	@bash run.sh $(design) $(script)
clean::
	@echo 'Cleaning $(design)/$(script)..'
	@rm -rf $(design)/work_$(script)
))
endef


$(eval $(call template,navre,cmos ice40 ice40_retime ice40_abc9 ecp5 ecp5_retime ecp5_abc9 xilinx xilinx_retime xilinx_abc9 xilinx_abc9_dff))
ifeq ($(ENABLE_HEAVY_TESTS),1)
$(eval $(call template,picorv32,cmos ice40 ice40_retime ice40_abc9 ecp5 ecp5_retime ecp5_abc9 xilinx xilinx_retime xilinx_abc9 xilinx_abc9_dff))
endif
.PHONY: all clean
