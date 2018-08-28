SUBDIRS = verific bigsim

all: $(addsuffix /.stamp,$(SUBDIRS))
	echo; find * -name "*.status" | sort | xargs grep -H . | sed 's,^,    ,; s,.status:,\t,; s,PASS,pass,;' | expand -t40; echo
	touch .stamp

%/.stamp:
	$(MAKE) -C $(dir $@)

clean:
	+for subdir in $(SUBDIRS); do make -C $$subdir clean; done
	rm -f .stamp

.PHONY: all clean
