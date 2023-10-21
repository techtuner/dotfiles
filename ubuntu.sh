#!/bin/bash

cwd=$PWD

sudo apt-get update -y && sudo apt-get full-upgrade -y

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Install Rustup
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source "$HOME/.cargo/env"

sudo apt-get update -y && sudo apt-get full-upgrade -y
sudo apt autoremove -y

sudo apt-get install curl wget cargo gh dconf-editor dconf-cli net-tools gnome-tweaks gnome-shell-extensions software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 python3-pip -y

cd /opt
sudo wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.2.1_Linux_64bit.AppImage
sudo chmod +x arduino-ide_2.2.1_Linux_64bit.AppImage
sudo ln -s /opt/https://downloads.arduino.cc/arduino-ide/arduino-ide_2.2.1_Linux_64bit.AppImage /usr/bin/arduinoide

cd $c wd

sudo snap install code --classic
sudo snap install nvim --classic
sudo snap install spotify --classic

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

code&

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/'Dank Mono' /usr/share/fonts/opentype/

sudo chmod +x ./source_files.sh
./source_files.sh

cp -r ./nvim/ ~/.config/
cp -r ./code/settings.json ~/.config/Code/User/
cp -r ./code/keybindings.json ~/.config/Code/User/

sudo chmod +x ./code_extension.sh
./code_extension.sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvm install --lts
nvm use 18.17.0

cat ./gnome-terminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/

sudo cp -r ./wallpapers/wallpaper.png ~/Pictures
source ~/.bashrc
