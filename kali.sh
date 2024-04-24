#! /bin/bash

cwd=$(pwd)
tools_path=~/tools
git_tools_path=$tools_path/GitTools

update_system(){
  sudo apt --fix-broken install -y
  sudo apt update -y && sudo apt full-upgrade -y && sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

update_system

NODE_MAJOR=20
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

update_system

sudo apt install adb cargo gh routersploit python3-pip python3-virtualenv onesixtyone oscanner redis-tools smbclient smbmap snmp curl dnsrecon enum4linux nodejs gobuster nbtscan nikto nmap sslscan sipvicious tnscmd10g  wkhtmltopdf libimage-exiftool-perl python3-full code golang-go python3-ldap3 python3-yaml python3-impacket rainbowcrack ldnsutils ghidra strace dsniff yersinia dhcpstarv sslstrip zaproxy steghide bloodhound nuclei armitage beef-xss maltego protobuf-compiler httrack whatweb ruby osrframework sherlock sublist3r wifiphisher dnsmasq cmake terminator gcc feroxbuster seclists -y

cargo install urlencode rustscan eza

code&

mkdir -p $tools_path

python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

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

echo "Installing pspy"
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
sudo chmod +x ./pspy64
sudo ln -s $tools_path/pspy64 /usr/bin/pspy

echo "Installing NetExec"
git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
pip install .
cd $tools_path

echo "Installing Go tools"
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install github.com/fullstorydev/grpcui/cmd/grpcui@latest
go install github.com/ropnop/kerbrute@latest
go install github.com/tomnomnom/assetfinder@latest
sudo ln -s ~/go/bin/kerbrute /usr/bin/kerbrute
sudo ln -s ~/go/bin/grpcui /usr/bin/grpcui
sudo ln -s ~/go/bin/grpcurl /usr/bin/grpcurl
sudo ln -s ~/go/bin/assetfinder /usr/bin/assetfinder

echo "Installing Postman"
sudo wget https://dl.pstmn.io/download/latest/linux_64 -O postman-linux-x64.tar.gz
sudo tar -xvzf postman-linux-x64.tar.gz
sudo ln -s $tools_path/Postman/Postman /usr/bin/postman
rm -rf postman-linux-x64.tar.gz
cd $tools_path

echo "Downloading Obsidian and Neovim"
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
sudo chmod +x nvim.appimage
sudo ln -s $tools_path/nvim.appimage /usr/bin/nvim

echo "Installig SuperEnum"
git clone https://github.com/p4pentest/SuperEnum.git
cd $tools_path/SuperEnum
sudo chmod +x superenum
sudo ln -s $tools_path/SuperEnum/superenum /usr/bin/superenum
cd $tools_path

echo "Installing Linpeas script"
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240204-ab87b191/linpeas.sh
sudo chmod +x linpeas.sh
sudo ln -s $tools_path/linpeas.sh /usr/bin/linpeas

cd $cwd

sudo cp -r $cwd/fonts/JetBrainsMono /usr/share/fonts/truetype

FOLDERS=(
"THM"
"HTB"
"CTF"
"vpns"
)

for folder in ${FOLDERS[@]}; do
	mkdir -p ~/Labs/$folder
done

# Zsh configuration
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r $cwd/code/* ~/.config/Code/User/
cp -r $cwd/wallpapers ~/Pictures/
cp -r $cwd/nvim ~/.config/
cp -r $cwd/zsh ~
cp $cwd/.zshrc ~
cp ~/tmux/.tmux.conf ~
sudo cp -r $cwd/dnsmasq/techtuner.conf /etc/dnsmasq.d/

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
    "tamasfe.even-better-toml"
    "usernamehw.errorlens"
    "ms-azuretools.vscode-docker"
    "serayuzgur.crates"
    "naumovs.color-highlight"
    "vadimcn.vscode-lldb"
    "aaron-bond.better-comments"
    "antfu.icons-carbon"
    "jaakko.black"
    "pkief.material-icon-theme"
)

for extension in ${EXTENSIONS[@]}; do
	code --install-extension $extension
done

echo "DO REMEMBER TO CHANGE THE nameserver to 127.0.0.1 in /etc/resolv.conf"
