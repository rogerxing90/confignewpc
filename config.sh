#!/bin/sh

## config ~/.vimrc
echo "so ~/confignewpc/myvim/.vimrc" > ~/.vimrc
echo "nmap ,rr	:e ~/confignewpc/myvim/.vimrc<CR>" >> ~/.vimrc

if [ "$1" = "server" ]; then
	if [ $# -ge 2 ]; then
		SERVER_NAME=$2
		shift
	fi
	shift
	echo $SERVER_NAME
	sed '
## delete (if) config bash alread appended
/_start_server/,/_end_server/ d

## append at the back of .bashrc
$ a\
\
## config bash (copy from mybashrc) _start_server\
export MY_PS1="${debian_chroot}\\e[1;33m'$SERVER_NAME'\\e[0m:\\e[1;32m\\w\\e[34m$\(__git_ps1 "\(%s\)"\)\\e[1;0m"\
export PS1="\\[\\`if [[ \\$? != "0" ]]; then echo '\''\\e[1;31m\(Error\)\\e[0m'\''; fi\\`${MY_PS1}\(\\`date +%R\\`\) \\n\\$ "\
export DISPLAY=localhost:10\
export DEST_HOST_IP=10.219.37.213\
## config bash _end_server' \
< ~/.bashrc > tmp && /bin/mv tmp ~/.bashrc
else
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
\
export VIM_SERVER=`hostname`\
## config bash _end_

## delete if previous _git_ps1_ already added
/\$(__git_ps1 "(%s)")/ s///

## change the PS1 to reflect git branch
/PS1=/ s#\\\$ #\$(__git_ps1 "(%s)")\\\$ #' \
< ~/.bashrc > tmp && /bin/mv tmp ~/.bashrc
fi

if [ "$1" = "ssh" ]; then
	echo "Host ssh.github.com" >> ~/.ssh/config
	echo "port 443" >> ~/.ssh/config
fi

## config git global
sh ./gitconfig.sh
