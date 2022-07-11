#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install build-essential procps curl file git lightdm -y

# Installing Brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

killall -3 gnome-shell # used to restart the gnome shell
brew update 


# Installing Softwares

brew install tree ctags tmux ansible cmake ansiweather exa wget docker gh gcc gitui htop jq lazydocker lazygit make nmap

brew install --HEAD tree-sitter luajit nvm neovim

brew install --cask visual-studio-code pomodone wireshark

# Installing Vim-Plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g typescript typescript-language-server pyright

