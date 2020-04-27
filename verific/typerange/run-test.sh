#!/usr/bin/env bash
set -e
{
echo "all::"
for x in *.ys; do
	echo "all:: run-$x"
	echo "run-$x:"
	echo "	@touch .start"
	echo "	@echo 'Running $x..'"
	echo "	@(yosys -ql ${x%.ys}.log $x && echo PASS > ${x%.ys}.status) || echo FAIL > ${x%.ys}.status"
done
for s in *.sh; do
	if [ "$s" != "run-test.sh" ]; then
		echo "all:: run-$s"
		echo "run-$s:"
		echo "	@touch .start"
		echo "	@echo 'Running $s..'"
		echo "	@(bash $s &> ${s%.sh}.log && echo PASS > ${s%.sh}.status) || echo FAIL > ${s%.sh}.status"
	fi
done
} > run-test.mk
exec ${MAKE:-make} -f run-test.mk
