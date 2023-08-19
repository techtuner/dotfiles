#! /bin/bash

# Global variables
cwd=$(pwd)

# Updating the repository and Upgrading the applications
sudo apt-get update -y && sudo apt-get full-upgrade -y
sudo apt autoremove -y

sudo apt-get install wget build-essential procps curl file zsh -y

# installing Oh-My-Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing LinuxBrew (HomeBrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

source ~/.profile

# Installing applications
brew update
brew install gcc
brew cask install brave-browser
brew cask install alacritty
brew install fish

# Setting Fiah as the default shell
sudo echo "/home/linuxbrew/.linuxbrew/bin/fish" >> /etc/shells
cd ~
sudo chsh -s /home/linuxbrew/.linuxbrew/bin/fish $(basename $(pwd))

cd $cwd
# Making Directories
mkdir ~/.config/bin

# Copy Configuration files
sudo cp -r ./alacritty/ ~/.config/
sudo cp -r ./fish/ ~/.config/
