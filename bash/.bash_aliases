#
#  Bash Aliases
#  Michael Sperone, 2017
#

alias reload='source ~/.bashrc'

#
#  File aliases
#
alias l='ls -al'

#
# change drives
#
alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'
alias g:='cd /mnt/g'
alias x:='cd /mnt/x'


#
# ssh aliases
#
if [ -f ~/.bash_ssh_aliases ]; then
    . ~/.bash_ssh_aliases
fi

