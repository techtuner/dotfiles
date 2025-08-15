. "$PSSCriptRoot/show-progress.ps1"

function Install-AppxSilent {
     param ([string]$url)

    $file = "$env:TEMP\" + ($url -split "/")[-1]
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction SilentlyContinue
    Add-AppxPackage -Path $file -ErrorAction SilentlyContinue > $null
}



function Install-Winget {
    Write-Host "Installing Winget Application"
    showProgress

    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Winget is already installed"
    }
    else {
        Write-Host "Winget is not installed. Installing..."
        $wingetURL="https://aka.ms/getwinget"
        $downloadPath = "$env:TEMP\winget.msixbundle"

        
        $frameworks = @(
            "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx",
            "https://aka.ms/Microsoft.UI.Xaml.2.7.appx"
            )
            foreach ($url in $frameworks) {
                Install-AppxSilent -url $url
            }
            
            Invoke-WebRequest -Uri $wingetURL -OutFile $downloadPath -UseBasicParsing -ErrorAction SilentlyContinue
    Add-AppxPackage -Path $downloadPath -ErrorAction SilentlyContinue > $null
    
     if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Winget installed successfully!"
        exit 1
    } else {
        Write-Host "Failed to install Winget. Please check requirements (Windows 10 1809+)."
    }
}
}

function Install-WingetApps {
   $apps=@(
    @{Name = "Brave Browser"; Id = "Brave.Brave"},
    @{Name = "Microsoft Visual Studio Code"; Id = "Microsoft.VisualStudioCode"},
    @{Name = "7-zip"; Id = "7zip.7zip"},
    @{Name = "Git"; Id = "Git.Git"},
    @{Name = "Flameshot"; Id = "Flameshot.Flameshot"},
    @{Name = "Spotify"; Id = "Spotify.Spotify"},
    @{Name = "VMWare Workstation Pro"; Id = "VMware.WorkstationPro"},
    @{Name = "Google Drive"; Id = "Google.Drive"},
    @{Name = "VLC Media Player"; Id = "VideoLAN.VLC"},
    @{Name = "Microsoft Teams"; Id = "Microsoft.Teams"},
    @{Name = "Zotero"; Id = "DigitalScholar.Zotero"},
    @{Name = "Obsidian"; Id = "Obsidian.Obsidian"},
    @{Name = "Steam"; Id = "Valve.Steam"},
    @{Name = "Adobe Acrobat Reader"; Id = "Adobe.Acrobat.Reader.64-bit"},
    @{Name = "Wireshark"; Id = "WiresharkFoundation.Wireshark"},
    @{Name = "Rust"; Id = "Rustlang.Rustup"}
   )

    foreach ($app in $apps) {
        $name = $app.Name
        $id = $app.Id

$isInstalled = winget list --id $id | Select-String "$id"

        if (-not $isInstalled) {
            Write-Host "Installing $name..."
            try{
                winget install --id "$id" --exact --silent  --force --accept-source-agreements --accept-package-agreements
                Write-Host "$name installed successfully"
            }
            catch {
                Write-Warning "Failed to install $name : $_"
            }
        }
        else {
            Write-Host "$name is already installed"
        }
    }
}