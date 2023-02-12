#! /bin/bash

# Run the pyenv bootstrap script
if [ ! -d $HOME/.pyenv ]; then
    echo "==============================================================================="
    echo "= Installing Pyenv                                                            ="
    echo "==============================================================================="
    curl https://pyenv.run | bash
    
    # Add the required entries to the .bash_profile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    
    # reset the shell
    exec "$SHELL"

    echo "==============================================================================="
    echo "= Done!                                                                       ="
    echo "==============================================================================="
else
    echo "==============================================================================="
    echo "= Pyenv is already installed                                                  ="
    echo "==============================================================================="
fi
