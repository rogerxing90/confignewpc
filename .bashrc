# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	#PS1='${debian_chroot:+($debian_chroot)}\w\e[37m$(__git_ps1 "(%s)")\e[0m>\$ '
	PS1='${debian_chroot:+($debian_chroot)}\w>\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export myos=ubuntu
alias gitt="cd ~/mygit/ubuntu/ubuntu-intrepid/"
alias knn="cd /home/insidepower/mygit/testinglab"

#essential
alias rm="rm -i"
alias nn="nautilus . &"
alias chmodd="chmod 777"
alias find="find . -name"
alias bashh="gvim ~/.bashrc"
alias bassh="source ~/.bashrc"
alias ctagg="ctags -R --sort=foldcase --c-types=+p --fields=+S *.h *.c"
alias grep="grep -nrEI --color"
alias xc="tr '\n' ' ' | xclip -selection c"

#essential ls
alias ll="ls -la"
alias lsd="ls -d */"
alias lsct="ls -ct | head -n 1"
alias lsa="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-1"
alias lsa5="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-5"
# maybe need to modified
alias vimm="gvim $(ls -ctr | tail -n-1)"

#git
source ~/.git-completion.bash
alias gits="git status"
alias gita="git commit -a"
alias gitb="git branch"
alias gitco="git checkout"
alias gitl="git log"
#alias igg=">> .gitignore"
alias gitss="git status | sed '/Untracked/q'"

#misc
alias vims="gvim -S kn.vim"
alias binn="cd /usr/local/bin"
alias newgppp="cd ~/project_powerline/newGppMac/src"
alias newgppr="cd ~/project_powerline/newGppMac/ref/mac_ref/modified/"

#machine-specific
#home-ubuntu
alias sshh="ssh -X knng@10.217.137.55"

#temp
PATH=$PATH:~/confignewpc
newprogpp=~/project_powerline/newGppMac
alias runmac="cd $newprogpp/obj && sudo ./mac && cd $newprogpp/src"

PATH=$PATH:/opt/modelsim/modeltech/linux:/home/insidepower/localbin
MGLS_HOME=/opt/modelsim/modeltech/linux/mgls
#alias grep="grep -rE --color=always"
