#!/bin/bash

set -ex
trap "echo FAIL > $1.status" ERR

yosys -l $1.log -p "
	verific -sv $1.sv
	verific -import -v top
	synth -flatten -top top
	design -stash A

	verific -sv $1.sv
	verific -import -gates -flatten top
	synth -flatten -top top
	design -stash B

	design -copy-from A -as A top
	design -copy-from B -as B top
	miter -equiv -flatten A B miter
	sat -verify -prove trigger 0 miter
"

echo PASS > $1.status

