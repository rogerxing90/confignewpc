#!/bin/bash

if [ $# -ne 1 ]; then
	echo "usage: sudo ./run.sh <tag-name>"
	echo "e.g.: sudo ./run.sh 0.5.0"
	exit 2
fi

echo "################ `date ` ##############" | tee -a integrator_build.log
~/confignewpc/bashscript/integrator_script.sh $1 | tee -a integrator_build.log
