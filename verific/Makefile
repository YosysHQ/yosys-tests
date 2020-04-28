SUBDIRS = opers sva vhdl typerange

all: $(addsuffix /.stamp,$(SUBDIRS))
	touch .stamp

%/.stamp:
	$(MAKE) -C $(dir $@)

clean:
	+for subdir in $(SUBDIRS); do make -C $$subdir clean; done
	rm -f .stamp

.PHONY: all clean
