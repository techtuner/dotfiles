#! /bin/bash

cwd=$PWD
tools_path=~/tools
git_tools_path=$tools_path/GitTools

update-system(){
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

update-system

sudo apt-get install ca-certificates curl wget gnupg software-properties-common build-essential openjdk-11-jdk -y
sudo mkdir -p /usr/share/keyrings
sudo add-apt-repository universe -y


# Node JS
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

update-system

APPS=(
  "code"
  "nvim"
  "obsidian"
  "spotify"
  "enum4linux"
  "feroxbuster"
  "zaproxy"
  "seclists"
  "ghidra"
)

for app in ${APPS[@]}; do
	sudo snap install $app --classic
done

sudo snap install rainbowcrack --beta

sudo apt-get install golang-go cargo gh dconf-editor dconf-cli net-tools gdb gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 nodejs python3-pip python3-venv zathura tmux ripgrep kitty fd-find xclip wl-clipboard fzf zsh autoconf make libpam0g-dev libcairo2-dev  libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libglib2.0-dev libxkbcommon-x11-dev libjpeg-dev libtool xutils-dev playerctl adb python3-pip python3-virtualenv onesixtyone redis-tools smbclient smbmap snmp dnsrecon gobuster nbtscan nikto nmap sslscan sipvicious wkhtmltopdf libimage-exiftool-perl python3-full python3-ldap3 python3-yaml python3-impacket  ldnsutils strace dsniff yersinia dhcpstarv steghide protobuf-compiler httrack whatweb ruby sublist3r dnsmasq libnl-3-dev libnl-genl-3-dev libssl-dev apt-transport-https libgmp-dev libgmpxx4ldbl ruby-dev ruby3.1-dev ruby3.1-doc bison icu-devtools libcurl4-openssl-dev libicu-dev libncurses-dev libreadline-dev libsqlite3-dev libxml2-dev libxslt1-dev libyaml-dev sqlite3 docker.io docker-compose i3 i3-wm dmenu rofi polybar picom -y

cargo install urlencode rustscan eza

mkdir -p $tools_path && cd $tools_path
mkdir venv
python -m venv $tools_path/venv
source $tools_path/venv/bin/activate

cd $tools_path
echo "Installing Kiterunner"
git clone https://www.github.com/assetnote/kiterunner
cd $tools_path/kiterunner
sudo make build
sudo ln -s $tools_path/kiterunner/dist/kr /usr/bin/kr
cd $tools_path

python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
pip install bluepy arjun name-that-hash

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
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
sudo ln -s ~/go/bin/kerbrute /usr/bin/kerbrute
sudo ln -s ~/go/bin/grpcui /usr/bin/grpcui
sudo ln -s ~/go/bin/grpcurl /usr/bin/grpcurl
sudo ln -s ~/go/bin/assetfinder /usr/bin/assetfinder
sudo ln -s ~/go/bin/nuclei /usr/bin/nuclei

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
cd $tools_path

mkdir -p $tools_path/metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
sudo chmod +x msfinstall
./msfinstall
cd $tools_path

echo "Installing Routersploit"
git clone https://www.github.com/threat9/routersploit
cd $tools_path/routersploit
python3 -m pip install -r requirements
python3 rsf.py
cd $tools_path

echo "Installing Sherlock"
git clone https://github.com/sherlock-project/sherlock.git
cd $tools_path/sherlock
python3 -m pip install -r requirements.txt
sudo chmod +x $tools_path/sherlock/sherlock/sherlock.py
sudo ln -s $tools_path/sherlock/sherlock/sherlock.py /usr/bin/sherlock
cd $tools_path

echo "Installing Wifiphisher"
git clone https://github.com/wifiphisher/roguehostapd.git
cd $tools_path/roguehostapd
python setup.py install
cd $tools_path
git clone https://github.com/wifiphisher/wifiphisher.git
cd $tools_path/wifiphisher
pip install scapy pbkdf2 pyric osrframework
python setup.py install
sudo ln -s $tools_path/wifiphisher/bin/wifiphisher /usr/bin/wifiphisher

cd $tools_path
echo "Installing Beef-xss"
git clone https://github.com/beefproject/beef
cd beef
./install
cd $tools_path


cd $cwd

sudo cp -r $cwd/fonts/BerkNerdFont /usr/share/fonts/truetype

FOLDERS=(
"THM"
"HTB"
"CTF"
"vpns"
)

for folder in ${FOLDERS[@]}; do
	mkdir -p ~/Labs/$folder
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

wget https://raw.githubusercontent.com/Daivasmara/daivasmara.zsh-theme/master/daivasmara.zsh-theme -P ~/.oh-my-zsh/custom/themes/

cp -r $cwd/code/* ~/.config/Code/User/
cp -r $cwd/wallpapers ~/Pictures/
cp -r $cwd/nvim ~/.config/
cp -r $cwd/zsh ~
cp -r $cwd/i3/ ~/.config
cp -r $cwd/polybar/ ~/.config
cp -r $cwd/rofi/ ~/.config
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
  "naumovs.color-highlight"
  "yzhang.markdown-all-in-one"
  "jdinhlife.gruvbox"
)

for extension in ${EXTENSIONS[@]}; do
	code --install-extension $extension
done

source ~/.zshrc
echo "DO REMEMBER TO CHANGE THE nameserver to 127.0.0.1 in /etc/resolv.conf"

sleep 3
reboot
