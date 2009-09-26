#!/bin/bash
#===============================================================================
#
#          FILE:  rename.sh
# 
#         USAGE:  ./rename.sh 
# 
#   DESCRIPTION:  mass rename in current directory
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  26/09/09 10:08:56 SGT
#      REVISION:  ---
#===============================================================================

# check bash string mangling
# echo to see the actual command
cd $PWD
container=`find . -name "*loop*"`
for file in $container; do echo mv "$file" "${file/loop/intrloop}"; done

#only this directory
#for file in *; do echo mv "$file" "${file/loop/intrloop}"; done

# for actual name renaming
#for file in *; do mv "$file" "${file/loop/helloworld}"; done
