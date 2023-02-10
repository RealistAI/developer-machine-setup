echo "Copying config files"
mkdir -p $HOME/.config/nvim
cp -r ./config/nvim/* ~/.config/nvim

echo "#######################################################"
echo "# Upgrading Packages and installing required          #"
echo "# dependencies                                        #"
echo "#######################################################"
sudo apt -y upgrade
sudo apt install -y zip wget tree

echo "#######################################################"
echo "# Installing Pyenv to allow you to manage python      #"
echo "# versions                                            #"
echo "#######################################################"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

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
echo "# Installing the vim plugin manager                   #"
echo "#######################################################"
# Install the vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "#######################################################"
echo "# Executing PlugInstall to install all the plugins    #"
echo "#######################################################"
# Install all of the plugins
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"

echo "#######################################################"
echo "# Executing CocInstall to install all the plugins     #"
echo "#######################################################"

# Install all of the COC requirements
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "CocInstall coc-pyright coc-markdownlint" -c "qa"

# Install Terraform Linter
wget https://github.com/juliosueiras/terraform-lsp/releases/download/v0.0.11-beta2/terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
tar -xvf terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
sudo mv terraform-lsp /usr/local/bin/


