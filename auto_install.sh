#!/bin/bash

# Formatting variables
BOLD=$'\033[1m'
RED=$'\033[91m'
ORG=$'\033[38;5;208m'
GRN=$'\033[38;5;35m'
CYN=$'\033[96m'
BLU=$'\033[34m'
BBLU=$'\033[94m'
RST=$'\033[0m'
LGRN=$'\033[38;5;82m'
TICK="${GRN}${BOLD}✔${RST}"
CROSS="${RED}${BOLD}✘${RST}"

# General Install
#-------------------------------------------------------------------------------
printf -- "\n\n------------------------------------------\n"
printf -- "${BLU}-- NEOVIM AUTO INSTALL --${RST}\n"
printf -- "------------------------------------------\n"
#-------------------------------------------------------------------------------

# install log
LOG_FILE="${pwd}/install.log"
exec > >(tee -a "$LOG_FILE") 2>&1

# Time zone (checks if it is set)
if [[ -f /.dockerenv ]]; then
    printf "\n\t${CYN}Docker image detected, sym linking time zone ..${RST}\n"
    if [[ ! -e /etc/localtime ]]; then
        ln -fs /usr/share/zoneinfo/UTC /etc/localtime
    fi
fi

# User accessed variables
ARGS_INSTALL_DEPENDENCIES=true
INTERACTIVE_MODE=false
SETUP_LOCAL_NEO=false

function usage() {
    echo "Usage: (sudo) ./install.sh [<options>]"
    echo ""
    echo "Options:"
    echo "    -h, --help                               Print this help message"
    echo "    -y, --yes                                Disable confirmation prompts (answer yes to all questions)"
    echo "    --[no-]install-dependencies              Whether to automatically install external dependencies (will prompt by default)"
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -l | --local)
            ARGS_LOCAL=1
            shift
            ;;
        --overwrite)
            ARGS_OVERWRITE=1
            shift
            ;;
        -y | --yes)
            INTERACTIVE_MODE=0
            shift
            ;;
        --install-dependencies)
            shift
            ;;
        --no-install-dependencies)
            ARGS_INSTALL_DEPENDENCIES=false
            shift
            ;;
        -h | --help)
            usage
            shift
            return 0
            ;;
    esac
done


# Define install script variables
main_os=$(uname -s)
flavour=
linux=false

ubuntu=false
tumbleweed=false
red_hat=false
macos=false
install_cmd=
failures=false

if [[ $main_os == *"Linux"* ]]; then
    flavour_str=$(cat /etc/issue)
    os_release_pretty_name="$(cat /etc/os-release | grep PRETTY_NAME)"
    if [[ $os_release_pretty_name == *"Ubuntu"* ]]; then
        printf "\n${BLU}Ubuntu detected${RST}\n"
        ubuntu=true
        install_cmd=(apt-get install -y -qq)
    elif [[ $os_release_pretty_name == *"Tumbleweed"* ]]; then
        printf "\n${GRN}OpenSUSE Tumbleweed detected${RST}\n"
        tumbleweed=true
        install_cmd=(zypper install -y)
    elif [[ $os_release_pretty_name == *"Red Hat"* ]]; then
        printf "\n${RED}Red Hat detected${RST}\n"
        red_hat=true
        install_cmd=(yum install -y --allow-erasing)
    elif [[ $os_release_pretty_name == *"Arch"* ]]; then
        printf "${BBLU}Arch Linux detected${RST}\n"
        arch=true
        install_cmd=(pacman install -y)
    else
        printf "\n${RED}ERROR: Linux flavour not found. Returning 0${RST}\n"
        return 0
    fi
elif [[ $main_os == *"Mac" ]]; then
    printf "MacOS not supported yet. Returning 0\n"
    return 0
else
    printf "Main OS Not detected. Returning 0\n"
    return 0
fi

# # Check for existing neovim
# nv_version=
# nv_version_satisfied=false
# if command -v nv &> /dev/null; then
#     :
# elif command -v nvim &> /dev/null; then
#     :
# elif command -v neovim &> /dev/null; then
#     :
# else
#     printf "${ORG}Warning: NeoVim not found under aliases nv nvim neovim${RST}\n"
# fi

