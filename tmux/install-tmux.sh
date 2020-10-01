TMUX=$HOME/.tmux
echo "backup existing tmux.conf to tmux.conf.bak"
cp $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo "updating your tmux conf"
cp ./.tmux.conf $HOME/.tmux.conf

echo "copying tmux-powerline conf"
cp ./.tmux-powerlinerc $HOME/.tmux-powerlinerc

echo "create plugins folder"
if [ -d $TMUX ]; then
    echo "$TMUX directory exists"
else
    mkdir $TMUX
fi

if [ -d $TMUX/plugins ]; then
    echo "$TMUX/plugins directory exists"
else
    mkdir $TMUX/plugins
fi

git clone https://github.com/erikw/tmux-powerline.git $TMUX/plugins/tmux-powerline
