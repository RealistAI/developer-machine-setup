echo "Copying config files"
cp -r ./config/* ~/.config

# Install the vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Install nodejs which is required for Coc
sudo apt install -y nodejs

# Install all of the plugins
nvim --headless +PlugInstall +qall

