bootstrap: pyenv pipenv nvim
	echo "All done!"

pyenv:
	echo "Installing pyenv"
	./install_scripts/install_pyenv.sh
	echo "Done installing pyenv"

pipenv:
	echo "Installing pipenv"
	./install_scripts/install_pipenv.sh
	echo "Done!"


