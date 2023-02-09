echo "Copying config files"
cp -r ./config/* ~/.config

echo "#######################################################"
echo "# Installing the vim plugin manager                   #"
echo "#######################################################"
# Install the vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Refresh nvim so it knows about the plugin manager
source ~/.config/init.vim

# Install nodejs which is required for Coc
sudo apt update
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs
echo "Installed nodejs $(node -v)"
# Install all of the plugins
nvim --headless +PlugInstall +qall

