# configfiles
vim, bash, git and others.
For my own usage, others are welcome to use them - I highly recommend reviewing what is in here before using these.

## Current list of files
.vimrc

.vim/colors/<colorscheme_files>

.bash_aliases

# Caveats
## This is specific to my computer
Though it uses basically general files and locations, you should browse the .sh scripts and files to confirm files and locations

# install will overwrite your files!!
to install run:  `./install.sh`

# to backup your current files (this will overwrite where this is stored)
first update update.sh so that the directory where this is stored is noted in `backup_directory`

then run `./update.sh`
