echo "Installing vim configuration"
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

if [[ -f $HOME/.vimrc ]]; then
    echo "Backing up old vimrc to $HOME/.vimrc.bak"
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi

echo "Copying .vimrc file to $HOME"
cp ./local.vimrc $HOME/.vimrc

echo "Would you like to install the plugins?"
echo "Press [Y|n] to continue > "
read ans
if [[ $ans == "y" || $ans == "Y" ]]; then
    echo "..."
    ./install-plugins.sh
fi

echo "Vim setup is complete."
