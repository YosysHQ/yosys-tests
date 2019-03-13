all: test1.status test2.status test3.status test4.status test5.status test6.status test7.status test8.status test9.status
	@grep -H . *.status | sed 's,.status:,\t,; s,PASS,pass,;' | expand -t20
	@touch .stamp

test1.status: test1.out
	@(grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_v2k(WIDTH=2)'$$" $< && \
          grep -q -e "^Importing module top_veri_v2k.$$" $< && \
		  grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_95(WIDTH=2)'$$" $< && \
          grep -q -e "^Importing module top_veri_95.$$" $< && \
          grep -q -e "^VERIFIC-INFO \\[VHDL-1067\\] top.vhd:[0-9]\\+: executing 'top_vhdl(width=2)(rtl)'$$" $< && \
          grep -q -e "^Importing module top_vhdl.$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test2.status: test2.out
	@(grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_v2k(greeting=\"hola hola\")'$$" $< && \
		  grep -q -e "^Importing module top_veri_v2k.$$" $< && \
		  grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_95(greeting=\"hola hola\")'$$" $< && \
          grep -q -e "^Importing module top_veri_95.$$" $< && \
          grep -q -e "^VERIFIC-INFO \\[VHDL-1067\\] top.vhd:[0-9]\\+: executing 'top_vhdl(greeting=\"hola hola\")(rtl)'$$" $< && \
          grep -q -e "^Importing module top_vhdl.$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test3.status: test3.out
	@(grep -q -e "^Importing module top_veri_v2k.$$" $< && \
         grep -q -e "^Importing module top_veri_95.$$" $< && \
		 grep -q -e "^Importing module top_vhdl.$$" $< && \
         grep -q -e "^VERIFIC-WARNING \\[VHDL-1676\\] top.vhd:1: unit 'top_vhdl' does not have a generic named 'nonexistent' to override$$" $< && \
		 grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:1: module 'top_veri_v2k' does not have a parameter named 'nonexistent' to override$$" $< && \
		 grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:10: module 'top_veri_95' does not have a parameter named 'nonexistent' to override$$" $< && \
	 echo PASS > $@) || echo FAIL > $@

test4.status: test4.out
	@(grep -q -e "^Importing module top_veri_v2k.$$" $< && \
         grep -q -e "^Importing module top_veri_95.$$" $< && \
		 grep -q -e "^Importing module top_vhdl.$$" $< && \
		 grep -q -e "^-chparam WIDTH already specified: overwriting.$$" $< && \
	 echo PASS > $@) || echo FAIL > $@

test5.status: test5.out
	@(grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_v2k(WIDTH=2,INIT=0,greeting=\"bonjour  \")'$$" $< && \
		  grep -q -e "^Importing module top_veri_v2k.$$" $< && \
		  grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_95(WIDTH=2,INIT=0,greeting=\"bonjour  \")'$$" $< && \
          grep -q -e "^Importing module top_veri_95.$$" $< && \
          grep -q -e "^VERIFIC-INFO \\[VHDL-1067\\] top.vhd:[0-9]\\+: executing 'top_vhdl(width=2,init='0',greeting=\"bonjour  \")(rtl)'$$" $< && \
          grep -q -e "^Importing module top_vhdl.$$" $< && \
          grep -q -e "^VERIFIC-WARNING \\[VHDL-1676\\] top.vhd:1: unit 'top_vhdl' does not have a generic named 'nonexistent' to override$$" $< && \
          grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:1: module 'top_veri_v2k' does not have a parameter named 'nonexistent' to override$$" $< && \
		  grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:10: module 'top_veri_95' does not have a parameter named 'nonexistent' to override$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test6.status: test6.out
	@(grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_v2k(WIDTH=2,INIT=0,greeting=\"bonjour  \")'$$" $< && \
		  grep -q -e "^Importing module top_veri_v2k(WIDTH=2,INIT=0,greeting=\"bonjour  \").$$" $< && \
		  grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_95(WIDTH=2,INIT=0,greeting=\"bonjour  \")'$$" $< && \
          grep -q -e "^Importing module top_veri_95(WIDTH=2,INIT=0,greeting=\"bonjour  \").$$" $< && \
          grep -q -e "^VERIFIC-INFO \\[VHDL-1067\\] top.vhd:[0-9]\\+: executing 'top_vhdl(width=2,init='0',greeting=\"bonjour  \")(rtl)'$$" $< && \
          grep -q -e "^Importing module top_vhdl(width=2,init='0',greeting=\"bonjour  \").$$" $< && \
          grep -q -e "^VERIFIC-WARNING \\[VHDL-1676\\] top.vhd:1: unit 'top_vhdl' does not have a generic named 'nonexistent' to override$$" $< && \
          grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:1: module 'top_veri_v2k' does not have a parameter named 'nonexistent' to override$$" $< && \
		  grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:10: module 'top_veri_95' does not have a parameter named 'nonexistent' to override$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test7.status: test7.out
	@(grep -q -e "^Importing module top.$$" $< && \
		  grep -q -v -e "^VERIFIC-WARNING \\[VERI-1928\\]$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test8.status: test8.out
	@(grep -q -e "^Importing module top.$$" $< && \
		  grep -q -v -e "^VERIFIC-WARNING \\[VERI-1928\\]$$" $< && \
          echo PASS > $@) || echo FAIL > $@

test9.status: test9.out
	@(grep -q -e "^VERIFIC-INFO \\[VERI-1018\\] top.v:[0-9]\\+: compiling module 'top_veri_v2k(WIDTH=2,INIT=0,greeting=\"bonjour  \")'$$" $< && \
		  grep -q -e "^Importing module top_veri_v2k.$$" $< && \
          grep -q -e "^VERIFIC-WARNING \\[VERI-1928\\] top.v:1: module 'top_veri_v2k' does not have a parameter named 'nonexistent' to override$$" $< && \
          echo PASS > $@) || echo FAIL > $@


%.out: test.ys $(wildcard *.v *.vhd)
	@yosys -q -q $<

clean:
	rm -f *.status *.out .stamp

.PHONY: all clean
