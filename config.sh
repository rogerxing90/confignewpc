#!/bin/sh

## config ~/.vimrc
echo "so ~/confignewpc/myvim/.vimrc" > ~/.vimrc
echo "nmap ,rr	:e ~/confignewpc/myvim/.vimrc<CR>" >> ~/.vimrc

sed '
## delete (if) config bash alread appended
/_start_/,/_end_/ d

## append at the back of .bashrc
$ a\
\
## config bash (copy from mybashrc) _start_\
   export MYBASHRC_DIR=~/confignewpc\
   MYBASHRC=$MYBASHRC_DIR/mybashrc\
   if [ -f $MYBASHRC ]; then\
   	. $MYBASHRC\
   else\
   	echo not found $MYBASHRC\
   fi\
	PATH=$PATH:~/confignewpc/\
## config bash _end_

## delete if previous _git_ps1_ already added
/\$(__git_ps1 "(%s)")/ s///

## change the PS1 to reflect git branch
/PS1=/ s#\\\$ #\$(__git_ps1 "(%s)")\\\$ #' \
< ~/.bashrc > tmp && /bin/mv tmp ~/.bashrc


## config git global
sh ./gitconfig.sh
