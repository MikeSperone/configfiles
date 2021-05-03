#!/bin/bash
#
# Tools I like to use
#   This will install all of them

source $DOTFILES_DIRECTORY/utils/detect_os.sh

echo "msee   | terminal markdown viewer"
echo "fx     | json viewer"
echo "eslint | js linter"
npm i -g msee fx fx-completion eslint

echo "todo | simple task list"
# echo "ddgr | cli duck duck go search"
if [[ "$platform" == 'mac' ]]; then
    brew install todo-txt
    # brew install ddgr
else
    echo "I did not set this up for linux yet."
fi

