alias reload='source ~/.bashrc'

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

source $DOTFILES_DIRECTORY/shell/bash/.bash_prompt
source $DOTFILES_DIRECTORY/shell/.shell_aliases
source $DOTFILES_DIRECTORY/shell/.shell_profile
