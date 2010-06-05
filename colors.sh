#!/bin/bash
#
#   This file echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
#

T='gYw'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo

COL_RED="\033[0;31m"
COL_GREEN="\033[0;32m"
COL_BLUE="\033[0;34m"
COL_YELLOW="\033[0;33m"
COL_RESET="\033[0m"
COL_UNDERLINE="\033[4m"
COL_ULINE_BLUE="\033[5;34m"
COL_NEW="\033[1;40m"
COL_NEW2="\033[0;42m"

echo -en $COL_YELLOW"test... "$COL_RESET" "
echo -en $COL_ULINE_BLUE"test... "$COL_RESET" "
echo -en $COL_NEW"test... "$COL_RESET" "
echo -e $COL_NEW2"test... "$COL_RESET" "
