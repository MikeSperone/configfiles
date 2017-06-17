#!/bin/bash
# update DefaultConfigFiles to this system's current files
echo "-- Install Config Files --"
echo " "
echo "Install config files from f:/DefaultConfigFiles"
echo "ARE YOU SURE!! THIS WILL OVERWRITE YOUR CURRENT .vimrc AND .bash_aliases FILES!"
echo "Press [Y|n] to continue >"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."
    backup_folder="/mnt/f/DefaultConfigFiles"
    echo "vim files..."
    cp "${backup_folder}/vim/.vimrc" ~/.vimrc
    cp -r "${backup_folder}/vim/colors" ~/.vim/colors
    echo "bash aliases..."
    cp "${backup_folder}/bash/.bash_aliases" ~/.bash_aliases
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

