#!/bin/bash


wget "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb"
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit


# Installation

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install spotify-client -y
sudo apt-get install gh -y
sudo apt-get install code -y
sudo apt-get install tmux -y
sudo apt-get install build-essential app-transport-https gdb gcc ca-certificates libedit-dev g++ -y
sudo apt-get install htop fzf jq-y
sudo apt-get install python3-pip docker-ce -y
sudo apt-get install dconf-editor gnome-tweaks gnome-shell-extensions software-properties-common -y
sudo apt-get install netcat nmap wireshark -y
nvm install node -y

sudo dpkg -i nvim-linux64.deb

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Remove Few apps

sudo apt remove snapd -y
sudo apt purge snapd -y
sudo apt remove apport apport-gtk -y
sudo apt purge apport apport-gtk -y

# Dash to Dock

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

# Install Vscode Extensions

cd code
chmod +x extension.sh
./extension.sh
cd ..

# Copying and Creating File and Folder

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
cp -r ./nvim-vim/* ~/.config/nvim/
cp ./code/settings.json ~/.config/Code/User/
cp ./tmux/.tmux.conf ~
cp ./zsh_themes/* ~/.oh-my-zsh/themes/
source ~/.bashrc
source ~/.zshrc
bash -c  "$(wget -qO- https://git.io/vQgMr)" 