# Update installer and define packages
system_packages=()
npm_packages=(neovim)
rust_packages=(ripgrep tree-sitter-cli)
if [[ $ubuntu == "true" ]]; then
    printf "\n${CYN}Updating apt-get${RST}\n"
    apt-get update -y
    apt-get upgrade -y
    printf "\n${CYN}Finished updating apt-get ..${RST}\n"
    system_packages=(curl tzdata nodejs npm luarocks python3-venv)
    system_packages+=(python3-pynvim pip libclang-dev)
elif [[ $tumbleweed == "true" ]]; then
    printf "\n${CYN}Refreshing zypper${RST}\n"
    zypper dup -y
    # necessary for rust build thingies
    zypper ar -y -f https://download.opensuse.org/repositories/devel:languages:javascript/openSUSE_Tumbleweed/devel:languages:javascript.repo
    zypper refresh
    printf "\n${CYN}Finished refresh ..${RST}\n"
    system_packages=(curl quickjs timezone nodejs npm lua54-rocks python3-venv)
    system_packages+=(python3-pynvim python3-pip llvm-libclang-dev)
elif [[ $red_hat == "true" ]]; then
    printf "\n${CYN}Updating yum${RST}\n"
    yum update
    yum upgrade -y
    system_packages=(curl tzdata nodejs npm luarocks python3-venv)
    system_packages+=(python3-pynvim pip libclang-dev)
    printf "\n${CYN}Finished update ..${RST}\n"
elif $macos; then
    :
fi

# System
declare -A system_packages_status
printf "\nInstalling system packages\n"
for pkg in "${system_packages[@]}"; do
    printf "\tInstalling ${pkg}\n"
    if [[ "${pkg}" == "nodejs" || "${pkg}" == "npm" ]]; then
        "${install_cmd[@]}" $pkg > /dev/null 2>&1
    else
        "${install_cmd[@]}" $pkg
    fi
    system_packages_status["${pkg}"]=$?
    printf "\n"
done

# Unique to Ubuntu installs (I think)
if [[ $ubuntu == "true" ]]; then
    printf "\nUpdating nodejs and npm specific for Ubuntu!\n"
    apt-get remove -y -qq --purge libnode-dev nodejs npm
    apt-get autoremove -y -qq
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    printf "\tInstalling nodejs\n"
    apt-get install -y -qq nodejs > /dev/null 2>&1
    printf "\tInstalling npm\n"
    apt-get install -y -qq npm > /dev/null 2>&1
fi

# Python install
python_version_satisfied=false
if command -v python3 &> /dev/null; then
    py_version_str="$(python3 --version)"
    if [[ $py_version_str == *"3.12"* ]]; then
        python_version_satisfied=true
        printf "\nPython version >=3.12 found\n"
    elif [[ $py_version_str == *"3.11"* ]]; then
        python_version_satisfied=true
        printf "\nPython version >=3.11 found\n"
    elif [[ $py_version_str == *"3.10"* ]]; then
        python_version_satisfied=true
        printf "\nPython version >=3.10 found\n"
    elif [[ $py_version_str == *"3.9"* ]]; then
        python_version_satisfied=true
        printf "\nPython version >=3.9 found\n"
    else
        printf "${ORG}\nWarning: ${py_version_str} found. "
        printf "This is not supported.${RST}\n"
    fi
fi

# check for versions

# pip
# pip_packages=(pynvim)
# declare -A pip_packages_status
# if command -v pip &> /dev/null; then
#     for thingy in "${pip_packages[@]}"; do
#         pip install $thingy
#         pip_packages_status["${thingy}"]=$?
#     done
# else
#     printf "${ORG}Warning: No pip found, skipping install!${RST}\n"
# fi

## Node
declare -A npm_packages_status
if command -v npm &> /dev/null; then
    for thingy in "${npm_packages[@]}"; do
        npm install -g $thingy
        npm_packages_status["${thingy}"]=$?
    done
else
    printf "${ORG}Warning: No npm found, skipping install!${RST}\n"
fi

