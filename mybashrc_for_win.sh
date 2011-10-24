COL_RED="\033[0;31m"
COL_GREEN="\033[0;32m"
COL_BLUE="\033[0;34m"
COL_YELLOW="\033[0;33m"
COL_RESET="\033[0m"
COL_UNDERLINE="\033[4m"

alias nn="explorer ."
alias cdd="cd .."
alias cdc="cd d: && cd /D/kn/1confignewpc"
alias findcpp='find . -name "*.cpp" -o -name "*.h"'
alias bassh='source  ~/.bashrc'
alias bashh='gvim D:\\kn\\1confignewpc\\mybashrc_for_win.sh &'
alias bashhh='gvim D:\\kn\\mylocal_bashrc.sh &'
alias pp="popd"
alias p="pushd"
alias ll="ls -lah --color=auto"
alias lsd="ls -d */ --color=auto"
alias lsh="ls -ct | head -n 1"
alias lss="ls -ctrl"
alias lsa="ls -ctrla"
alias lsaa="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-1"
alias lsa5="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-5"
VIM_SERVER="hp"
alias g="gvim --servername $VIM_SERVER --remote --remote-silent"


## copied from mybashrc
alias ignore="gvim .gitignore &"
alias gits="git status"
alias gita="git commit -a"
alias gitam="git commit -a -m"
alias gitcm="git commit -m "
alias gitau="git add -u"
alias gitca="git commit --amend"
alias gitb="git branch"
alias gitbr="git branch -r"
alias gitc="git checkout"
alias gitcH="git checkout -f HEAD"
alias gitd="git diff"
alias gitdi="git diff --ignore-space-change"
alias gitdc="git diff --cached"
alias gitds="git diff --stat"
alias gitdh="git diff HEAD~1.."
#diff staged files with previous commit
#note: git diff only diff unstaged files with previous commit
alias gitdH="git diff HEAD"
alias gitp="git push"
#alias igg=">> .gitignore"
alias gitss="git status | sed '/Untracked/q'"
alias gitst="git stash"
alias gitstl="git stash list"
alias gitg="git tag"
alias gitlo="git log"
alias gitl='git log --pretty="%C(yellow)%H%Creset %an %Cgreen%s%Creset "'
alias gitls="git log --stat"
alias gitll="git log -n1"
alias gitlp="git log -p"
alias gitl1="git log --pretty=oneline"
alias gitllp="git log -p -n1"
alias gitlls="git log --stat -n1"
alias gitld="git log --decorate"
alias gitlld="git log --decorate -n1"
alias gitlg="git log --graph"
alias gitlgg="git log --graph --decorate"
alias gitlggg="git log --graph --decorate --pretty=oneline"
alias gitpl="git pull origin master"
alias gitrs="git reset HEAD~1 --soft"
alias gitrr="git reset HEAD~1"
alias gitff="git format-patch -M -C ~/gitpatch/"
alias gitfo="git format-patch origin"
alias gitse="git send-email --to \"mailingonly@gmail.com\" --from \"insidepower2@gmail.com\" --suppress-cc=all"
alias gitamm="git am -3"
#alias gitlc="git --no-pager log"
alias gitno="git config --global core.pager cat"
alias gitnoo="git config --global core.pager less"
alias gitka="gitk --all"
alias sd="svn diff --diff-cmd=/usr/bin/meld"
# git log `gg filename`
alias gg='git ls-files | /bin/grep -w'
alias gitff="git ls-files"
alias gitvv="git remote -v"
alias gitlf='git log --pretty=format:"%h:%Cblue%an   %Creset%s"'

PATH=$PATH:/C/z/installed/Vim/vim73:/C/z/installed/llvm-2.9-mingw32-i386/llvm/bin
PATH=$PATH:/C/z/installed/Python32
PATH=$PATH:/C/z/installed/Python27


function gentags(){
if [ $# -eq 1 ]; then
	echo "extra path = $1"
	find $1 -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > filelist.txt
else
	echo "search for current path only"
	echo "" > filelist.txt
fi

echo "current path is ${PWD}"
find . -name "*.cpp" -o -name "*.h" -o -name "*.hpp" >> filelist.txt && \
#ctags --sort=foldcase --sort=yes --c++-kinds=+p --fields=+iaS \
#	--extra=+q --language-force=C++ -R -L filelist.txt && \
ctags --sort=foldcase --sort=yes --fields=+iaS \
	--language-force=C++ -R -L filelist.txt
#rm -rf ./filelist.txt
}

function gentagsdpca(){
EXTRA_PATH=D:\\CASDEV\\CCM_WA\\DPCARSgp\\IMX\\DPCA_iMX\\Delivery\\MMP_GENERIC\\GEN_PUBLIC
gentags "$EXTRA_PATH"
}

function gentagspath(){
if [ $# -lt 1 ]; then 
	echo "Please provide path. Application exited."
	return
fi
find "$1" -name "*.cpp" -o -name "*.h" > filelist.txt && \
ctags --sort=foldcase --sort=yes --c++-kinds=+p --fields=+iaS \
	--extra=+q --language-force=C++ -R -L filelist.txt
#rm -rf ./filelist.txt
}

function igg(){
CURRENT_DIR=`pwd`
ls .gitignore > /dev/null 2>&1
RETURN=$?
while [ $RETURN -eq 1 ] ; do
	if [ `pwd` == 'c:/' -o `pwd` == '/' ]; then
		break
	fi
	echo "file not found, we are at : " `pwd`
	cd ..
	ls .gitignore
	RETURN=$?
done

ls .gitignore > /dev/null 2>&1
RETURN=$?
if [ $RETURN = 0 ]; then
	#echo "return is good"
	gvim .gitignore &
else
	echo ".gitignore not found"
	cd $CURRENT_DIR
fi
}

################################################################################
# [ function ]:
################################################################################

function addfile() {
	#git ls-files --modified
	for file in `git ls-files --modified` ; do
		echo -e "do you want to add ${COL_GREEN}$file${COL_RESET}: "
		read YESNO
		if [ $YESNO == "y" -o $YESNO == "Y" ]; then
			CMD="git add $file"
			echo $CMD
			eval $CMD
		fi
	done
}

#set -o vi
