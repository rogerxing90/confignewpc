#!/bin/bash
######## [ getops ] ########
getopts()
{
	while getopts ":v:" optname
	do
		case "$optname" in
			"v")
				echo "PLATFORM_VERSION=${OPTARG}-nlev_r${SUFFIX}"
				PLATFORM_VERSION="PLATFORM_VERSION=${OPTARG}-nlev_r${SUFFIX}" ;;
			"?")
				echo "Unknown option $OPTARG"        ;;
			":")
				echo "No argument value for option $OPTARG"        ;;
			*)
				# Should not occur
				echo "Unknown error while processing options"        ;;
		esac
	done
}

######## [ shift ] ########
# consume parameter
myshift()
{
	shift 
	THIS_IS_ACTUALLY_SECOND_PARAM=$1
}

######## [ eval ] ########
# to get the last parameter
my-eval()
{
	echo "$#"
	eval last=\$$#
	declare last_index=$#-1
	let last_index-=1
	## convert string to number
	second_last_index=$last_index
	eval second_last=\$$second_last_index

	echo "last = $last"
	echo "second_last_index = $second_last_index"
	echo "second_last = $second_last"
}

my-eval $@
