#!/bin/bash

cwd=$PWD
update_system() {
	sudo apt --fix-broken install -y
	sudo apt update -y
	sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
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

APPS=(
	"code"
	"nvim"
  "obsidian"
  "spotify"
  "alacritty"
)

for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

sudo apt-get install golang-go cargo gh dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip python3-venv zathura tmux ripgrep i3 i3-wm rofi polybar fd-find xclip wl-clipboard dmenu fzf feh fish picom autoconf make  libpam0g-dev libcairo2-dev  libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev  libxkbcommon-x11-dev libjpeg-dev libtool xutils-dev playerctl -y

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

cd ~/.config
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh

cd $cwd

sudo cp -r ./fonts/JetBrainsMono /usr/share/fonts/truetype/
sudo cp -r ./fonts/BerkNerdFont /usr/share/fonts/truetype/

code&
cargo install eza

EXTENSIONS=(
    "rust-lang.rust-analyzer"
    "artdiniz.quitcontrol-vscode"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "esbenp.prettier-vscode"
    "christian-kohler.path-intellisense"
    "yzhang.markdown-all-in-one"
    "sumneko.lua"
    "kisstkondoros.vscode-gutter-preview"
    "golang.go"
    "miguelsolorio.fluent-icons"
    "tamasfe.even-better-toml"
    "usernamehw.errorlens"
    "ms-azuretools.vscode-docker"
    "serayuzgur.crates"
    "naumovs.color-highlight"
    "vadimcn.vscode-lldb"
    "catppuccin.catppuccin-vsc-icons"
    "marlosirapuan.nord-deep"
    "jdinhlife.gruvbox"
    "aaron-bond.better-comments"
)

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done

FOLDERS=(
  "Projects"
  "Notes"
)
for folder in ${FOLDERS[@]}; do
  mkdir -p ~/workspace/$folder
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd /tmp
git clone https://github.com/noctuid/zscroll && cd zscroll && sudo python3 setup.py install

cd $cwd

cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp -r ./wallpapers/ ~/Pictures/
cp -r ./kitty/ ~/.config/
cp -r ./i3/ ~/.config/
cp -r ./polybar/ ~/.config/
cp -r ./rofi/ ~/.config/
cp -r ./picom/ ~/.config/
cp ./tmux/.tmux.conf ~
cp -r ./fish/ ~/.config/

sudo chmod +x ~/.config/i3/*.sh
sudo chmod +x ~/.config/polybar/scripts/*.sh
sudo chmod +x ~/.config/polybar/launch.sh
echo "exec fish" >> ~/.bashrc
source ~/.bashrc

sleep 3
reboot
