Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$user = $env:USERNAME

function choco_packages() {
    $choco_apps = "sudo", "nvm", "python", "golang", "brave", "adobereader", "vlc", "winrar", "wget", "curl", "powertoys", "jq", "neovim", "gh", "rust", "oh-my-posh", "fzf", "notion"

    foreach ($app in $choco_apps) {
        choco install $app -y
    }
}

function code_extensions() {
    $extension_list = "formulahendry.auto-complete-tag",
    "formulahendry.auto-rename-tag",
    "naumovs.color-highlight",
    "miguelsolorio.fluent-icons",
    "miguelsolorio.symbols",
    "golang.go",
    "visualstudioexptteam.vscodeintellicode",
    "ritwickdey.liveserver",
    "sumneko.lua",
    "yzhang.markdown-all-in-one",
    "christian-kohler.path-intellisense",
    "esbenp.prettier-vscode",
    "steoates.autoimport",
    "dbaeumer.vscode-eslint",
    "bradlc.vscode-tailwindcss",
    "ms-python.python",
    "ms-python.black-formatter",
    "aaron-bond.better-comments",
    "wix.vscode-import-cost",
    "usernamehw.errorlens",
    "wayou.vscode-todo-highlight",
    "equinusocio.vsc-community-material-theme",
    "kisstkondoros.vscode-gutter-preview", ,
    "ms-vscode.powershell",
    "yummygum.city-lights-theme",
    "silofy.hackthebox",
    "inci-august.august-themes",
    "rust-lang.rust-analyzer",
    "ms-python.vscode-pylance",
    "vadimcn.vscode-lldb",
    "bungcip.better-toml",
    "serayuzgur.crates"

    foreach ($extension in $extension_list) {
        code --install-extension $extension
    }

    Copy-Item .\code\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
    Copy-Item .\code\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse

}

# Create Directories
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell
mkdir D:\Projects
mkdir D:\Notes

Copy-Item .\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item .\powershell\Microsoft.PowerShell_profile.ps1
Copy-Item .\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item .\nvim\ $env:LOCALAPPDATA -Recurse

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

# Downloading Choco Package Manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Output "More packages available at : https://community.chocolatey.org/packages "

# Installing the required apps
choco_packages

# Installing Visual Studio Extensions
code_extensions

# Install Scoop Package manager to install gcc
Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
scoop install gcc

Install-Module -Name posh-git -Scope CurrentUser
Install-Module -Name PSFzf -Scope CurrentUser