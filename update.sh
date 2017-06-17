#!/bin/bash
# update DefaultConfigFiles to this system's current files
echo "-- Update Config Files --"
echo " "
echo "Backing up config files to f:/DefaultConfigFiles"
echo "Press [Y|n] to continue >"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."
    backup_folder="/mnt/f/DefaultConfigFiles"
    echo "vim files..."
    cp ~/.vimrc "${backup_folder}/vim/.vimrc"
    cp -r ~/.vim/colors/ "${backup_folder}/vim/.vim/colors"
    echo "bash aliases..."
    cp ~/.bash_aliases "${backup_folder}/bash/.bash_aliases"
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

