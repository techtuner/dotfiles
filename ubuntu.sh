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
  "spotify"
)

for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

sudo apt-get install golang-go cargo gh dconf-editor dconf-cli net-tools software-properties-common build-essential gdb gcc cmake python3 nodejs python3-pip python3-venv zathura tmux ripgrep fd-find fzf zsh make docker.io docker-compose i3 i3-wm dmenu polybar feh pulseaudio pipewire -y

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y

cd ~/Desktop
wget -O playerctl-2.4.1_amd64.deb https://github.com/altdesktop/playerctl/releases/download/v2.4.1/playerctl-2.4.1_amd64.deb
sudo dpkg -i playerctl-2.4.1_amd64.deb
git clone https://github.com/noctuid/zscroll
cd zscroll
sudo python3 setup.py install

cd $cwd
sudo cp -r ./fonts/PlemolJP /usr/share/fonts/truetype/

code&
cargo install eza

EXTENSIONS=(
   "ms-python.python"
  "naumovs.color-highlight"
  "ms-azuretools.vscode-docker"
  "golang.go"
  "christian-kohler.path-intellisense"
  "enkia.tokyo-night"
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

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done

mkdir -p ~/workspace/Projects

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r ./nvim/ ~/.config/
cp -r ./i3/ ~/.config/
cp ./.i3status.conf ~
cp -r ./polybar/ ~/.config/
sudo chmod +x ~/.config/i3/*.sh
sudo chmod +x ~/.config/polybar/scripts/*.sh
sudo chmod +x ~/.config/polybar/launch.sh
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp -r ./alacritty ~/.config/
cp -r ./kitty ~/.config/
cp -r ./wallpapers/ ~/Pictures/
cp ./tmux/.tmux.conf ~
cp -r ./zsh/ ~
cp -r .zshrc ~

echo "exec zsh" >> ~/.bashrc
source ~/.bashrc

sleep 3
reboot
