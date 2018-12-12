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

$(eval $(call template,alu,gates luts))

# DFF with constant drivers
$(eval $(call template,dff, dff))
$(eval $(call template,dffr, dff))
$(eval $(call template,dffc, dff))
$(eval $(call template,dffcp, dff))
$(eval $(call template,dffsr, dff))

# Tri-state buffers general use
$(eval $(call template,tristate, tristate))
$(eval $(call template,tristate_case, tristate))
$(eval $(call template,tristate_if, tristate))
$(eval $(call template,tristate_proc_asmt, tristate))

# Tri-state buffers with constant
$(eval $(call template,tristate_const_0, tristate))
$(eval $(call template,tristate_const_1, tristate))
$(eval $(call template,tristate_const_data, tristate))

# Demoting I/O port
$(eval $(call template,inout_port, tristate))
$(eval $(call template,inout_port_demote, tristate))

# MACC cells
$(eval $(call template,macc, macc))

#FSM with unreachable state
$(eval $(call template,fsm_unreach, fsm))
# Optimization of FSM when signal connected to input/input and output
$(eval $(call template,fsm, fsm))
$(eval $(call template,fsm_opt, fsm))

.PHONY: all clean
