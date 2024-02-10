#! /bin/bash

cwd=$(pwd)
tools_path=~/tools
git_tools_path=$tools_path/GitTools

update_system(){
  sudo apt --fix-broken install -y
  sudo apt update && sudo apt full-upgrade -y && sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

update_system

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main > /etc/apt/sources.list.d/vscode.list'
rm -rf packages.microsoft.gpg

sudo apt install name-that-hash adb cargo routersploit python3-pip python3-virtualenv onesixtyone oscanner redis-tools smbclient smbmap snmp seclists curl dnsrecon enum4linux feroxbuster gobuster nbtscan nikto nmap sslscan sipvicious tnscmd10g  wkhtmltopdf libimage-exiftool-perl code golang-go python3-virtualenv python3-ldap3 python3-yaml python3-impacket rainbowcrack ldnsutils ghidra strace dsniff yersinia dhcpstarv sslstrip zaproxy dvwa steghide bloodhound juice-shop nuclei armitage beef-xss maltego protobuf-compiler httrack whatweb ruby osrframework sherlock sublist3r wifiphisher dnsmasq cmake terminator gcc -y

cargo install urlencode rustscan eza

code&

mkdir -p $tools_path
python -m pip install pip==22.2.2 --upgrade --break-system-packages

python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

python3 -m pip install --upgrade git+https://github.com/fportantier/habu.git

cd $tools_path
echo "Installing Kiterunner"
git clone https://www.github.com/assetnote/kiterunner
cd $tools_path/kiterunner
sudo make build
sudo ln -s $tools_path/kiterunner/dist/kr /usr/bin/kr
cd $tools_path

echo "Installing GitTools"
git clone https://github.com/internetwache/GitTools
cd $git_tools_path/Dumper/
sudo chmod +x gitdumper.sh
sudo ln -s $git_tools_path/Dumper/gitdumper.sh /usr/bin/gitdumper
cd $git_tools_path/Finder/
pip install -r requirements.txt
sudo chmod +x gitfinder.py
sudo ln -s $git_tools_path/Finder/gitfinder.py /usr/bin/gitfinder
cd $git_tools_path/Extractor/
sudo chmod +x extractor.sh
sudo ln -s $git_tools_path/Extractor/extractor.sh /usr/bin/gitextractor
cd $tools_path

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
sudo chmod +x ./pspy64
sudo ln -s $tools_path/pspy64 /usr/bin/pspy

go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install github.com/fullstorydev/grpcui/cmd/grpcui@latest
go install github.com/ropnop/kerbrute@latest
sudo ln -s ~/go/bin/kerbrute /usr/bin/kerbrute
sudo ln -s ~/go/bin/grpcui /usr/bin/grpcui
sudo ln -s ~/go/bin/grpcurl /usr/bin/grpcurl

sudo wget https://dl.pstmn.io/download/latest/linux_64 -O postman-linux-x64.tar.gz
sudo tar -xvzf postman-linux-x64.tar.gz
sudo ln -s $tools_path/Postman/Postman /usr/bin/postman
rm -rf postman-linux-x64.tar.gz
cd $tools_path

wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
sudo chmod +x nvim.appimage
sudo ln -s $tools_path/nvim.appimage /usr/bin/nvim

git clone https://github.com/p4pentest/SuperEnum.git
cd $tools_path/SuperEnum
sudo chmod +x superenum
sudo ln -s $tools_path/SuperEnum/superenum /usr/bin/superenum
cd $tools_path

wget https://github.com/carlospolop/PEASS-ng/releases/download/20240204-ab87b191/linpeas.sh
sudo chmod +x linpeas.sh
sudo ln -s $tools_path/linpeas.sh /usr/bin/linpeas

cd $cwd
sudo cp -r $cwd/fonts/'Fira Code' /usr/share/fonts/truetype
sudo cp -r $cwd/fonts/'Noto Sans Mono' /usr/share/fonts/truetype

mkdir ~/Labs
FOLDERS=(
"THM"
"HTB"
"CTF"
"CTF/Pico"
"CTF/Embed"
)

for folder in ${FOLDERS[@]}; do
	mkdir -p ~/Labs/$folder
done

# Zsh configuration
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp -r $cwd/code/* ~/.config/Code/User/
cp -r $cwd/wallpapers ~/Pictures/
cp -r nvim ~/.config/
cp -r $cwd/zsh ~
cp $cwd/.zshrc ~
cp ~/tmux/.tmux.conf ~
sudo cp -r $cwd/dnsmasq/techtuner.conf /etc/dnsmasq.d/

EXTENSIONS=(
 "golang.go"
  "christian-kohler.path-intellisense"
  "ms-python.python"
  "ms-python.black-formatter"
  "rust-lang.rust-analyzer"
  "ms-python.vscode-pylance"
  "vadimcn.vscode-lldb"
  "serayuzgur.crates"
  "tamasfe.even-better-toml"
  "ms-azuretools.vscode-docker"
  "catppuccin.catppuccin-vsc-icons"
  "rangav.vscode-thunder-client"
  "nullxception.cherry-theme"
)

for extension in ${EXTENSIONS[@]}; do
	code --install-extension $extension
done

echo "DO REMEMBER TO CHANGE THE nameserver to 127.0.0.1 in /etc/resolv.conf"
