#! /bin/bash
# Install Neovim
if [ ! -d /usr/bin/nvim ]; then
    echo "==============================================================================="
    echo "= Installing Neovim                                                           ="
    echo "==============================================================================="
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    
    # Make it visible globally
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    nvim
    echo "==============================================================================="
    echo "= Done!                                                                       ="
    echo "==============================================================================="

else
    echo "==============================================================================="
    echo "= Neovim already installed                                                    ="
    echo "==============================================================================="
fi


if [ ! -d $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    echo "==============================================================================="
    echo "= Installing Packer                                                           ="
    echo "==============================================================================="
    # Download Packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo "==============================================================================="
    echo "= Done!                                                                       ="
    echo "==============================================================================="
else
    echo "==============================================================================="
    echo "= Packer is already installed.                                                ="
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

