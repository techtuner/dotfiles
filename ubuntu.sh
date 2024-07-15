#!/bin/bash

cwd=$(pwd)
update_system(){
    sudo apt --fix-broken install -y
    sudo apt update -y
    sudo apt full-upgrade -y
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
}

i3_wm() {
    sudo apt install i3 i3-wm dmenu rofi wofi polybar picom feh pulseaudio -y
    cd ~/Desktop
    wget -O playerctl-2.4.1_amd64.deb https://github.com/altdesktop/playerctl/releases/download/v2.4.1/playerctl-2.4.1_amd64.deb
    sudo dpkg -i playerctl-2.4.1_amd64.deb
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install

    cd $cwd
    cp -r $cwd/i3 ~/.config
    cp -r $cwd/polybar ~/.config
    sudo chmod +x ~/.config/i3/*.sh
    sudo chmod +x ~/.config/polybar/scripts/*.sh
    sudo chmod +x ~/.config/polybar/launch.sh
}
code_setup(){
    EXTENSIONS=(
  "formulahendry.auto-close-tag"
  "formulahendry.auto-rename-tag"
  "formulahendry.auto-complete-tag"
  "aaron-bond.better-comments"
  "antfu.icons-carbon"
  "formulahendry.code-runner"
  "vadimcn.vscode-lldb"
  "naumovs.color-highlight"
  "ms-azuretools.vscode-docker"
  "editorconfig.editorconfig"
  "usernamehw.errorlens"
  "dsznajder.es7-react-js-snippets"
  "dbaeumer.vscode-eslint"
  "golang.go"
  "kisstkondoros.vscode-gutter-preview"
  "yzhang.markdown-all-in-one"
  "pkief.material-icon-theme"
  "equinusocio.vsc-material-theme"
  "equinusocio.vsc-material-theme-icons"
  "christian-kohler.npm-intellisense"
  "christian-kohler.path-intellisense"
  "ms-vscode.powershell"
  "esbenp.prettier-vscode"
  "ms-python.python"
  "rust-lang.rust-analyzer"
  "redhat.vscode-yaml"
  "twxs.cmake"
  )
    for extension in ${EXTENSIONS[@]}; do
    code --install-extension $extension
    done
}
shell_choice(){


case $shell_type in

  1)
    echo "Installing Zsh...."
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    cp -r $cwd/zsh ~
    cp $cwd/.zshrc ~

    echo "exec zsh" >> ~/.bashrc
    source ~/.bashrc
    ;;
  2)
    echo "Installing Fish..."
    sudo apt install fish -y
    cp -r ./fish/ ~/.config/
    echo "exec fish" >> ~/.bashrc
    source ~/.bashrc
    ;;
  3)
    echo "Updating Bash"
    sudo apt install bash -y
    ;;
  esac
}
install(){
sudo mkdir -p /etc/apt/keyrings

wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

wget https://releases.hyper.is/download/deb && sudo dpkg -i deb

update_system

sudo apt install git curl wget lightdm net-tools dconf-editor dconf-cli software-properties-common build-essential procps file zathura ca-certificates gnupg python3 python3-pip python3-venv tmux make cmake fzf zsh ripgrep fd-find zoxide bat gcc gdb gcc kitty docker.io docker-compose cargo adb golang gh -y
sudo apt remove apport apport-gtk -y && sudo apt purge apport apport-gtk -y
cargo install eza urlencode
SNAPS=("code" "nvim" "spotify")
for apps in ${SNAPS[@]}; do
  sudo snap install $apps --classic
done

cd $cwd
sudo cp -r ./fonts/'Fira Code' /usr/share/fonts/truetype/
sudo cp -r ./fonts/Hack /usr/share/fonts/truetype/

code&

mkdir -p ~/workspace/Projects
mkdir ~/.nvm

code_setup

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
shell_choice

cp -r ./nvim/ ~/.config/
cp ./code/settings.json ~/.config/Code/User/
cp ./code/keybindings.json ~/.config/Code/User/
cp -r ./kitty/ ~/.config/
cp -r ./Hyper/hyper.js ~/.hyper.js
cp -r ./wallpapers/ ~/Pictures/
cp ./tmux/.tmux.conf ~

}

echo "Do you want to install the i3 Windows Manager(y/n)"
read -p "Enter Choice: " wm_choice
echo "Which shell would you like to select:"
echo "1) Zsh"
echo "2) Fish"
echo "3) Bash"
read -p "Enter your choice: " shell_type
wm_choice_lc=$(echo "$wm_choice" | tr '[:upper:]' '[:lower:]')

case $wm_choice_lc in
y)
    install
    i3_wm
    ;;
n)
    install
    ;;
*)
    install
esac
