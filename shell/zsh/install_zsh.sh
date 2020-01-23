echo "install oh my zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing powerlevel 10k theme"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k

echo "copying p10k config file"
cp shell/zsh/.p10k.zsh $HOME/.p10k.zsh
