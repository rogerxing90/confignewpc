#!/bin/bash
#############  core #############
git config --global core.whitespace "fix,-indent-with-non-tab,trailing-space,cr-at-eol"
git config --global core.editor "vim"
#git config --global core.pager "cat"

#############  color #############
git config --global core.whitespace "fix,-indent-with-non-tab,trailing-space,cr-at-eol"
git config --global color.ui "auto"
git config --global color.branch auto
git config --global color.branch.current "yellow reverse"
git config --global color.branch.local "yellow"
git config --global color.branch.remote "green"
#tells git-branch and git-checkout to setup new branches so that git-pull(1)
#will appropriately merge from that remote branch. Recommended. Without this,
#you will have to add --track to your branch command or manually merge remote
#tracking branches with "fetch" and then "merge".
git config --global color.diff auto
git config --global color.diff.meta "yellow bold"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"
git config --global color.diff.whitespace "red reverse"
git config --global color.status auto
git config --global color.status.added "yellow"
git config --global color.status.changed "green"
git config --global color.status.untracked "cyan"
git config --global color.interactive auto
git config --global format.pretty "%C(yellow)%H%Creset %an %Cgreen%s%Creset "

#############  branch #############
git config --global branch.autosetupmerge "true"

#############  alias #############
git config --global alias.st "status"
git config --global alias.ci "commit"
git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.df "diff"
git config --global alias.lg "log -p"
git config --global alias.lp "log -p"

#############  push #############
git config --global push.default "matching"

#############  merge #############
git config --global merge.tool meld
#git config --global merge.tool bcompare
#git config --global mergetool.bcompare.cmd 'bcompare \\\"$LOCAL\\\" \\\"$REMOTE\\\" \\\"$BASE\\\" \\\"$MERGED\\\"'

#############  ignore #############
git config --global core.excludesfile `echo $PWD`/.gitignore

#############  sendemail #############
#git config --global sendemail.smtpencryption "tls"
#git config --global sendemail.smtpserver "smtp.gmail.com"
#git config --global sendemail.smtpuser "insidepower2@gmail.com"
#git config --global sendemail.to "mailingonly@gmail.com"
#git config --global sendemail.smtpserverport "587"
