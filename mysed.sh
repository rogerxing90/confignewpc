#!/bin/bash
#===============================================================================
#
#          FILE:  mysed.sh
# 
#         USAGE:  ./mysed.sh 
# 
#   DESCRIPTION:  replacing the patterns matched in sed-file<mysedpat>
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Need test again
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  26/09/09 10:22:24 SGT
#      REVISION:  ---
#===============================================================================

#!/bin/bash

#find *tcf | grep 6446 | xargs echo > delete
FILELIST=`cat delete`

for file in $FILELIST
do sed -f ./mysedpat $file > tmp && /bin/mv -f tmp $file;
done

#<mysedpat>
#/setMemDataHeapSections/ s/DDR2/DSPMEM0/
#/BIOSOBJSEG/ s/DDR2/DSPMEM0/
#/MALLOCSEG/ s/DDR2/DSPMEM0/
#/STACKSEG/ s/DDR2/DSPMEM0/
