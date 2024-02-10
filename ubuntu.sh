#!/bin/bash

cwd=$PWD

update_system() {
	sudo apt --fix-broken install -y
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt autoremove -y
}

update_system


sudo apt-get install ca-certificates curl gnupg -y
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list


# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

update_system

sudo apt-get install i3 i3-wm kitty golang-go feh rofi polybar picom cargo gh wallch dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip python3-venv zathura tmux zsh gnome-tweaks gnome-shell-extensions chrome-gnome-shell dmenu ripgrep fd-find xclip wl-clipboard -y

APPS=(
	"code"
	"vlc"
	"nvim"
)

for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

code &
sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/'Noto Sans Mono' /usr/share/fonts/truetype/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Zsh configuration
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo chmod +x ./code_extension.sh
./code_extension.sh

FOLDERS=(
  "Projects"
  "Notes"
)
for folder in ${FOLDERS[@]}; do
  mkdir -p ~/workspace/$folder
done

cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp -r ./wallpapers/ ~/Pictures/
cp -r ./zsh/ ~
cp -r ./i3/ ~/.config/
cp -r ./polybar/ ~/.config/
cp -r ./rofi/ ~/.config/
cp -r ./picom/ ~/.config/
cp -r ./kitty/ ~/.config/
cp -r ./.zshrc ~
source ~/.zshrc
echo "Rebooting for the changes to take place: "
sleep 3
reboot
