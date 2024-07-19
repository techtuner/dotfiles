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
"git.git"
"github.cli"
"ezwinports.make"
"kitware.cmake"
"microsoft.powershell"
"neovim.neovim"
"openjs.nodejs"
"starship.starship"
"Microsoft.VisualStudioCode"
)

$chocoDeps= @(
"bat"
"fd"
"ripgrep"
"lazygit"
"fzf"
"zoxide"
"python"
"go"
"oh-my-posh"
"sudo"
"mingw"
"jq"
)

$psModules = @(
"CompletionPredictor"
"PSScriptAnalyzer"
"PSFzf"
"posh-git"
"Terminal-Icons"
)

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
  "equinusocio.vsc-material-theme"
  "equinusocio.vsc-material-theme-icons"
  "christian-kohler.npm-intellisense"
  "christian-kohler.path-intellisense"
  "ms-vscode.powershell"
  "esbenp.prettier-vscode"
  "ms-python.python"
  "rust-lang.rust-analyzer"
  "redhat.vscode-yaml"
  "twxs.cmake"
  "jdinhlife.gruvbox"
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

Write-Host -ForegroundColor Yellow "Installing the Choco Dependencies"
$ChocoAppsInstalled = (choco list --limit-output --id-only).Split("`n")
foreach ($chocoDep in $chocoDeps) {
  choco install $chocoDep -y
}


# code&
Write-Host "Installing Visual Studio Code extensions"
foreach ($code_extension in $code_extensions){
  code --install-extension $code_extension
}

mkdir D:\Projects
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell

Write-Host "Copying Files to the respective Directories"
Copy-Item $PSScriptRoot\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item $PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1 C:\Users\$user\Documents\Powershell\
Copy-Item $PSScriptRoot\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item $PSSCriptRoot\nvim\ $env:LOCALAPPDATA -Recurse
Copy-Item $PSScriptRoot\code\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
Copy-Item $PSScriptRoot\code\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse


Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1


bat cache --clear
bat cache --build

pwsh"&"

Write-Host -ForegroundColor Yellow "Installing PS Modules"
foreach ($psModule in $psModules) {
  if(!(Get-Module -ListAvailable -Name $psModule)){
    Install-Module -Name $psModule -Force -AcceptLicense -Scope CurrentUser
  }
}

Restart-Computer
