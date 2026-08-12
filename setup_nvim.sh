#!/usr/bin/bash

echo -e "\nSetting up NeoVim for Linux with Russell's configuration.\n"
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
    if [ -d ~/.config/nvim ]; then
        printf "\tExisting configs for nvim found.\n"
        printf "\tWould you like to clear old configs?\n"
        read input
        lower="$input:l"
        if [[ $lower == "yes" || $lower == "y" ]]; then
            printf "\n\tSourcing clean_nvim.sh .."
            sleep .2
            source clean_nvim.sh
            printf "\tDone cleaning old configs ..\n\n"
            sleep .2
        else
            printf "\n\tSkipping clean ..\n"
        fi
    fi
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

