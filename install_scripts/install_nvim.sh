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

