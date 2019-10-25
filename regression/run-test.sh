#!/usr/bin/env bash
set -e
{
for x in *; do
	if [ -d "$x" ]; then
		if [ -f "$x/$x.ys" ]; then
				# Running test expected to pass
				echo "all:: $x/work_$x/.stamp"
				echo "$x/work_$x/.stamp:"
				if [ -f "$x/heavy_test" ]; then
					if [ -z "$ENABLE_HEAVY_TESTS" ] || [ "$ENABLE_HEAVY_TESTS" -ne "1" ]; then
						echo "	@echo 'Skipping heavy test $x..'"
						break
					fi
					echo "	@echo 'Running heavy test $x..'"
				else
					echo "	@echo 'Running $x..'"
				fi
				echo "	@./run.sh $x $x"
				echo "clean::"
				echo "	@echo 'Cleaning $x..'"
				echo "	@rm -rf $x/work_$x"
		elif [ -f "$x/$x""_fail.ys" ]; then
				# Running test expected to fail
				echo "all:: $x/work_$x""_fail/.stamp"
				echo "$x/work_$x""_fail/.stamp:"
				if [ -f "$x/heavy_test" ]; then
					if [ -z "$ENABLE_HEAVY_TESTS" ] || [ "$ENABLE_HEAVY_TESTS" -ne "1" ]; then
						echo "	@echo 'Skipping heavy test $x..'"
						break
					fi
					echo "	@echo 'Running heavy test $x..'"
				else
					echo "	@echo 'Running $x..'"
				fi
				echo "	@./run.sh $x $x""_fail"
				echo "clean::"
				echo "	@echo 'Cleaning $x..'"
				echo "	@rm -rf $x/work_$x""_fail"
		else
			# In case there is no script fail makefile
			echo "all:: run-$x"
			echo "run-$x:"
			echo "	\$(error 'No scripts in $x..')"
		fi
	fi
done
echo ".PHONY: all clean"
} > run-test.mk
