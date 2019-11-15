#!/bin/bash

find . -type d -regex "\./.*/work_.*" -exec rm -rf {} \;
