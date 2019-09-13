#!/usr/bin/env bash
set -e
{
echo "all::"
for x in ../*.ys; do
	echo "all:: run-$x"
	echo "run-$x:"
	echo "	@echo 'Running $x..'"
	echo "	@yosys -ql ${x%.ys}.log $x"
done
} > run-test.mk
exec ${MAKE:-make} -f run-test.mk
