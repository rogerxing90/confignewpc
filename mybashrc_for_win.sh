alias cdd="cd .."
alias cdc="cd d: && cd /D/kn/1confignewpc"
alias findcpp='find . -name "*.cpp" -o -name "*.h"'
alias gentag='find . -name "*.cpp" -o -name "*.h > temp && D:\\kn\\uservar\\ctags.exe --sort=foldcase -R -L temp'
alias bassh='source  D:\\kn\\1confignewpc\\mybashrc_for_win.sh'
alias bashh='gvim D:\\kn\\1confignewpc\\mybashrc_for_win.sh &'
alias pp="popd"
alias p="pushd"
alias ll="ls -lah --color=auto"
alias lsd="ls -d */ --color=auto"
alias lsh="ls -ct | head -n 1"
alias lss="ls -ctrl"
alias lsa="ls -ctrla"
alias lsaa="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-1"
alias lsa5="ls -ctrla | grep -v 4096 | grep -v 65 | tail -n-5"


## copied from mybashrc
alias gits="git status"
alias gita="git commit -a"
alias gitam="git commit -a -m"
alias gitau="git add -u"
alias gitca="git commit --amend"
alias gitb="git branch"
alias gitbr="git branch -r"
alias gitc="git checkout"
alias gitcH="git checkout -f HEAD"
alias gitd="git diff"
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

PATH=$PATH:/C/z/installed/Vim/vim73
