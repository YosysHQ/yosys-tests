TESTS := until

all: $(addsuffix .status,$(TESTS))
	touch .stamp

%.status: %.sv run.sh
	-bash run.sh $(basename $@)
	test -f $@

clean:
	rm -rf $(addsuffix .pass_??,$(TESTS))
	rm -rf $(addsuffix .fail_??,$(TESTS))
	rm -f $(addsuffix .pass_??.sby,$(TESTS))
	rm -f $(addsuffix .fail_??.sby,$(TESTS))
	rm -f $(addsuffix .status,$(TESTS))
	rm -f .stamp

.PHONY: all clean
