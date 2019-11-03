PYTHON_EXECUTABLE := $(shell if python3 -c ""; then echo "python3"; else echo "python"; fi)

all:: run-test.mk
	@touch .stamp
	@$(MAKE) -f run-test.mk 
clean:: run-test.mk
	@rm -f .stamp
	@$(MAKE) -f run-test.mk clean

run-test.mk: generate.py
	@$(PYTHON_EXECUTABLE) generate.py > run-test.mk

.PHONY: all clean
