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

sudo apt-get install dconf-editor dconf-cli net-tools software-properties-common build-essential procps curl wget file git zathura i3 i3-wm dmenu polybar pulseaudio pipewire picom ca-certificates curl gnupg python3-venv -y

sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y
sudo apt-get install  -y
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

source ~/.bashrc

APPS=("gh" "neovim" "rust" "nvm" "python" "tmux" "gcc" "cmake" "make" "fzf" "zsh" "ripgrep" "go" "docker" "bash" "fd" "bat" "eza" "zoxide" "feh" "autopep8" "gdb")
for app in ${APPS[@]}; do
  brew install $app
done

update_system

SNAPS=(
	"code"
  "alacritty"
)

for snapapp in ${SNAPS[@]}; do
	sudo snap install $snapapp --classic
done

cd ~/Desktop
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
mkdir ~/.nvm

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
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
cp -r ./wallpapers/ ~/Pictures/
cp ./tmux/.tmux.conf ~
cp -r ./zsh/ ~
cp -r .zshrc ~

echo "exec zsh" >> ~/.bashrc
source ~/.bashrc

sleep 5
reboot
