#!/bin/bash

cwd=$PWD
update_system(){
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

update_system

wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

update_system

sudo apt install git curl wget lightdm net-tools dconf-editor dconf-cli software-properties-common build-essential procps file zathura i3 i3-wm dmenu polybar pulseaudio pipewire picom ca-certificates gnupg python3 python3-pip python3-venv tmux make cmake fzf zsh ripgrep fd-find zoxide bat feh gcc gdb gcc kitty docker.io docker-compose cargo adb golang -y

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

cargo install eza

SNAPS=("code" "nvim" "spotify")
for apps in ${SNAPS[@]}; do
  sudo snap install $apps --classic
done

cd ~/Desktop/

wget -O playerctl-2.4.1_amd64.deb https://github.com/altdesktop/playerctl/releases/download/v2.4.1/playerctl-2.4.1_amd64.deb
sudo dpkg -i playerctl-2.4.1_amd64.deb
git clone https://github.com/noctuid/zscroll
cd zscroll
sudo python3 setup.py install

cd $cwd
sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/JetBrainsMono /usr/share/fonts/truetype/

code&

EXTENSIONS=(
  "ms-python.python"
  "naumovs.color-highlight"
  "ms-azuretools.vscode-docker"
  "golang.go"
  "christian-kohler.path-intellisense"
  "adorabilis.nord-midnight"
  "redhat.vscode-yaml"
  "aaron-bond.better-comments"
  "twxs.cmake"
  "vadimcn.vscode-lldb"
  "editorconfig.editorconfig"
  "usernamehw.errorlens"
  "kisstkondoros.vscode-gutter-preview"
  "yzhang.markdown-all-in-one"
  "rust-lang.rust-analyzer"
  "pkief.material-icon-theme"
  "antfu.icons-carbon"
  )

for extension in ${EXTENSIONS[@]}; do
   code --install-extension $extension
done

mkdir -p ~/workspace/Projects
mkdir ~/.nvm

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r ./nvim/ ~/.config/
cp -r ./i3/ ~/.config/
cp -r ./polybar/ ~/.config/
sudo chmod +x ~/.config/i3/*.sh
sudo chmod +x ~/.config/polybar/scripts/*.sh
sudo chmod +x ~/.config/polybar/launch.sh
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp -r ./kitty/ ~/.config/
cp -r ./wallpapers/ ~/Pictures/
cp ./tmux/.tmux.conf ~
cp -r ./zsh/ ~
cp -r .zshrc ~

echo "exec zsh" >> ~/.bashrc
source ~/.bashrc

nvm install --lts
nvm use --lts

sleep 5
reboot
