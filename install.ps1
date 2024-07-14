Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$user = $env:USERNAME

function scoop_packages() {
  $scoop_apps = "sudo", "nodejs", "gcc", "wget", "curl", "jq", "neovim", "gh", "oh-my-posh", "fzf", "cmake", "make", "docker", "starship", "bat"

  foreach ($app in $scoop_apps) {
    scoop install $app
  }
}

function code_extensions() {
  $extension_list = "formulahendry.auto-close-tag",
  "formulahendry.auto-rename-tag",
  "formulahendry.auto-complete-tag",
  "aaron-bond.better-comments",
  "antfu.icons-carbon",
  "formulahendry.code-runner",
  "vadimcn.vscode-lldb",
  "naumovs.color-highlight",
  "ms-azuretools.vscode-docker",
  "editorconfig.editorconfig",
  "usernamehw.errorlens",
  "dsznajder.es7-react-js-snippets",
  "dbaeumer.vscode-eslint",
  "golang.go",
  "kisstkondoros.vscode-gutter-preview",
  "yzhang.markdown-all-in-one",
  "pkief.material-icon-theme",
  "equinusocio.vsc-material-theme",
  "equinusocio.vsc-material-theme-icons",
  "christian-kohler.npm-intellisense",
  "christian-kohler.path-intellisense",
  "ms-vscode.powershell",
  "esbenp.prettier-vscode",
  "ms-python.python",
  "rust-lang.rust-analyzer",
  "redhat.vscode-yaml",
  "twxs.cmake",
  "jdinhlife.gruvbox"

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
Copy-Item .\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item .\nvim\ $env:LOCALAPPDATA -Recurse

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

code_extensions
