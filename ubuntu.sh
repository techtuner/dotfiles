#!/bin/bash

cwd=$PWD
download=~/Downloads/

update_system() {
	sudo apt --fix-broken install -y
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt autoremove -y
}

update_system


sudo apt-get install ca-certificates curl gnupg -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

update_system

sudo apt-get install cargo gh wallch brave-browser dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip zathura tmux zsh gnome-tweaks gnome-shell-extensions chrome-gnome-shell vim ripgrep fd-find xclip wl-clipboard -y

python3 --m pip install --upgrade pip
pip install babi --user

APPS=(
	"code"
	"spotify"
	"vlc"
	"nvim"
	"alacritty"
)
for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

code &
sudo apt remove apport apport-gtk firefox -y && sudo apt purge apport apport-gtk firefox -y && sudo snap remove firefox

sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/'Noto Sans Mono' /usr/share/fonts/truetype/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo chmod +x ./code_extension.sh
./code_extension.sh

mkdir -p ~/workspace/Personal/Projects
mkdir ~/workspace/Personal/Notes
cp ./.vimrc ~
cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp -r ./alacritty/ ~/.config/
cp ./aliases.sh ~
cp -r ./wallpapers/ ~/Pictures/
cp ./.bashrc ~
source ~/.bashrc