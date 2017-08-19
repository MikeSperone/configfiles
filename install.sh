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
    cd ~
    backup_folder="."
    echo "--- VIM ---"
    echo "settings..."
    cp "${backup_folder}/vim/.vimrc" ~/.vimrc
    echo "colors..."
    cp -r "${backup_folder}/vim/colors" ~/.vim/colors
    echo "powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    echo " -- plugins --"
    echo "  pathogen..."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
            curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    cd ~/.vim/bundle
    echo "  syntastic..."
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
    echo "  gitgutter..."
    git clone git://github.com/airblade/vim-gitgutter.git
    echo "  commentary..."
    git clone git://github.com/tpope/vim-commentary.git
    echo "airline..."
    git clone https://github.com/vim-airline/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
    echo "  pug..."
    git clone git://github.com/digitaltoad/vim-pug.git
    git clone https://github.com/dnitro/vim-pug-complete
    echo "--- BASH ---"
    echo "aliases..."
    cp "${backup_folder}/bash/.bash_aliases" ~/.bash_aliases
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

