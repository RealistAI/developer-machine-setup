#! /bin/bash

set -x

# Check if there is already a .config file
if [[ -d "$HOME/.config" ]]; then
    MOVE_CONFIG=true
fi

# Back up any config files
if [[ $MOVE_CONFIG ]]; then
    echo "Moving config"
    mv ~/.config ~/_temp_config
fi

# Create a symlink from our git repo to ~/.config
ln -sv ~/git/developer-machine-setup/xdg_config/ ~/.config

# Move the backed up configs back
if [[ $MOVE_CONFIG ]]; then
    cp -r ~/_temp_config/* ~/.config/
    rm -rf ~/_temp_config
fi
