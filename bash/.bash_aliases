#
#  Bash Aliases
#  Michael Sperone, 2017
#

alias reload='source ~/.bashrc'

#
#  Detect OS
#
platform='other'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    platform='mac'
elif [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Cygwin' ]]; then
    platform='windows'
fi

#
#  File aliases
#
if [[ "$platform" == 'windows' ]]; then
    alias l='dir'
else
    alias l='ls -al'
fi

#
# change drives
#
if [ "$platform" != 'mac' ]; then
    alias c:='cd /mnt/c'
    alias d:='cd /mnt/d'
    alias e:='cd /mnt/e'
    alias f:='cd /mnt/f'
    alias g:='cd /mnt/g'
    alias x:='cd /mnt/x'
fi

#
# ssh aliases
#
if [ -f ~/.bash_ssh_aliases ]; then
    . ~/.bash_ssh_aliases
fi

