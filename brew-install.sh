#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install build-essential procps curl file git lightdm -y
sudo apt-get install dconf-editor gnome-tweaks gnome-shell-extensions software-properties-common -y

# Installing Brew

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

killall -3 gnome-shell # used to restart the gnome shell
yes | brew update 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Installing Softwares

yes | brew install tree ctags tmux ansible cmake ansiweather exa wget docker gh gcc gitui htop jq lazydocker lazygit make nmap

yes | brew install --HEAD tree-sitter luajit nvm neovim tmux

yes | brew install --cask visual-studio-code pomodone wireshark spotify

# Installing Vim-Plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g typescript typescript-language-server pyright

sudo apt remove snapd apport apport-gtk -y
sudo apt purge snapd apport apport-gtk -y

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true


cd code
chmod +x extension.sh
./extension.sh
cd ..


mkdir ~/.config/nvim
mkdir ~/.config/lazygit
mkdir ~/.config/tmux
sudo cp -r ./fonts/'Anonymous Pro' /usr/share/fonts/truetype
sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype
sudo cp -r ./fonts/Monaco /usr/share/fonts/truetype
sudo cp -r ./fonts/'Source Code Pro' /usr/share/fonts/truetype
sudo cp -r ./fonts/'Dank Mono' /usr/share/fonts/opentype

cp ./ide.sh ~
sudo chsh -s /usr/bin/zsh
sed -i "1i exec zsh" ~/.bashrc
cp .zshrc ~
cp .bashrc ~
cp ./nvim-vim/* ~/.config/nvim/
cp ./code/settings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp ./zsh_themes/* ~/.oh-my-zsh/themes/
source ~/.bashrc
source ~/.zshrc
bash -c  "$(wget -qO- https://git.io/vQgMr)" 
