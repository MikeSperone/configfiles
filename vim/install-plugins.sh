#!/bin/bash
# update DefaultConfigFiles to this system's current files
verbose=true
echo "-- Installing Vim Plugins --"
echo " "
echo "Proceed? [Y|n]"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."

    echo "copying colors..."
    cp -r ./vim/colors/** ~/.vim/colors/**

    echo "Install Powerline Fonts? [Y|n]"
    read powerline_fonts
    if [[ $powerline_fonts == "y" || $powerline_fonts == "Y" ]]; then
        echo "installing powerline fonts..."
        git clone https://github.com/powerline/fonts.git --depth=1
        ./fonts/install.sh
        rm -rf fonts
    fi


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

    echo "Install Plugins to assist with Tmux? [Y|n]"
    read tmux_plugins
    if [[ $tmux_plugins == "y" || $tmux_plugins == "Y" ]]; then
        echo " tmux navigator..."
        git clone git@github.com:christoomey/vim-tmux-navigator.git
    fi

    echo "Install Slime for Vim? (an integrated REPL for all languages) [Y|n]"
    read slimevim
    if [[ $slimevim == "y" || $slimevim == "Y" ]]; then
        echo "slime vim..."
        git clone git://github.com/jpalardy/vim-slime.git
    fi
else
    echo "You selected no, good day."
fi

echo "All done, thank you"

