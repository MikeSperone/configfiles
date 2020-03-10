#!/usr/bin/env bash

echo "setting git aliases"
git config --global alias.st status
git config --global alias.aliases 'config --get-regexp ^alias\.'

git config --global alias.checkoukt checkout
git config --global alias.checokut checkout
git config --global alias.co checkout
git config --global alias.stauts status
git config --global alias.staus status
git config --global alias.statsus status
git config --global alias.ls 'log --pretty=format:"%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]" --decorate'

read -p "Would you like to set vim as your default editor? [Y]" vim_editor

if [[ "$vim_editor" = "Y" ]];
then
    git config --global core.editor `which vim`
else
    echo "Default editor not set"
fi

read -p "Would you like to set vim as your default merge tool? [Y]" vim_merge

if [[ "$vim_merge" = "Y" ]];
then
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global merge.conflictstyle diff3
    git config --global merge.prompt false
else
    echo "Default merge tool not set"
fi
