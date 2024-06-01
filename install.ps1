Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$user = $env:USERNAME

function scoop_packages() {
  $scoop_apps = "sudo", "nvm", "gcc", "wget", "curl", "jq", "neovim", "gh", "oh-my-posh", "fzf", "cmake", "make", "docker", "starship", "bat"

  foreach ($app in $scoop_apps) {
    scoop install $app
  }
}

function code_extensions() {
  $extension_list = "ms-python.python",
  "naumovs.color-highlight",
  "ms-azuretools.vscode-docker",
  "golang.go",
  "christian-kohler.path-intellisense",
  "enkia.tokyo-night",
  "redhat.vscode-yaml",
  "aaron-bond.better-comments",
  "twxs.cmake",
  "vadimcn.vscode-lldb",
  "editorconfig.editorconfig",
  "usernamehw.errorlens",
  "kisstkondoros.vscode-gutter-preview",
  "yzhang.markdown-all-in-one",
  "rust-lang.rust-analyzer",
  "pkief.material-icon-theme",
  "antfu.icons-carbon",
  "ms-vscode.powershell"

  foreach ($extension in $extension_list) {
    code --install-extension $extension
  }
  Copy-Item .\code\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
  Copy-Item .\code\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
}

# Installing Scoop Pacakage Manager
Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"

scoop_packages

# Create Directories
mkdir D:\Projects
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell

Copy-Item .\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item .\powershell\Microsoft.PowerShell_profile.ps1 C:\Users\$user\Documents\Powershell\
Copy-Item .\starship\starship.toml ~\.config\
Copy-Item .\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item .\nvim\ $env:LOCALAPPDATA -Recurse

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

code_extensions

nvm install lts
nvm use lts
