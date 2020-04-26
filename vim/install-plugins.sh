#!/bin/bash
# update DefaultConfigFiles to this system's current files
function bundle_dir {
    cd $HOME/.vim/bundle
}
function git_install {
    git_repo=$1
    #TODO: parse directory from git repo URL
    directory=$2
    if [ -d $directory ]; then
        cd $2
        git checkout master
        git pull origin master
        bundle_dir
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

    if [ -d ~/.vim ]; then
        echo "vim directory exists"
    else
        mkdir ~/.vim
    fi

    echo "copying colors..."
    if [ -d ~/.vim/colors]; then
        echo "colors directory exists"
    else
        mkdir ~/.vim/colors
    fi
    cp -R ./vim/colors/** ~/.vim/colors/**

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
    bundle_dir
    echo "\n  syntastic..."
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
    echo "\n  gitgutter..."
    git_install git://github.com/airblade/vim-gitgutter.git vim-gitgutter
    echo "\n  commentary..."
    git_install git://github.com/tpope/vim-commentary.git vim-commentary
    echo "\n  airline..."
    git_install https://github.com/vim-airline/vim-airline vim-airline
    git_install https://github.com/vim-airline/vim-airline-themes vim-airline-themes
    echo "source \$DOTFILES_DIRECTORY/vim/vimrc-airline" >> $HOME/.vimrc

    echo "\n  javascript..."
    git_install git@github.com:pangloss/vim-javascript.git vim-javascript
    git_install git@github.com:leafgarland/typescript-vim.git typescript-vim

    echo "\n  auto pairs..."
    git clone git://github.com/jiangmiao/auto-pairs.git auto-pairs
 
    echo "\n\nInstall Plugins to assist with Tmux? [Y|n]"
    read tmux_plugins
    if [[ $tmux_plugins == "y" || $tmux_plugins == "Y" ]]; then
        echo " tmux navigator..."
        git_install git@github.com:christoomey/vim-tmux-navigator.git vim-tmux-navigator
    fi

    echo "\n\nInstall Plugins to assist with Text writing? [Y|n]"
    read writing_plugins
    if [[ $writing_plugins == "y" || $writing_plugins == "Y" ]]; then
        echo "vim-pencil"
        git_install https://github.com/vim-scripts/vim-pencil.git vim-pencil
        echo "vim-lexical"
        git_install https://github.com/reedes/vim-lexical.git vim-lexical
    fi

    echo "\n\nInstall Slime for Vim? (an integrated REPL for all languages) [Y|n]"
    read slimevim
    if [[ $slimevim == "y" || $slimevim == "Y" ]]; then
        echo "slime vim..."
        git_install git://github.com/jpalardy/vim-slime.git vim-slime
        echo "source \$DOTFILES_DIRECTORY/vim/vimrc-slime" >> $HOME/.vimrc
    fi

    echo "\n\nInstall Vim Calendar? [Y|n]"
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

