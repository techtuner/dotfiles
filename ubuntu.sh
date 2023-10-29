#!/bin/bash

cwd=$PWD

update_system(){
  sudo apt-get update -y && sudo apt-get full-upgrade -y
  sudo apt-get update --fix-missing
  sudo apt autoremove -y
}

update_system

# Node from ppa
sudo apt-get install ca-certificates curl gnupg -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

update_system

# sudo apt-get update -y && sudo apt-get full-upgrade -y
# sudo apt autoremove -y

sudo apt-get install curl wget cargo gh dconf-editor dconf-cli net-tools gnome-tweaks gnome-shell-extensions software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip vim zathura -y

python3 --m pip install --upgrade pip
pip install babi --user

cd /opt

if ! [ -f arduino-ide_2.2.1_Linux_64bit.AppImage ]; then
  sudo wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.2.1_Linux_64bit.AppImage
  sudo chmod +x arduino-ide_2.2.1_Linux_64bit.AppImage
  sudo ln -s /opt/arduino-ide_2.2.1_Linux_64bit.AppImage /usr/bin/arduinoide
fi

cd $cwd

APPS=(
  "code"
  "spotify"
  "insomnia"
  "postman"
)
for app in ${APPS[@]}
do
    sudo snap install $app --classic
done

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

code&


sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/'Dank Mono' /usr/share/fonts/opentype/

sudo chmod +x ./source_files.sh
./source_files.sh

cp -r ./nvim/ ~/.config/
cp -r ./code/settings.json ~/.config/Code/User/
cp -r ./code/keybindings.json ~/.config/Code/User/

sudo chmod +x ./code_extension.sh
./code_extension.sh

#git clone --depth 1 https://github.com/wbthomason/packer.nvim\  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

sudo cp -r ./wallpapers/ ~/Pictures/
source ~/.bashrc

# Change Gnome Settings
# profile=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
