# configfiles
vim, bash, git and others.
For my own usage, others are welcome to use them - I highly recommend reviewing what is in here before using these.

## Current list of config files
* .vimrc
* .bash_aliases

## Vim Setup
* Monokai colorscheme
* Netrw Directory setup
* Map Tab to Esc (just use ">>" for tabs)
* Indenting rules
* Line Numbers

## Vim Plugins
* [Pathogen](https://github.com/tpope/vim-pathogen) - plug-in installer
* [Syntastic](https://github.com/vim-syntastic/syntastic) - syntax checker
* [Git Gutter](https://github.com/airblade/vim-gitgutter)
* [Airline](https://github.com/vim-airline/vim-airline) - status/tabline
* [Airline Themes](https://github.com/vim-airline/vim-airline-themes)
* [Commentary](https://github.com/tpope/vim-commentary) - comments shortcuts
* [Gutentags](https://github.com/ludovicchabant/vim-gutentags.git) - ctag generator

## This is specific to my computer
If you are wanting to use this on your computer, I'm starting to add more general
considerations to allow install everywhere (OSX, Linux, Windows), but you
should still browse the .sh scripts and files to confirm files and locations.

## install will overwrite your files!!
to install run:  `./install.sh`

## to backup your current files (this will overwrite where this is stored)
first update backup.sh so that the directory where this is stored is noted in `backup_directory`

then run `./backup.sh`
