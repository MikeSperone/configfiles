#!/bin/bash
# update DefaultConfigFiles to this system's current files
verbose=true
echo "-- Installing Vim Config --"
echo " "
echo "ARE YOU SURE!! THIS WILL OVERWRITE YOUR CURRENT .vimrc FILES!"
echo "Press [Y|n] to continue >"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."

    echo "backing up current vim setup..."
    backup_folder="~/config_backup"
    mkdir $backup_folder
    cp ~/.vimrc $backup_folder/.vimrc
    cp ~/.vim/colors/** $backup_folder

    echo "copying vimrc..."
    cp ./vim/.vimrc ~/.vimrc

    echo "copying colors..."
    cp -r ./vim/colors ~/.vim/colors

    echo "installing powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..

    rm -rf fonts

    echo " --- Vim Plugins ---"
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
    echo "  airline..."
    git clone https://github.com/vim-airline/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

    # I think I might not want to use pug anymore
    # echo "  pug..."
    # git clone git://github.com/digitaltoad/vim-pug.git
    # git clone https://github.com/dnitro/vim-pug-complete
else
    echo "You selected no, good day"
fi

echo "All done, thank you"

