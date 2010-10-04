#!/bin/bash

if [ $# -lt 1 ]; then
	echo "usage: sudo ./run.sh <tag-name> PLATFORM_VERSION"
	echo "e.g.: sudo ./run.sh 0.5.0 Éclair-2.1"
	exit 2
fi

SUFFIX=$1
#shift

#while getopts ":v:" optname
#do
#	case "$optname" in
#		"v")
#			echo "PLATFORM_VERSION=${OPTARG}-nlev_r${SUFFIX}"
#			PLATFORM_VERSION="${OPTARG}-nlev_r${SUFFIX}" ;;
#		"?")
#			echo "Unknown option $OPTARG"        ;;
#		":")
#			echo "No argument value for option $OPTARG"        ;;
#		*)
#			# Should not occur
#			echo "Unknown error while processing options"        ;;
#	esac
#done

if [ $# -ge 2 ]; then
	PLATFORM_VERSION="${2}-nlev_r${SUFFIX}"
	echo "run: PLATFORM_VERSION="$PLATFORM_VERSION
fi
echo $PLATFORM_VERSION
echo "################ `date ` ##############" | tee -a integrator_build_`date +%F`.log
~/confignewpc/bashscript/integrator_script.sh $SUFFIX $PLATFORM_VERSION | tee -a integrator_build.log
