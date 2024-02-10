Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$user = $env:USERNAME

function scoop_packages() {
    $scoop_apps = "sudo", "nvm", "gcc", "wget", "curl", "jq", "neovim", "gh", "oh-my-posh", "fzf"
    foreach ($app in $scoop_apps) {
        scoop install main/$app
    }
}

Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"

scoop_packages

function code_extensions() {
    $extension_list = "rust-lang.rust-analyzer",
    "artdiniz.quitcontrol-vscode",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "esbenp.prettier-vscode",
    "ms-vscode.powershell",
    "christian-kohler.path-intellisense",
    "yzhang.markdown-all-in-one",
    "sumneko.lua",
    "kisstkondoros.vscode-gutter-preview",
    "jdinhlife.gruvbox",
    "golang.go",
    "miguelsolorio.fluent-icons",
    "tamasfe.even-better-toml",
    "usernamehw.errorlens",
    "ms-azuretools.vscode-docker",
    "serayuzgur.crates",
    "naumovs.color-highlight",
    "vadimcn.vscode-lldb",
    "catppuccin.catppuccin-vsc-icons",
    "aaron-bond.better-comments"


    foreach ($extension in $extension_list) {
        code --install-extension $extension
    }

    Copy-Item .\code\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
    Copy-Item .\code\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
}

# Create Directories
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell

Copy-Item .\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item .\powershell\Microsoft.PowerShell_profile.ps1 C:\Users\$user\Documents\Powershell\
Copy-Item .\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item .\nvim\ $env:LOCALAPPDATA -Recurse

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

code_extensions

Install-Module -Name posh-git -Scope CurrentUser -Force
Install-Module -Name PSFzf -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force