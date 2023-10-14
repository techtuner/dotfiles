import os
import subprocess

current_path = os.getcwd()
user = os.getlogin()
home = f"/home/{user}"
tools_path = "/opt"
git_tools_path = f"{tools_path}/GitTools"


def update_system():
    os.system("sudo apt-get update -y")
    os.system("sudo apt-get upgrade -y")
    os.system("sudo apt autoremove -y")


def rust():
    os.system("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")
    os.system('source "$HOME/.cargo/env"')


def install_apps():
    os.system("sudo snap install code --classic")
    os.system("sudo snap install nvim --classic")
    os.system("sudo snap install spotify --classic")
    apps = "bless adb python3-pip3 curl dnsrecon gobuster python3-impacket nbtscan nikto onesixtyone redis-tools smbclient smbmap snmp sslscan sipvicious whatweb wkhtmltopdf libimage-exiftool-perl golang-go python3-ldap3 python3-yaml ldnsutils strace dnsutils yersinia dhcpstarv steghide protobuf-compiler httrack ruby"
    app_list = apps.split(" ")
    for app in app_list:
        os.system(f"sudo apt-get install {app} -y")
    os.system("python3 -m pip3 install pip==22.2.2 --upgrade --break-system-packages")
    os.system("cargo install urlencode")
    os.system("cargo install rustscan")
    os.system("chmod +x ./source_files.sh")
    subprocess.call(["sh", f"{current_path}/source_files.sh"])
    os.system(
        "sudo python3 -m pip3 install git+https://github.com/Tib3rius/AutoRecon.git"
    )
    os.chdir(tools_path)
    os.system("sudo wget https://download.sysinternals.com/files/PSTools.zip")
    os.system("sudo mkdir PSTools")
    os.system("sudo unzip PSTools.zip -d PSTools")
    os.system("sudo rm -rf PSTools.zip")
    os.chdir(tools_path)
    os.system(
        "sudo wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage"
    )
    os.system(f"sudo chmod +x {tools_path}/nvim.appimage")
    os.system(f"sudo ln -s {tools_path}/nvim.appimage /usr/bin/nvim")
    os.chdir(tools_path)
    os.system(
        f"sudo wget https://storage.googleapis.com/caido-releases/v0.28.0/caido-desktop-linux-v0.28.0-9799aa77.AppImage"
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
    os.system("pip3 install -r requirements.txt")
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
        "python3 -m pip3 install --upgrade git+https://github.com/fportantier/habu.git"
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
    os.system("pip3 install -r requirements.txt")
    os.system("pip3 install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/BillCipher/")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/sherlock-project/sherlock.git")
    os.chdir(f"{tools_path}/sherlock")
    os.system(f"python3 -m pip3 install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/sherlock/sherlock/sherlock.py")
    os.system(
        f"sudo ln -s {tools_path}/sherlock/sherlock/sherlock.py /usr/bin/sherlock"
    )
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/s0md3v/Photon")
    os.chdir(f"{tools_path}/Photon")
    os.system(f"python3 -m pip3 install -r requirements.txt")
    os.system(f"sudo chmod +x {tools_path}/Photon/photon.py")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/Moham3dRiahi/Th3inspector.git")
    os.chdir(f"{tools_path}/Th3inspector")
    os.system(f"sudo chmod +x {tools_path}/Th3inspector/install.sh")
    os.system(f"sudo {tools_path}/Th3inspector/install.sh")
    os.chdir(tools_path)
    os.system("pip3 install raccoon-scanner")
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
    os.system("sudo pip3 install -r requirements.txt")
    os.system(f"sudo ln -s {tools_path}/Sublist3r/sublist3r.py /usr/bin/sublist3r")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/ffuf/ffuf")
    os.chdir(f"{tools_path}/ffuf")
    os.system("go get")
    os.system("go build")
    os.chdir(tools_path)
    os.system("sudo git clone https://github.com/wifiphisher/wifiphisher.git")
    os.chdir(f"{tools_path}/wifiphisher")
    os.system("sudo python3 setup.py install")
    os.chdir(tools_path)
    os.system("sudo git clone https://www.github.com/ticarpi/jwt_tool")
    os.chdir(f"{tools_path}/jwt_tool")
    os.system("pip3 install termcolor cprint arjun requests pycryptodomex prowler")
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
    os.chdir(f"cd {tools_path}/GRecon")
    os.system("sudo pip3 install -r requirements.txt")
    os.chdir(tools_path)

    os.system(
        "sudo wget https://dl.pstmn.io/download/latest/linux_64 -O postman-linux-x64.tar.gz"
    )
    os.system("sudo tar -xvzf postman-linux-x64.tar.gz")
    os.system(f"sudo ln -s {tools_path}/Postman/Postman /usr/bin/postman")
    os.chdir(tools_path)
    os.system(
        "sudo wget https://repo1.maven.org/maven2/org/python3/jython-standalone/2.7.3/jython-standalone-2.7.3.jar"
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


os.system(f"sudo cp -r {current_path}/fonts/'Fira Code' /usr/share/fonts/truetype")


def labs():
    os.mkdir(f"{home}/Desktop/Labs")
    os.mkdir(f"{home}/Desktop/Bug-Bounty")

    folder_list = ["HTB", "THM", "CTF", "CTF/Pico", "CTF/Meta", "CTF/Embed"]
    for folder in folder_list:
        os.mkdir(f"{home}/Desktop/Labs/{folder}")


def copy_configs():
    os.system(f"{current_path}/wallpapers {home}/Pictures/")
    os.system(f"sudo cp -r {current_path}/nvim/ {home}/.config")


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
        "antfu.theme-vitesse",
        "ms-azuretools.vscode-docker",
        "auiworks.amvim",
        "rangav.vscode-thunder-client",
    ]
    for extension in extensions:
        os.system(f"code --install-extension {extension}")
    os.system(f"cp {current_path}/code/settings.json {home}/.config/Code/User/")
    os.system(f"cp {current_path}/code/keybindings.json {home}/.config/Code/User/")


update_system()
rust()
install_apps()
labs()
copy_configs()
code_extensions()

os.chdir(current_path)
