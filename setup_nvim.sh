#!/usr/bin/bash

echo -e "\nSetting up NeoVim for Ubuntu with Russell's configuration."
# echo -e "\t+--> Please run using bash\n"

#if [[ "${SHELL}" == *"zsh"* ]]; then
#    echo -e "--> Please run using bash; exiting.\n"
#    exit 1
#else
#    echo "bash"
#fi

# Check for .config directory
if [ -d ~/.config ]; then
	echo "--> .config directory exists"
else
	echo "--> .config directory does not exist"
	echo "--> Creating config directory"
	mkdir ~/.config
fi

echo -e "--> Setting up sym links ...\n"
cp -rsT $(pwd)/nvim ~/.config/nvim	
echo -e "--> Done ...\n"

# echo "--> Cloning packer into .local directory ..."
# if [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
#     echo -e "--> Packer already exists! \n"
# else
#     git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#         ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# fi

