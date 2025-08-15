# Import Variables
$Script:RootPath = Split-Path $PSScriptRoot -Parent
$Global:RootPath = $Script:RootPath
# Check if the script is being run as Root
function Ensure-Administrator {
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Warning "You do not have Administrator rights. Run this script as Administrator."
        Exit
    }
}

function Ensure-NuGetProvider {
    Write-Host "Checking for NuGet provider..."

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $nugetProvider = Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue

    if (-not $nugetProvider) {
        Write-Host "`n === NuGet provider not found. Installing silently... ===`n"

        try {
            Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser -ErrorAction Stop | Out-Null
            Import-PackageProvider -Name NuGet -Force -ErrorAction Stop | Out-Null
            Write-Host "NuGet provider installed and imported."
        }
        catch {
            Write-Warning "Failed to install NuGet provider: $_"
        }
    }
    else {
        Write-Host "NuGet provider already installed."
    }
}

    # Import Functions
    . "$PSScriptRoot/functions/show-progress.ps1"
    . "$PSScriptRoot/functions/scoop.ps1"
    . "$PSScriptRoot/functions/vscode.ps1"
    . "$PSScriptRoot/functions/powershell-module.ps1"
    . "$PSScriptRoot/functions/copy-config.ps1"
    . "$PSScriptRoot/functions/winget.ps1"
    . "$PSScriptRoot/functions/restart.ps1"

    # Function Entry
    function Main {
        Ensure-Administrator
        Ensure-NuGetProvider
        Install-Winget
        Install-WingetApps
        showProgress
        Write-Host "`n=== Starting Windows Dev Environment Setup ===`n"
        Install-Scoop
        Install-ScoopApps
        Write-Host "`n===Launching VSCode to prepare for extension installation... ===`n" -ForegroundColor Cyan
        Start-Process "code"
        Start-Sleep -Seconds 10  # Give it time to initialize
        showProgress
        Install-VScodeExtensions
        showProgress
        Install-PowershellModules
        showProgress
        Copy-Configuration
        Write-Output "`n=== Setup Completed ===`n"
        Restart-TerminalComp
    }



    #  Start Script
    Main
