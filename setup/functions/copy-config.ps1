. "$PSScriptRoot/show-progress.ps1"

$possiblePath = @(
  @{ Name = "Windows Terminal"; Path = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" },
  @{ Name = "Windows Terminal Preview"; Path = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" },
  @{ Name = "WinGet or Scoop version"; Path = "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json" }
)
function Copy-Configuration {
  $basePath = $PSScriptRoot
  $sourceRoot = "$basePath/fonts"
  $fontFiles = Get-ChildItem -Path $basePath\* -Include *.ttf, *.otf -Recurse -File
  $fontFolder = "$env:windir\Fonts"
  $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"


  $found = $false
  $settingsSource = Resolve-Path "$basePath\..\..\configs\windows-terminal\settings.json" -ErrorAction SilentlyContinue

  foreach ($entry in $possiblePath) {
    $targetPath = $entry.Path
    if (Test-Path (Split-Path $targetPath)) {
      $found = $true
      Write-Host "`n Detected: $($entry.Name)`n"
      if ($settingsSource) {
        Copy-Item $settingsSource -Destination $targetPath -Force
        Write-Host "Copied Windows Terminal settings to $targetPath"
      }
      else {
        Write-Warning "Could not find settings.json at $settingsSource"
      }
    }
  }

  Write-Host "Copying Fonts..."
  foreach ($font in $fontFiles) {
    $fontName = $font.Name
    $fontTargetPath = Join-Path -Path $fontFolder -ChildPath $fontName
    if (-not (Test-Path $fontTargetPath)) {
      Write-Host "Installing font: $fontName"
      Copy-Item -Path $font.FullName -Destination $fontFolder
    }
    else {
      Write-Host "Font already installed: $fontName"
    }
    $displayName = [System.IO.Path]::GetFileNameWithoutExtension($fontName) + " (TrueType)"
    New-ItemProperty -Path $regPath -Name $displayName -PropertyType String -Value $fontName -Force
  }
  Add-Type -AssemblyName PresentationCore
  [System.Windows.Media.Fonts]::GetFontFamilies($fontFolder) > $null

  Write-Host "`nFonts installed successfully`n"

  New-Item -ItemType Directory -Path ~\Documents\PowerShell -Force | Out-Null
  New-Item -ItemType Directory -Path ~\.config\powershell -Force | Out-Null
  New-Item -ItemType Directory -Path ~\workspace -Force | Out-Null
  showProgress
  Write-Host "Copying Configuration"
  Copy-Item "$basePath\..\..\configs\powershell\user_profile.ps1" "$env:USERPROFILE\.config\powershell" -Force
  Copy-Item "$basePath\..\..\configs\powershell\Microsoft.Powershell_profile.ps1" "$env:USERPROFILE\Documents\PowerShell" -Force
  Copy-Item "$basePath\..\..\configs\nvim" "$env:LOCALAPPDATA\nvim" -Recurse -Force
  Copy-Item "$basePath\..\..\configs\code\*.json" "$env:APPDATA\Code\User" -Recurse -Force
  Unblock-File -Path "$env:USERPROFILE\.config\powershell\user_profile.ps1"
  Unblock-File -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.Powershell_profile.ps1"
}
