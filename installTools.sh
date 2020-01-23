#!/bin/bash
#
# Tools I like to use
#   This will install all of them

source ./utils/detect_os.sh

echo "msee | terminal markdown viewer"
echo "fx   | json viewer"
npm i -g msee fx

echo "todo | simple task list"
if [[ "$platform" == 'mac' ]]; then
    brew install todo-txt
else
    echo "I did not set this up for linux yet."
fi

