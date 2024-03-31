This tool assumes that you already have Nvim installed on your machine. It will create all the dotfiles and install all the required plugins.

Run
```
sudo apt-get
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
apt-get -y install make
curl https://raw.githubusercontent.com/RealistAI/developer-machine-setup/master/bootstrap.sh | bash
```
Then run
```
sh bootstrap.sh
```
