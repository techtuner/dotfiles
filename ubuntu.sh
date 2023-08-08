#!/bin/bash

sudo apt-get update -y && sudo apt-get full-upgrade -y

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt-get update -y && sudo apt-get full-upgrade -y
sudo apt autoremove -y
sudo apt-get install curl wget gh terminator dconf-editor gnome-tweaks gnome-shell-extensions software-properties-common build-essential gdb gcc gh python3-pip -y
sudo snap install code --classic
sudo snap install nvim --classic
sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

code&

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

sudo cp -r ./fonts/'Dank Mono' /usr/share/fonts/opentype
sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype
sudo cp -r ./fonts/Lora /usr/share/fonts/truetype
sudo cp -r ./fonts/Monaco/ /usr/share/fonts/truetype
sudo cp -r ./fonts/MonoLisa/ /usr/share/fonts/truetype

cp -r ./nvim/ ~/.config/
cp -r ./terminator/ ~/.config/
cp -r ./code/settings.json ~/.config/Code/User/
cp -r ./code/keybindings.json ~/.config/Code/User/


sudo chmod +x ./code_extension.sh
./code_extension.sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvm install --lts
nvm use 18.17.0

mkdir ~/Pictures/wallpapers/
sudo cp -r ./wallpaper/Ubuntu-wallpaper.jpg ~/Pictures/wallpapers/
