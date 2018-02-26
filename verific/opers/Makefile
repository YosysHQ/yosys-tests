TESTS := wide_mux sel_mux

all: $(addsuffix .status,$(TESTS))

%.status: %.sv run.sh
	bash run.sh $(basename $@)

clean:
	rm -f $(addsuffix .log,$(TESTS))
	rm -f $(addsuffix .status,$(TESTS))

.PHONY: all clean
