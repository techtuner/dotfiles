# Importing Libraries
import os
import subprocess

# Global Variables
current_path = os.getcwd()
user = os.getlogin()
home = f"/home/{user}"
tools_path = "/opt"
git_tools_path = f"{tools_path}/GitTools"


## Add Code to sources list
def code_neovim():
    os.system(
        "wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
    )
    os.system(
        "sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/"
    )
    os.system(
        "sudo sh -c 'echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list'"
    )
    os.system("rm -rf packages.microsoft.gpg")


# Update and Upgrade the linux system
def update_upgrade():
    os.system("sudo apt-get update -y")
    os.system("sudo apt-get full-upgrade -y")
    os.system("sudo apt autoremove -y")


# Install Apps and Dependencies
def install_apps():
    apps = "bless name-that-hash adb cargo routersploit python3-pip curl dnsrecon enum4linux python3-virtualenv feroxbuster gobuster impacket-scripts nbtscan nikto onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf libimage-exiftool-perl code golang-go python3-virtualenv python3-ldap3 python3-yaml python3-impacket rainbowcrack ldnsutils ghidra strace dsniff yersinia dhcpstarv sslstrip zaproxy dvwa steghide bloodhound juice-shop nuclei smbclient armitage beef-xss maltego protobuf-compiler httrack whatweb ruby osrframework vim"
    apps_list = apps.split(" ")
    for app in apps_list:
        os.system(f"sudo apt-get install {app} -y")
    os.system("python -m pip install pip==22.2.2 --upgrade --break-system-packages")
    os.system("cargo install urlencode")
    os.system("cargo install rustscan")
    os.system(
        "sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git"
    )
    os.chdir(tools_path)
    os.system("sudo wget https://download.sysinternals.com/files/PSTools.zip")
    os.system("sudo mkdir PSTools")
    os.system("sudo unzip PSTools.zip -d PSTools")
    os.system("sudo rm -rf PSTools.zip")
    os.chdir(tools_path)
    os.system(
        "sudo wget https://storage.googleapis.com/caido-releases/v0.28.0/caido-desktop-linux-v0.28.0-9799aa77.AppImage"
    )
    os.system(
        f"sudo chmod +x {tools_path}/caido-desktop-linux-v0.28.0-9799aa77.AppImage"
    )
    os.system(
        f"sudo ln -s {tools_path}/caido-desktop-linux-v0.28.0-9799aa77.AppImage /usr/bin/caido"
    )
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/internetwache/GitTools")
    os.chdir(f"{git_tools_path}/Dumper/")
    os.system("sudo chmod +x gitdumper.sh")
    os.system(f"sudo ln -s {git_tools_path}/Dumper/gitdumper.sh /usr/bin/gitdumper")
    os.chdir(git_tools_path)
    os.chdir(f"{git_tools_path}/Finder/")
    os.system("pip install -r requirements.txt")
    os.system("sudo chmod +x gitfinder.py")
    os.system(f"sudo ln -s {git_tools_path}/Finder/gitfinder.py /usr/bin/gitfinder")
    os.chdir(git_tools_path)
    os.chdir(f"{git_tools_path}/Extractor/")
    os.system("sudo chmod +x extractor.sh")
    os.system(
        f"sudo ln -s {git_tools_path}/Extractor/extractor.sh /usr/bin/gitextractor"
    )
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/yoelbassin/DHCP-starvation.git")
    os.chdir(f"{tools_path}/DHCP-starvation")
    os.system("sudo chmod +x dhcpStarvation.py")
    os.system(
        f"sudo ln -s {tools_path}/DHCP-starvation/dhcpStarvation.py /usr/bin/dhcpStarvation"
    )
    os.chdir(tools_path)
    os.system(
        "python3 -m pip install --upgrade git+https://github.com/fportantier/habu.git"
    )
    os.system("go install github.com/gophish/gophish@latest")
    os.system("sudo git clone https://github.com/cwinfosec/revshellgen.git")
    os.system(f"cd {tools_path}/revshellgen")
    os.system(f"sudo chmod +x {tools_path}/revshellgen/revshellgen.py")
    os.system(
        f"sudo ln -s {tools_path}/revshellgen/revshellgen.py /usr/bin/revshellgen"
    )
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/fortra/impacket.git")
    os.system(f"{tools_path}/impacket")
    os.system("sudo apt install python3-impacket")
    os.system(f"sudo python3 {tools_path}/impacket/setup.py install")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/bahatiphill/BillCipher")
    os.chdir(f"{tools_path}/BillCipher")
    os.system("pip install -r requirements.txt")
    os.system("pip3 install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/BillCipher/")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/sherlock-project/sherlock.git")
    os.chdir(f"{tools_path}/sherlock")
    os.system("python3 -m pip install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/sherlock/sherlock/sherlock.py")
    os.system(
        f"sudo ln -s {tools_path}/sherlock/sherlock/sherlock.py /usr/bin/sherlock"
    )
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/s0md3v/Photon")
    os.chdir(f"{tools_path}/Photon")
    os.system("python3 -m pip install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/Photon/photon.py")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/Moham3dRiahi/Th3inspector.git")
    os.chdir(f"{tools_path}/Th3inspector")
    os.system(f"sudo chmod +x {tools_path}/Th3inspector/install.sh")
    os.system(f"sudo {tools_path}/Th3inspector/install.sh")
    os.chdir(tools_path)
    os.system("pip install raccoon-scanner")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/s0md3v/ReconDog")
    os.chdir(f"{tools_path}/ReconDog")
    os.system(f"sudo chmod +x {tools_path}/ReconDog/dog")
    os.system(f"sudo ln -s {tools_path}/ReconDog/dog /usr/bin/dog")
    os.chdir(tools_path)
    os.system(
        "sudo wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64"
    )
    os.system("sudo chmod +x ./pspy64")
    os.system(f"sudo ln -s {tools_path}/pspy64 /usr/bin/pspy")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/aboul3la/Sublist3r.git")
    os.chdir(f"{tools_path}/Sublist3r")
    os.system("sudo pip install -r requirements.txt")
    os.system(f"sudo ln -s {tools_path}/Sublist3r/sublist3r.py /usr/bin/sublist3r")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/ffuf/ffuf")
    os.chdir(f"{tools_path}/ffuf")
    os.system("go get")
    os.system("go build")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/wifiphisher/wifiphisher.git")
    os.chdir(f"{tools_path}/wifiphisher")
    os.system("sudo python setup.py install")
    os.chdir(tools_path)
    os.system("sudo git clone https://www.github.com/ticarpi/jwt_tool")
    os.chdir(f"{tools_path}/jwt_tool")
    os.system("pip install termcolor cprint arjun requests pycryptodomex prowler")
    os.system("sudo chmod +x jwt_tool.py")
    os.system(f"sudo ln -s {tools_path}/jwt_tool/jwt_tool.py /usr/bin/jwt_tool")
    os.chdir(tools_path)
    os.system("sudo git clone https://www.github.com/assetnote/kiterunner")
    os.chdir(f"{tools_path}/kiterunner")
    os.system("sudo make build")
    os.chdir(f"{tools_path}/kiterunner/dist/")
    os.system(f"sudo ln -s {tools_path}/kiterunner/dist/kr /usr/bin/kr")
    os.chdir(tools_path)
    os.system("go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest")
    os.system("go install github.com/fullstorydev/grpcui/cmd/grpcui@latest")
    os.system("go install github.com/ropnop/kerbrute@latest")
    os.system(f"sudo ln -s {home}/go/bin/kerbrute /usr/bin/kerbrute")
    os.system(f"sudo ln -s {home}/go/bin/grpcui /usr/bin/grpcui")
    os.system(f"sudo ln -s {home}/go/bin/grpcurl /usr/bin/grpcurl")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/TebbaaX/GRecon.git")
    os.chdir(f"{tools_path}/GRecon")
    os.system("sudo pip install -r requirements.txt")
    os.chdir(tools_path)

    os.system(
        "sudo wget https://dl.pstmn.io/download/latest/linux_64 -O postman-linux-x64.tar.gz"
    )
    os.system("sudo tar -xvzf postman-linux-x64.tar.gz")
    os.system(f"sudo ln -s {tools_path}/Postman/Postman /usr/bin/postman")
    os.chdir(tools_path)
    os.system(
        "sudo wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.3/jython-standalone-2.7.3.jar"
    )
    os.system("sudo rm -rf postman-linux-x64.tar.gz")
    os.system(
        "sudo git clone https://github.com/p4pentest/SuperEnum.git && cd SuperEnum"
    )
    os.system("sudo chmod +x superenum")
    os.system(f"sudo ln -s {tools_path}/SuperEnum/superenum /usr/bin/superenum")
    os.chdir(tools_path)
    os.system(
        f"git clone https://github.com/zsh-users/zsh-syntax-highlighting.git {home}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    )
    os.system(
        f"git clone https://github.com/zsh-users/zsh-autosuggestions {home}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    )
    os.chdir(current_path)


# Fonts I use for Code Editor and Terminal
os.system(f"sudo cp -r {current_path}/fonts/'Comic Code' /usr/share/fonts/opentype")
os.system(f"sudo cp -r {current_path}/fonts/'Fira Code' /usr/share/fonts/truetype")
os.system(f"sudo cp -r {current_path}/fonts/'PlemolJP' /usr/share/fonts/truetype")


# Create Boxes Folder to store HTB and THM boxes solution
def labs():
    os.mkdir(f"{home}/Labs")
    folder_list = [
        "hackthebox",
        "tryhackme",
        "capturetheflag",
        "capturetheflag/Pico",
        "capturetheflag/Embed",
        "capturetheflag/Meta",
    ]
    for folder in folder_list:
        os.mkdir(f"{home}/Labs/{folder}")


os.mkdir(f"{home}/vpns")


# Editor Configs and wallpaper
def copy_configs():
    os.system(f"sudo cp -r {current_path}/.bashrc {home}")
    # os.system(f"sudo cp -r {current_path}/kitty/ {home}/.config/")
    # os.system(f"sudo cp -r {current_path}/nvim/ {home}/.config/")
    # os.system(f"sudo cp -r {current_path}/neofetch/ {home}/.config/")
    os.system(f"cp -r {current_path}/wallpapers /{home}/Pictures")
    os.system(f"cp -r {current_path}/zsh/ {home}")
    os.system(f"cp -r {current_path}/.vimrc {home}/")
    os.system(f"cp -r {current_path}/tmux/.tmux.conf {home}/")
    os.system(f"cp -r {current_path}/.zshrc {home}/")


# Code Extension
def code_extensions():
    extensions = [
        "golang.go",
        "christian-kohler.path-intellisense",
        "ms-python.python",
        "ms-python.black-formatter",
        "rust-lang.rust-analyzer",
        "ms-python.vscode-pylance",
        "vadimcn.vscode-lldb",
        "serayuzgur.crates",
        "tamasfe.even-better-toml",
        "ms-azuretools.vscode-docker",
        "beardedbear.beardedicons",
        "rangav.vscode-thunder-client",
        "nur.just-black",
    ]
    for extension in extensions:
        os.system(f"code --install-extension {extension}")
    os.system(f"cp {current_path}/code/settings.json {home}/.config/Code/User/")
    os.system(f"cp {current_path}/code/keybindings.json {home}/.config/Code/User/")


# User Preferences
def choices():
    choice = input("Do you want to copy the editor config and fonts? (y/N)")
    if choice == "y" or choice == "Y" or choice == "yes" or choice == "Yes":
        install()
        copy_configs()
        code_extensions()
    else:
        install()


# Run the Functions
def install():
    code_neovim()
    update_upgrade()
    install_apps()
    labs()


choices()
os.chdir(current_path)
