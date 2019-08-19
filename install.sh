#!/bin/bash
# update DefaultConfigFiles to this system's current files
echo "-- Install Config Files --"
echo " "
echo "Install config files from this directory"
echo "ARE YOU SURE!! THIS WILL OVERWRITE YOUR CURRENT .vimrc AND .bash_aliases FILES!"
echo "Press [Y|n] to continue >"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."
    ./vim/install_plugins.sh
    echo "--- BASH ---"
    echo "aliases..."
    cp ./bash/.bash_aliases ~/.bash_aliases
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

