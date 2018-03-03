SUBDIRS = verific

all: $(addsuffix /.stamp,$(SUBDIRS))
	find -name "*.status" | sort | xargs grep -H . | sed 's,.status:,\t,; s,PASS,pass,;' | expand -t40
	touch .stamp

%/.stamp:
	$(MAKE) -C $(dir $@)

clean:
	+for subdir in $(SUBDIRS); do make -C $$subdir clean; done
	rm -f .stamp

.PHONY: all clean
