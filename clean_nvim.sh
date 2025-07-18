#!/usr/bin/bash

echo -e "\nRemoving NeoVim for Ubuntu with russbate configuration."
echo -e "\t+--> Please run using bash\n"

# Check for .config/nvim directory
echo "--> Checking .config directory ..."
if [ -d ~/.config/nvim ]; then
	echo "--> .config/nvim directory exists"
    echo "removing .config/nvim"
    rm -r ~/.config/nvim
else
	echo "--> .config/nvim directory does not exist"
fi

# Check for .local/share/nvim directory
echo "--> Checking .local directory ..."
if [ -d ~/.local/share/nvim ]; then
	echo "--> .local/share/nvim directory exists"
    printf "\tremoving .local/share/nvim"
    rm -rf ~/.local/share/nvim
else
	echo "--> .local/share/nvim directory does not exist"
fi

echo -e "--> Done ...\n"

