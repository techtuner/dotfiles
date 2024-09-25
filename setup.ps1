# Need to run this as an administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Warning "You do not have Administrator rights. Run this script as Administrator."
  Exit
}

$user = $env:USERNAME

Write-Host "Configuring Windows....."
$wingetDeps = @(
  "chocolatey.chocolatey"
  "eza-community.eza"
  "github.cli"
  "ezwinports.make"
  "kitware.cmake"
  "neovim.neovim"
  "openjs.nodejs"
  "Microsoft.PowerToys"
  "Microsoft.Sysinternals.ProcessExplorer"
  "Microsoft.Sysinternals.ProcessMonitor"
  "Microsoft.Sysinternals.TCPView"
  "Mozilla.Firefox.DeveloperEdition"
  "Rustlang.Rustup"
  "Microsoft.VisualStudio.2022.Community"
)

# Function to install packages from either Chocolatey or Scoop
# Installing Chocolatey
function Install-Chocolatey {
  if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  }
  else {
    Write-Host "Chocolatey is already installed."
  }
}

# Installing Scoop
function Install-Scoop {
  if (-Not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..."
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  }
  else {
    Write-Host "Scoop is already installed."
  }
}

$choice = Read-Host "Choose a package manager: (1) Chocolatey (2) Scoop"

switch ($choice) {
  '1' {
    Install-Chocolatey
    $chocoDeps = @(
      "bat"
      "fd"
      "ripgrep"
      "lazygit"
      "fzf"
      "zoxide"
      "sudo"
      "mingw"
      "jq"
    )
    Write-Host -ForegroundColor Yellow "Installing the Choco Dependencies"
    $ChocoAppsInstalled = (choco list --limit-output --id-only).Split("`n")
    foreach ($chocoDep in $chocoDeps) {
      choco install $chocoDep -y
    }
  }

  '2' {
    Install-Scoop
    $scoopDeps = @(
      "sudo"
      "nodejs"
      "gcc"
      "curl"
      "wget"
      "jq"
      "oh-my-posh"
      "fzf"
      "cmake"
      "make"
      "docker"
      "bat"
    )

    Write-Host -ForegroundColor Yellow "Installing the Scoop Dependencies"
    foreach ($scoopDep in $scoopDeps) {
      scoop install $scoopDep
    }
  }
}

# $psModules = @(
#   "CompletionPredictor"
#   "PSScriptAnalyzer"
#   "PSFzf"
#   "posh-git"
#   "Terminal-Icons"
# )

$code_extensions = @(
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
  "christian-kohler.npm-intellisense"
  "christian-kohler.path-intellisense"
  "ms-vscode.powershell"
  "esbenp.prettier-vscode"
  "ms-python.python"
  "rust-lang.rust-analyzer"
  "redhat.vscode-yaml"
  "twxs.cmake"
  "BeardedBear.beardedtheme"
  "reiisen.hi"
  "Nur.just-black"
  "sumneko.lua"

)

Set-Location $PSScriptRoot
[Environment]::CurrentDirectory = $PSScriptRoot

Write-Host -ForegroundColor Yellow "Installing the Winget dependencies"
$WingetAppsInstalled = winget list | Out-String
foreach ($wingetDep in $wingetDeps) {
  winget install --id $wingetDep --disable-interactivity
}

# Path Refresh
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

Write-Host "Installing Visual Studio Code extensions"
foreach ($code_extension in $code_extensions) {
  code --install-extension $code_extension
}

mkdir D:\Projects
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell

Write-Host "Copying Files to the respective Directories"
Copy-Item $PSScriptRoot\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item $PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1 C:\Users\$user\Documents\Powershell\
# Copy-Item $PSScriptRoot\starship\starship.toml C:\Users\$user\.config\
Copy-Item $PSScriptRoot\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item $PSScriptRoot\nvim\ $env:LOCALAPPDATA -Recurse
Copy-Item $PSScriptRoot\code\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
Copy-Item $PSScriptRoot\code\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

# Write-Host -ForegroundColor Yellow "Installing PS Modules"
# foreach ($psModule in $psModules) {
#   if (!(Get-Module -ListAvailable -Name $psModule)) {
#     Install-Module -Name $psModule -Force -AcceptLicense -Scope CurrentUser
#   }
# }
