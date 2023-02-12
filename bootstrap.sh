#!/bin/bash
# This code is intended to bootstrap your development envioronment.
# It will create all the required directories and insatll all the 
# required dependencies
index_main() {
        GIT_HOME="$HOME/git/"
	# Create all the required directories
	mkdir -p $GIT_HOME
	# Install git
	sudo apt install -y git
	# Clone the developer-machine-setup repo
	cd $GIT_HOME
	git clone https://github.com/RealistAI/developer-machine-setup.git
	cd developer-machine-setup
	# Run the makefile
	make bootstrap
}

index_main
