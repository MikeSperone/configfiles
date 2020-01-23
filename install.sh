#!/bin/bash
# update DefaultConfigFiles to this system's current files
echo "-- Install Config Files --"
echo " "
echo "Install config files from this directory"

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

## Vim Config Setup
echo "Would you like to install the vim configuration?"
echo "Press [Y|n] to continue >"
read vim_config 
if [[ $vim_config == "y" || $vim_config == "Y" ]]; then
    echo "..."
    ./vim/install-vim.sh
else
    echo "skipping vim config"
fi

## Shell Config Setup
echo "Would you like to install your shell configuration?"
echo "Press [Y|n] to continue >"
read sh_config 
if [[ $sh_config == "y" || $sh_config == "Y" ]]; then
    echo "shell aliases..."
    cp ./shell/.shell_aliases $HOME/.shell_aliases

    echo "Would you like to install a zsh configuration?"
    echo "Press [Y|n] to continue >"
    read zsh_config
    if [[ $zsh_config == "y" || $zsh_config == "Y" ]]; then
        ./shell/zsh/install_zsh.sh
    else
        echo "skipping zsh config"
    fi

    echo "Would you like to install a bash configuration?"
    echo "Press [Y|n] to continue >"
    read bash_config
    if [[ $bash_config == "y" || $bash_config == "Y" ]]; then
        echo "aliases..."
        cp ./bash/.bash_aliases $HOME/.bash_aliases
    else
        echo "skipping bash config"
    fi
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

