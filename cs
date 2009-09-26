#!/bin/bash
# usage:
# . cs 5 (up to 5 level)
# . cs s gpp dsp (change /gpp/ in $PWD to /dsp/ )
# . cs d (change /dsp/ in $PWD to /gpp/ )
# . cs g (change /gpp/ in $PWD to /dsp/ )

#set -x
input="$1"

#checkinputdigit=`echo $input | grep -E "[[:digit:]]"`
#echo checkinputdigit is $checkinputdigit
#if [ "$checkinputdigit" != "$input" ]; then
#     echo input not digit
#else
#     echo input is digit
#fi

showdirs() {
   pushd . > /dev/null   #don't show dirs
   #echo "dirs in stack: (0 as current dir)"
   #dirs -v
}

updir() {
   showdirs
   loopcount=$1
   while [ $loopcount -gt 0 ]; do
      cd ..
      loopcount=$(($loopcount-1));
   done
}

# replace back-end(%) match of $1
# (%:front-end, /:all)
swapdir() {
   showdirs
   findstr="$1"
   newdir=${PWD/\/$1\//\/$2\/};
   cd $newdir
}

# shift arg list $2->$1, $3->$2...
shift

# check input params
case "$input" in
   [[:digit:]] ) updir $input;;
   s ) swapdir $@;;
   d ) swapdir dsp gpp;;
   g ) swapdir gpp dsp;;
   [[:alpha:]]* ) echo input is alpha;;
   * ) echo "try with better argument?? =)";;
esac
