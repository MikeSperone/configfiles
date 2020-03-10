#!/bin/bash
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

