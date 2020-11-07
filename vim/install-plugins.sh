#!/bin/bash
# update DefaultConfigFiles to this system's current files

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
VIM_CONF=$HOME/.vim

function cd_bundle_dir() {
    cd $VIM_CONF/bundle
}
function git_install() {
    git_repo=$1
    #TODO: parse directory from git repo URL
    directory=$2
    if [ -d $directory ]; then
        cd $2
        git checkout master
        git pull origin master
        cd_bundle_dir
    else
        git clone $git_repo
    fi
}

verbose=true
echo "-- Installing Vim Plugins --"
echo " "
echo "Proceed? [Y|n]"
read continue_update
if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
    echo "..."

    if [ -d $VIM_CONF ]; then
        echo "vim directory exists"
    else
        mkdir $VIM_CONF
    fi

    echo "copying colors..."
    if [ -d ~/.vim/colors ]; then
        echo "colors directory exists"
    else
        mkdir $VIM_CONF/colors
    fi
    cp -r $parent_path/vim/colors/ $VIM_CONF/
    
    echo "Install Patched NerdFonts? [Y|n]"
    read ans
    if [[ $ans == "y" || $ans == "Y" ]]; then
        echo "installing patched nerdfonts..."
        echo "jk... this isn't set up yet in the script"
        # git clone https://github.com/powerline/fonts.git --depth=1
        # ./fonts/install.sh
        # rm -rf fonts
    fi


    echo " --- Vim Plugins ---"
    echo "  pathogen..."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
            curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    cd_bundle_dir

    echo
    echo "  syntastic..."
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
    echo "  gitgutter..."
    git_install git://github.com/airblade/vim-gitgutter.git vim-gitgutter

    echo
    echo "  commentary..."
    git_install git://github.com/tpope/vim-commentary.git vim-commentary

    echo
    echo "  airline..."
    git_install https://github.com/vim-airline/vim-airline vim-airline
    git_install https://github.com/vim-airline/vim-airline-themes vim-airline-themes
    echo "source $parent_path/vimrc-airline" >> $HOME/.vimrc

    echo
    echo "  gutentags..."
    git_install https://github.com/ludovicchabant/vim-gutentags.git vim-gutentags

    echo
    echo "  javascript..."
    git_install git@github.com:pangloss/vim-javascript.git vim-javascript
    git_install git@github.com:leafgarland/typescript-vim.git typescript-vim

    echo
    echo "  auto pairs..."
    git_install git://github.com/jiangmiao/auto-pairs.git auto-pairs

    echo
    echo "  UltiSnips..."
    git_install https://github.com/SirVer/ultisnips.git ultisnips

    echo;echo;
    echo "Install Plugins to assist with Tmux? [Y|n]"
    read tmux_plugins
    if [[ $tmux_plugins == "y" || $tmux_plugins == "Y" ]]; then
        echo " tmux navigator..."
        git_install git@github.com:christoomey/vim-tmux-navigator.git vim-tmux-navigator
    fi

    echo;echo;
    echo "Install Plugins to assist with Text writing? [Y|n]"
    read writing_plugins
    if [[ $writing_plugins == "y" || $writing_plugins == "Y" ]]; then
        echo "vim-pencil"
        git_install https://github.com/vim-scripts/vim-pencil.git vim-pencil
        echo "vim-lexical"
        git_install https://github.com/reedes/vim-lexical.git vim-lexical
        echo "source $parent_path/vim-writing" >> $HOME/.vimrc
    fi

    echo;echo;
    echo "Install Slime for Vim? (an integrated REPL for all languages) [Y|n]"
    read slimevim
    if [[ $slimevim == "y" || $slimevim == "Y" ]]; then
        echo "slime vim..."
        git_install git://github.com/jpalardy/vim-slime.git vim-slime
        echo "source $parent_path/vimrc-slime" >> $HOME/.vimrc
    fi

    echo;echo;
    echo "Install Vim Calendar? [Y|n]"
    read vim_cal
    if [[ $vim_cal == "y" || $vim_cal == "Y" ]]; then
        echo " vim-calendar..."
        git_install git@github.com:itchyny/calendar.vim.git calendar.vim
        echo "let g:calendar_google_calendar = 1" >> $HOME/.vimrc
        echo "let g:calendar_google_task = 1" >> $HOME/.vimrc
    fi

else
    echo "You selected no, good day."
fi

echo "All done, thank you."
