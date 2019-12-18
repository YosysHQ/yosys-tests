PYTHON_EXECUTABLE := $(shell if python3 -c ""; then echo "python3"; else echo "python"; fi)

all::

run-test.mk: ../generate.py
	@$(PYTHON_EXECUTABLE) ../generate.py > run-test.mk

include run-test.mk

.PHONY: all clean
