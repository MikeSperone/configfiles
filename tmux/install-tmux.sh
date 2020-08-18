echo "backup existing tmux.conf to tmux.conf.bak"
cp $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo "updating your tmux conf"
cp ./.tmux.conf $HOME/.tmux.conf

echo "copying tmux-powerline conf"
cp ./.tmux-powerlinerc $HOME/.tmux-powerlinerc

echo "create plugins folder"
if [ -d $HOME/.tmux ]; then
    echo "$HOME/.tmux directory exists"
else
    mkdir $HOME/.tmux
fi

if [ -d $HOME/.tmux/plugins ]; then
    echo "$HOME/.tmux/plugins directory exists"
else
    mkdir $HOME/.tmux/plugins
fi

git clone https://github.com/erikw/tmux-powerline.git
