echo "Copying config files"
cp -r ./config/* ~/.config/

echo "#######################################################"
echo "# Installing the vim plugin manager                   #"
echo "#######################################################"
# Install the vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install nodejs which is required for Coc
echo "#######################################################"
echo "# Installing Nodejs which is required for code        #"
echo "# completion                                          #"
echo "#######################################################"
sudo apt update
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs
echo "Installed nodejs $(node -v)"

echo "#######################################################"
echo "# Executing PlugInstall to install all the plugins    #"
echo "#######################################################"
# Install all of the plugins
nvim --headless +PlugInstall +qall
nvim --headless +qall