## Rust
declare -A rust_packages_status
if command -v curl &> /dev/null; then
    printf "\n${BLU}Installing ${RED}rust${BLU} with ${RED}curl${RST}\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
    # install packages
    printf "\n${BLU}Installing ${RED}rust${BLU} packages${RST}\n"
    for thingy in "${rust_packages[@]}"; do
        cargo install $thingy
        rust_packages_status["${thingy}"]=$?
    done
else
    printf "${ORG}Warning: No curl found, skipping rust install!${RST}\n"
fi

## Download NeoVim!!
#-------------------------------------------------------------------------------
nv_download_success=false
release_page="https://github.com/neovim/neovim/releases/download/stable/"
current_version="nvim-linux-x86_64.appimage"
download_path="${release_page}${current_version}"
printf "\n${BLU}Downloading NeoVim!!${RST}\n"
curl -LO --fail "${download_path}"
if [[ $? -eq 0 ]]; then
    printf "\n\t${GRN}Download success!${RST}\n"
    nv_download_success=true
    if [[ -f /.dockerenv ]]; then
        printf "\t${CYN}Docker image detected ..${RST}\n"
        printf "\t${CYN}Changing permissions ..${RST}\n"
        chmod +x "${current_version}"
        printf "\t${CYN}Extracting image ..${RST}\n"
        ./$current_version --appimage-extract
        printf "\t${CYN}Aliasing to nv ..${RST}\n\n"
        ln -s "$(pwd)/squashfs-root/usr/bin/nvim" /usr/local/bin/nv
    else
        printf "\t${CYN}User install detected ..${RST}\n"
        printf "\t${CYN}Changing permissions ..${RST}\n"
        chmod +x "${current_version}"
        printf "\t${CYN}Aliasing to nv ..${RST}\n\n"
        ln -s "$(pwd)/nvim.appimage" /usr/local/bin/nv
    fi
else
    printf "\n${ORG}Warning: NeoVim download failed!!${RST}\n"
    printf "See:https://github.com/neovim/neovim/releases\n\n"
fi
#-------------------------------------------------------------------------------

# Print summary
printf "\nInstall Summary:\n"
printf  -- "-----------------------------------------------\n\n"

printf "System:\n"
for pkg in "${!system_packages_status[@]}"; do
    if [[ ${system_packages_status[$pkg]} -eq 0 ]]; then
        printf "\t${TICK} ${pkg}\n"
    else
        failures=true
        printf "\t${CROSS} ${pkg}\n"
    fi
done

# printf "Pip:"
# for pkg in "${!pip_packages_status[@]}"; do
#     if [[ ${pip_packages_status[$pkg]} -eq 0 ]]; then
#         printf "\t${TICK} ${pkg}\n"
#     else
#         failures=true
#         printf "\t${CROSS} ${pkg}\n"
#     fi
# done

printf "Npm:\n"
for pkg in "${!npm_packages_status[@]}"; do
    if [[ ${npm_packages_status[$pkg]} -eq 0 ]]; then
        printf "\t${TICK} ${pkg}\n"
    else
        failures=true
        printf "\t${CROSS} ${pkg}\n"
    fi
done

printf "Rust:\n"
for pkg in "${!rust_packages_status[@]}"; do
    if [[ ${rust_packages_status[$pkg]} -eq 0 ]]; then
        printf "\t${TICK} ${pkg}\n"
    else
        failures=true
        printf "\t${CROSS} ${pkg}\n"
    fi
done

printf "Python:\n"
if [[ $python_version_satisfied == "true" ]]; then
    printf "\t${TICK} Python version satisfied\n"
else
    printf "\t${CROSS} Python version not satisfied\n"
    printf "\tConsider updating python system wide\n"
fi

# Install nerd fonts!
printf "\nPlease add FiraCode Nerd Font to your terminal config\n"
printf "See Manual Install ${BOLD}Terminal Config${RST}\n\n"

# NeoVim alias
printf "Add $(which nv) to aliases!!\n\n"
if [[ $failures == "true" ]]; then
    printf "\nFound install failures.\n"
    printf "Check ${LOG_FILE} for details.\n\n"
fi

