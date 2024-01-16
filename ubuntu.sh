#!/bin/bash

cwd=$PWD
download=~/Downloads/

read -p "Which shell do you intend to use(zsh/bash)? :" which_shell

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

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

update_system

sudo apt-get install curl wget cargo gh dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip zathura tmux zsh gnome-tweaks gnome-shell-extensions chrome-gnome-shell vim kitty ripgrep fd-find xclip wl-clipboard -y

python3 --m pip install --upgrade pip
pip install babi --user

APPS=(
	"code"
	"spotify"
	"vlc"
	"nvim"
)
for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

code &
sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/AnonymousPro/ /usr/share/fonts/truetype/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Downloading Nord theme for the Gnome Terminal"
cd $download/
git clone https://github.com/nordtheme/gnome-terminal
cd $download/gnome-terminal/src
sudo chmod +x nord.sh
./nord.sh

cd $cwd

mkdir ~/workspace
mkdir ~/workspace/Personal
cp ./.vimrc ~
cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp ./aliases.sh ~
cp -r ./wallpapers/ ~/Pictures/
cp ./.bashrc ~
source /.bashrc