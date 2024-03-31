bootstrap: dependencies link pyenv pipenv nvim

link:
	./install_scripts/setup_links.sh

pyenv:
	./install_scripts/install_pyenv.sh

pipenv:
	./install_scripts/install_pipenv.sh

nvim:
	./install_scripts/install_nvim.sh

dependencies:
	sudo apt-get update
	sudo apt-get install -y python3 python3-pip
	sudo apt-get install -y make cmake git xclip tree tmux
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev git
	sudo apt-get install -y gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
