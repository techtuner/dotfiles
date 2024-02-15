#!/bin/bash

cwd=$PWD
update_system() {
	sudo apt --fix-broken install -y
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt autoremove -y
}
source_list() {
sudo apt-get install ca-certificates curl gnupg -y
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list


# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
}
snap_apps(){
  APPS=(
	"code"
	"vlc"
	"nvim"
  "sublime-text"
  "obsidian"
)

for app in ${APPS[@]}; do
	sudo snap install $app --classic
done
}
softwares() {
sudo apt-get install golang-go  cargo gh wallch dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip python3-venv zathura tmux terminator zsh ripgrep fd-find xclip wl-clipboard -y
}
i3_softwares() {
  softwares
  sudo apt install i3 i3-wm kitty feh rofi polybar picom dmenu -y
}
config_files(){
sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y
sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/Hack /usr/share/fonts/truetype/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


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
    "jdinhlife.gruvbox"
    "golang.go"
    "miguelsolorio.fluent-icons"
    "tamasfe.even-better-toml"
    "usernamehw.errorlens"
    "ms-azuretools.vscode-docker"
    "serayuzgur.crates"
    "naumovs.color-highlight"
    "vadimcn.vscode-lldb"
    "catppuccin.catppuccin-vsc-icons"
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
cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp -r ./wallpapers/ ~/Pictures/
cp -r ./terminator/ ~/.config/
cp -r ./zsh/ ~
cp -r ./.zshrc ~
source ~/.zshrc
}

script_start(){
  update_system
  source_list
  update_system
  snap_apps
}
i3_configs(){
  cp -r ./i3/ ~/.config/
  cp -r ./polybar/ ~/.config/
  cp -r ./rofi/ ~/.config/
  # cp -r ./picom/ ~/.config/
  cp -r ./kitty/ ~/.config/
}
echo "Do you want to setup Ubuntu with i3 or the default one?"
read -p "1) i3 2) Default Choose (1/2)" choice
echo "Your choice is $choice"

if [ $choice -eq "1" ]
then
  script_start
  i3_softwares
  code&
  config_files
  i3_configs
  sleep 3
  reboot
else
  script_start
  softwares
  code&
  config_files
  sleep 3
  reboot
fi