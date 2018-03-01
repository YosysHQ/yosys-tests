TESTS := wide_mux sel_mux select wselect rednor

all: $(addsuffix .status,$(TESTS))
	touch .stamp

%.status: %.sv run.sh
	-bash run.sh $(basename $@)
	test -f $@

clean:
	rm -f $(addsuffix .log,$(TESTS))
	rm -f $(addsuffix .status,$(TESTS))
	rm -f .stamp

.PHONY: all clean
