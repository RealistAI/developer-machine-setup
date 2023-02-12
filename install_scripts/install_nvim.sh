#! /bin/bash
# Install Neovim
if [ ! -d /usr/bin/nvim ]; then
    echo "==============================================================================="
    echo "= Installing Neovim                                                           ="
    echo "==============================================================================="
    # Remove neovim if it was installed by apt
    sudo apt -qq remove -y neovim
    # Install Neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    
    # Make it visible globally
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    
    # Install all of the required packages for packer
    nvim --headless -c 'quitall'
    nvim --headless -c '' -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
    echo "==============================================================================="
    echo "= Done!                                                                       ="
    echo "==============================================================================="

else
    echo "==============================================================================="
    echo "= Neovim already installed                                                    ="
    echo "==============================================================================="
fi


echo "==============================================================================="
echo "= Installing python-lsp-server                                                ="
echo "==============================================================================="

# Install python-lsp-server
pip install 'python-lsp-server[all]'

echo "==============================================================================="
echo "= Done!                                                                       ="
echo "==============================================================================="

echo "==============================================================================="
echo "= Installing ripgerp which is used by telescope to scan files                 ="
echo "==============================================================================="
# Install ripgrep which is used by telescope to scan files so you can search for functions
sudo apt install ripgrep
echo "==============================================================================="
echo "= Done!                                                                       ="
echo "==============================================================================="

# Install Terraform LSP
echo "==============================================================================="
echo "= Installing terraform-ls                                                     ="
echo "==============================================================================="
# Install ripgrep which is used by telescope to scan files so you can search for functions
# GPG is required for the package signing key
sudo apt update && sudo apt install gpg
# Download the signing key to a new keyring
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform-ls
echo "==============================================================================="
echo "= Done!                                                                       ="
echo "==============================================================================="

