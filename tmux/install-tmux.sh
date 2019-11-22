echo "backup existing tmux.conf to tmux.conf.bak"
cp $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo "updating your tmux conf"
cp ./.tmux.conf $HOME/.tmux.conf

echo "copying tmux-powerline conf"
cp ./.tmux-powerlinerc $HOME/.tmux-powerlinerc
