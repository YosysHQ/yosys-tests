all:: run-test.mk
	@touch .stamp
	@$(MAKE) -f run-test.mk 
clean:: run-test.mk
	@rm -f .stamp
	@$(MAKE) -f run-test.mk clean

run-test.mk: run-test.sh
	@./run-test.sh

.PHONY: all clean
